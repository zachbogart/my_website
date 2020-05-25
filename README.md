# Personal Website

- [Hugo Academic Docs](https://sourcethemes.com/academic/docs/)

## Making a post?
1. Navigate to `content/post`
1. Make a new folder, titled with `YYYY-MM-DD-<quickblurb>`
2. Add new file, `index.Rmd`
  - Working in python? Make normla jupyter file and convert to markdown when finished
3. Add front matter meta-stuff between triple hyphens:

```
---
title: "post_title"  
date: YYYY-MM-DD  
categories:  
  - main_grouping  
  - code_language_used_for_example  
tags:  
  - realted_to_post_tags  
slug: "url_path_name_multi_words_use_hyphens"  
---
```

4. Can add other thigns as well to front matter:
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