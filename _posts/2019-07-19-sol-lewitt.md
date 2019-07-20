---
layout: post
title:  "Sol LeWitt's 'Tower'"
tags: [Plotter]
---

I recently discovered the art of [Sol LeWitt](https://en.wikipedia.org/wiki/Sol_LeWitt), a fantastic multimedia artist whose work I found inspirational in discovering bounds of making art with a plotter printer. His _Tower_ sculpture caught my eye and I was very much interested in seeing if I could replicate it to be compatible with my plotter work. Drawing lines where the carvings are would be the easiest approach.

<figure class="image--inline-left">
  <img class="cap-height" src="https://upload.wikimedia.org/wikipedia/en/a/aa/Tower_1984.jpg">
  <figcaption><i>Tower</i> – Sol LeWitt</figcaption>
</figure>

## My Approach

I first focused on the more interesting, but challenging, rhombus at the bottom of the tower. Because this will ultimately be done using pen and paper rather than as a 3 dimensional sculpture, I had to find an acceptable way of defining the shape of the rhombus without actually drawing it.

I started by drawing a rhombus and filling it evenly inside. Then I let each rhombus know the size of the container that it is in so that it could draw lines from the edges of it's container. The part that took the longest was figuring out that I could draw uninhibited vertical lines up until the edges of the rhombus, and then draw two sets of lines from either side of the rhombus otherwise. The line length was interpolated from the center of the rhombus up to the extent (furthest points from center);

<figure>
  <img src="/assets/images/rhombus1.svg">
  <figcaption>Rhombus1</figcaption>
</figure>

## Making a Tower

Now that I could draw a single shape, I had to modify the code to randomly choose a stroke direction for a shape on creation and fill it accordingly. After branching the filling functions I could create two separate, random tiles of rhombuses.

<figure>
  <img src="/assets/images/rhombus2.svg">
  <figcaption><a href="https://glitch.com/~sol-lewitt-tower-1" target="_blank">Rhombus2</a></figcaption>
</figure>

Having this code in place makes it very straightforward to create the other shapes on the tower. The code for the tower is available on Glitch in the [sol-lewitt-tower-1](https://glitch.com/~sol-lewitt-tower-1) project. I added support for triangles. Other shapes such as squares, trapezoids, and circles should be easy to add as well. That's left as an exercise for the reader.

## Happy Accidents

While I was attempting to correct the filling code, my haphazard approach to math created some wonderful looking shapes. I have collected a handful of them here, hopefully they may be of use or inspiration later. Most of the errors came trying to `lerp` the absolute percentage between the left and the right corners of the rhombus, which created strange behavior as the function swept from the top of the rhombus downward.

<figure>
  <img src="/assets/images/rhombus3.svg">
</figure>

<figure>
  <img src="/assets/images/rhombus4.svg">
</figure>

<figure>
  <img src="/assets/images/rhombus5.svg">
</figure>