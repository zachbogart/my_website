# Personal Website

- [Hugo Academic Docs](https://sourcethemes.com/academic/docs/)

## Where is everything?
- work out of `content`
- parameters and config stuff can be found in `config` and `config.toml`

## Making a post?
1. Navigate to `content/post`
1. Make a new folder, titled with `YYYY-MM-DD-<quickblurb>`
2. Add new file, `index.Rmd`
3. Add front matter meta-stuff between triple hyphens:

```
---
title: "TODO_post_title"  
date: YYYY-MM-DD  
categories:  
  - TODO_main_grouping  
  - TODO_code_language_used_for_example  
tags:  
  - TODO_related_to_post_tags  
slug: "TODO_url_path_name_multi_words_use_hyphens"  
links:
- icon: mug-hot
  icon_pack: fas
  name: Give a Coffee
  url: https://ko-fi.com/zachbogart
---
```

4. Can add other things as well to front matter:
- Can add `image` to front matter for `preview_only` for example
- Or links to external things (there are a lot of [easily acessible icons](https://sourcethemes.com/academic/docs/page-builder/#icons) to choose from)

```
image:
  placement: 1
  focal_point: Smart
  preview_only: true

links:
- icon: external-link-alt
  icon_pack: fas
  name: 
  url: 
```

## Working in Python?
- The above info applies
1. Create `.ipynb` file to work out of
2. Make first cell markdown with front matter (as above). Make sure to include slug.
3. When ready to update/publish, run this command:

```
jupyter nbconvert <notebook_name> --to markdown --output index.md
```

- it will generate the markdown file and any images will go to a `index_files` folder

## Adding A Noun as an Image
1. Go to [your noun page on Noun Project](https://thenounproject.com/zachbogart/)
2. Find desired icon and save it as a PNG (copy url to icon)
  - Save to folder as `featured.png` to make it the main image
  - Copy the URL icon for later to add to post
3. Open the PNG in Preview and remove the attribution
  - Crop it out 
4. Resize PNG to be small
  - `Tools > Adjust Size...`
  - Make it around 100 px by 100 px
5. Add image credit at end of post:

```
#### Image Credit
[ICON_TITLE](URL_TO_ICON) by Zach Bogart from [the Noun Project](https://thenounproject.com/) 
```
  
  
  
  