---
layout: post
title:  "Projection Plotting"
tags: [Plotter, 3D, Projection]
---

This post is a quick overview of my current experiment with projection plotting. The idea is to plot
lines in 3D onto a 2D plane with some perpsective.

<figure>
  <img src="/assets/images/projection1.svg">
  <figcaption><a href="https://glitch.com/~projection1">projection1</a></figcaption>
</figure>

First I built the points of a `Box` with a given `x`, `y`, and `z` coordinates along with provided
`width`, `depth`, and `height` measures. I assumed that X is to the right, Y is up, and Z is
positive away from the camera. Then, assuming the camera is at the origin, it was simple to
interpolate the intersection on a plane of a ray between the camera and a given point in 3D. I
followed [this diagram](https://en.wikipedia.org/wiki/3D_projection#Diagram) off of Wikipedia as a
guide.

```js
const focalDistance = 120;
function project(x, y, z) {
  return [x * (focalDistance / z), y * (focalDistance / z)];
}
```

I arrived at a focal distance of 120 through experimentation and some guessing. It's not immediately
clear to me how to estimate a focal distance in a pixel-based viewport, but I'm working toward
figuring it out.

### Generating more boxes

After being able to generate some identical boxes I moved on to morphing the box shapes in some way.
I experimented with increasing the height as more boxes were added:

<figure>
  <img src="/assets/images/projection2.svg">
  <figcaption><a href="https://glitch.com/~projection2">projection2</a></figcaption>
</figure>

Now the lines in the boxes are much more dense in the middle as they start to overlap and morph into
each other. There are some interesting effects when some of the lines are removed:

<figure>
  <img src="/assets/images/projection3.svg">
  <figcaption><a href="https://glitch.com/~projection2-5">projection2-5</a></figcaption>
</figure>

### Next Steps

I am interested in how I can implement occlusion along with this projection technique. I am inspired
by Michael Fogleman's [`ln`](https://github.com/fogleman/ln) project, which seems to subdivide lines
into many pieces and then tests if a ray from the tip of that line to the camera intersects any
other shapes.

I believe this works well due to the limited amount of "pure" shapes that the library provides;
shapes that have definite mathematical methods to determine occlusion.