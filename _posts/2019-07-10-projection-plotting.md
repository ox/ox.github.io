---
layout: post
title:  "Projection Plotting"
tags: [Plotter, 3D]
---

This post is a quick overview of my current experiment with projection plotting. The idea is to plot lines in 3D onto a 2D plane with some perpsective.

<img src="/images/perspective-1.svg">

You can find the code that generated the previous image in a Glitch project I prepared called <a href="https://glitch.com/~projection1">perspective-1</a>.

First I built the points of a `Box` with a given `x`, `y`, and `z` coordinates along with provided `width`, `depth`, and `height` measures. I assumed that X is to the right, Y is up, and Z is positive away from the camera. Then, assuming the camera is at the origin, it was simple to interpolate the intersection on a plane of a ray between the camera and a given point in 3D. I followed [this diagram](https://en.wikipedia.org/wiki/3D_projection#Diagram) off of Wikipedia as a guide.

```js
const focalDistance = 120;
function project(x, y, z) {
  return [x * (focalDistance / z), y * (focalDistance / z)];
}
```

I arrived at a focal distance of 120 through experimentation. There are no explicit units other than the pixel width/height of the canvas in these calculations, which made it harder to estimate sizes and proportions for the boxes.
