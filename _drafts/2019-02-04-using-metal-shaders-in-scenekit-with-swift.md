---
layout: post
title: "Using Metal Shaders in SceneKit with Swift"
---

# Metal Shaders

In this post we will add a Metal shader to an existing SceneKit scene, exploring both adding a shader to a material as well as hooking into SceneKit's rendering pipeline. At the end of the post you should be able to shade a simple box, as well as encoding a shading step to color the background of the view.

## Setup and Making a Box

We will start with a single-view app, adding in a SCNView and wiring up the default `ViewController`. Don't forget to add a camera view so we can actually see our box.https://github.com/ox/ox.github.io

TODO: show basic setup with box and camera

## Shading the Box using `SCNProgram`

Now that we have a box, lets create a shader to color it in some way and attach that shader program to a material.

TODO: make shader that accepts some arbitrary floats for RGB coloring

## Hooking into the `SCNSceneRendererDelegate` Protocol

We can also add Metal shaders directly into the rendering pipeline SceneKit uses to render your view. 

TODO: Use encoders, find some camera image textures to do YCbCr to sRGB in a Metal shader instead of in the CPU
