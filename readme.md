## Building

You need to have the `bundler` gem installed:

```
sudo gem install bundler
```

Then install the gems in the `Gemlock` into the vendored gem folder:

```
bundle install --path vendor/bundle
```

## Running

Run the Jekyll process:

```
bundle exec jekyll serve
```

You can then visit the active site at [http://127.0.0.1:4000].