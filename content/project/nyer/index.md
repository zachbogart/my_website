---
title: New Yorker Covers
subtitle: Smoosh 4620 New Yorker Covers together and see what we get
summary: 90 Years of New Yorker Covers
tags:
- data
date: "2016-07-12"

image:
  preview_only: false
  
links:
- icon: external-link-alt
  icon_pack: fas
  name: Viz (PDF)
  url: nyerCovers.pdf
---

This project is a blend of my interest in data visualizations and The New Yorker. I had been reading [The New Yorker](https://www.newyorker.com/) for a few years and loved seeing the variety of art that graced the cover each week. I wanted to see how The New Yorker covers had changed over time. To do this, I collected every cover of The New Yorker from 1925 to 2015, found the average color values, and presented them as one image.

The images were collected using a [PhantomJS](http://phantomjs.org/) script that took a little snapshot of each cover. These snapshots were then sent to [Martin Krzywinski’s Image Color Summarizer](http://mkweb.bcgsc.ca/color-summarizer/), which calculated the top ten average color values within the image. Because of the high clustering and precision, each image took about a minute to analyze. To automate the process, I used a [Raspberry Pi](https://www.raspberrypi.org/) to run a [Python](https://www.python.org/) script that collected the average color values and percentages. Even with this setup, the dataset took over 80 hours to complete.

Once the data was collected, I used [Processing](https://processing.org/) to feed in the dataset as a CSV, produce color percentage bars for every cover, and save the result as a PDF. From there I used [InDesign](https://www.adobe.com/products/indesign.html) and [Photoshop](https://www.adobe.com/products/photoshop.html) to create a layout for the visualization that provided some context as well as a style that was reminiscent of the covers themselves.

The finished product shows 4,620 covers of The New Yorker on a macroscopic scale, spanning nine decades. It is interesting to see the fluctuations in the color palettes such as the light covers of the late seventies and early eighties, or the dark stretch of covers in the nineties.

## Some Stats

- 4,620 Issues
- 46,200 Color Bars
- Year Range: 1925–2015
- Issue Range: February 21, 1925–DEC. 21 & 28, 2015
- Sum of All Cover Prices: $6,608.81
- Mean Cover Price: $1.43
- Mode Cover Price: $0.15
- Cover Price Range: $0.15–$8.99

Dataset Source: [newyorker.com](https://www.newyorker.com/)

