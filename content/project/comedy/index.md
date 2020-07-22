---
title: Ribaldry in Stand-Up
subtitle: How comedians work blue.
summary: Exploration of Stand-Up Comedy Specials Ordered by Relative Ribaldry
tags:
- data
date: "2019-09-05T00:00:00Z"

image:
  placement: 1
  focal_point: Smart

links:
- icon: external-link-alt
  icon_pack: fas
  name: Tableau Public
  url: https://public.tableau.com/profile/zach.bogart#!/vizhome/Comedy/WordClusters
- icon: external-link-alt
  icon_pack: fas
  name: Alphabetical (PDF)
  url: comedySpecials_AZ.pdf
- icon: external-link-alt
  icon_pack: fas
  name: F-Word Only (PDF)
  url: comedySpecials_fonly.pdf
- icon: external-link-alt
  icon_pack: fas
  name: Release Date (PDF)
  url: comedySpecials_years.pdf
- icon: external-link-alt
  icon_pack: fas
  name: Set Length (PDF)
  url: comedySpecials_setLength.pdf
- icon: external-link-alt
  icon_pack: fas
  name: Word Count (PDF)
  url: comedySpecials_wordCount.pdf
---

I love stand-up comedy and have watched many specials over the years. I thought a collection of comedy specials would be an interesting dataset to explore, which led me to create this project showing selected stand-up specials plotted in terms of their [ribaldry](https://en.wikipedia.org/wiki/Ribaldry#Blue_comedy), or use of swearing. When looking into analyzing comedy specials, I found practically every comedian used some collection of swear words in their act. The interesting finding was how varied its use was across different comedians and even across different specials from the same comedian. Some comedians rely heavily on them, while others rarely use them at all. Some used them often in their earlier specials, but less so in their later ones. It is interesting to see how a specific comedian uses these words to their advantage as well as when they choose to use specific types of words. By plotting the use of swearing across a comedy special, you can get a sense of a comedian’s style of comedy, how it has changed over the years, and how it differs from other comedians’ styles.

For data collection, I created a CSV that contained every timestamp and type of swear word used across several comedy stand-up specials. This CSV was fed through a [Processing](https://processing.org/) script that plotted the individual words for each special. The result is a graphic that succinctly orders and displays the relative ribaldry of selected stand-up specials. I am particularly proud of the amount of information that is contained in each plot, including the titles, the release dates, the set lengths (both numerically and visually), the individual word counts, the total word count, the relative severity of words, and the timestamps themselves.

This project involved watching a bunch of comedy specials, which was a lot of fun. I enjoyed collecting the data and hope that this project’s collection of stand-up specials will continue to grow. I encourage you to explore the current visualization and check back here periodically for new updates to the dataset.

An interactive version of the dataset is now available on my Tableau Public profile.

This version includes a word cluster map, plots of swearing timestamps, a heat table, and a plot based on gender. In addition, every page has filters allowing for custom views of the dataset. Enjoy.

Note: The Tableau version currently has data up to, and including, the specials added on January 18, 2017.

## Dataset

- 123 Specials
- 63 Comedians
- 7,830 Minutes

- All Words: 13,002 Times
- F-Word Only: 5,981 Times

Source: netflix.com, louisck.net, spotify.com

### A Note on Ordering and Word Choice

In this visualization, I define "relative ribaldry" to be the severity of selected curse words in a comedy special, meaning the curse words classified as more severe are placed higher up the axis. Derivatives of the displayed words are not differentiated between (For example, “D\*MMIT is counted as “D\*MN” & “BULLSH\*T” is counted as “SH\*T”). The y-axis shows the different kinds of curse words used in the special and is identical across all comedy specials. However, the collection of words displayed on the y-axis does not necessarily represent every recorded type of curse word for a given special. In addition, other suggestive themes may be present in individual specials that these graphics cannot accurately differentiate between. The collection of words on the y-axis was selected based on use across all specials as well as a desire to include a variety of words that varied in levels of severity. The collection may change over time due to new comedy specials being added. In addition, the ordering of the words based on severity is not intended to be an absolute ranking. Your personal preferences may rank the collection differently, but the current order hopefully provides a relative placing of the words that gives a sense of differences between comedy specials in terms of swearing.