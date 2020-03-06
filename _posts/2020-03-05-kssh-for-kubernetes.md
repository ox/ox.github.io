---
title: KSSH for Kubernetes
subtitle: Easily SSH'ing into your Kubernetes pods
---

A quick one today: getting into your Kubernetes pods for debugging. Soon after having a cluster running you will run into odd situations where your application is mis-behaving and you need to inspect it's environment. Thankfully `kubectl exec` lets you interactively run a command inside of a container and will stream the `stdin`/`stdout` back to your terminal. All you need to do is specify the exact pod and container to hook up to and `kubectl` will take care of the rest.

Our cluster had many replicas of the same pod. Most of the time it didn't matter which pod in particular I wanted to inspect. After many rounds of running `kubectl get pods | grep blah` I wrote up a bash function to automate the process. It greps list of pods for the first argument specified and launches an interactive `sh` session in the default container. You can also specify the container name with the second argument.

Usage looks like:

```
$ kssh www
connecting to <pod id> ...
```

<pre>
# SSH into first kubernetes pod with name $1
function kssh() {
  local pod="$(kubectl get pods
    | grep -E "^.*?$1.*?Running.*?$"
    | head -n 1
    | awk '{print $1}')"

  if [[ -z "${pod}" ]]; then
    echo "No such pods available"
  else
    local container=""
    if [[ ! -z "$2" ]]; then
      container="--container $2"
    fi
    echo "connecting to ${pod} $2..."
    kubectl exec -i -t "${pod}" ${container} /bin/sh
  fi
}
</pre>

It may not seem like much but it has saved me many times when trying to debug a process, inspect network conditions in a cluster, or just inspect the environment variables that Kubernetes has injected into a pod.
