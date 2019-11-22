---
layout: post
title:  "Tiled Gradients"
tags: [Plotter, Tiled]
---

Digging through my pile of [Glitch projects](https://glitch.com/@ox), I stumbled over an in-progress experiment to show a grid of hatching values. The hatching was simply evenly spaced horizontal lines. Rewinding around the source code revealed a few compelling pieces. Check out the [project on Glitch](https://glitch.com/~tiled-gradient-1) and play with `curveDensity` and how `Tile`s determine their `density`.

The code I rewound to used `Math.random()` to generate a density.

<figure>
  <img src="/assets/images/tiled-gradients/rendering-tiled-gradient-1-1574375332032.svg">
</figure>

<figure>
  <img src="/assets/images/tiled-gradients/rendering-tiled-gradient-1-1574375747898.svg">
</figure>

<figure>
  <img src="/assets/images/tiled-gradients/rendering-tiled-gradient-1-1574375744162.svg">
</figure>

I then substituted pure randomness for some Perlin noise which sampled the top-left corner coordinates of the tile to produce a value.

<figure>
  <img src="/assets/images/tiled-gradients/rendering-tiled-gradient-1-1574375277797.svg">
</figure>

<figure>
  <img src="/assets/images/tiled-gradients/rendering-tiled-gradient-1-1574376286490.svg">
</figure>

Further directions for exploration:

- selectively combining adjacent tiles
- changing the way the `density` value is drawn in the tile, either by changing drawing direction or distribution

You can play with the by remixing [the project on Glitch](https://glitch.com/~tiled-gradient-1)!
