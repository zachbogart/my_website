
---
title: "A Python Blog Post I Often Reach For"  
date: 2020-07-26  
categories:  
  - Python  
tags:  
  - pandas  
slug: "pandas-grouping-data"  
links:
- icon: mug-hot
  icon_pack: fas
  name: Give a Coffee
  url: https://ko-fi.com/zachbogart
---

I find I have to do a lot of grouping in pandas and I reach for [this blog post by Shane Lynn](https://www.shanelynn.ie/summarising-aggregation-and-grouping-data-in-python-pandas/) all the  time to remind me how to get it done. I've found grouping things in pandas difficult sometimes, usually when  I want to create a column in the original dataframe by grouping stuff. This technique solves that and I'm super grateful to it.

## So Group, Already
Learning works best when you try it out yourself, so let's give it a go! 

Say I have some  census data and  I want to group it together to get the sum of each group.
  - Dataset is from [US Census Demographics Data](https://www.kaggle.com/muonneutrino/us-census-demographic-data/data) on Kaggle


```python
df = pd.read_csv("/Users/bogart/Downloads/7001_312628_bundle_archive/acs2017_county_data.csv")
df =  df[['State', 'County', 'TotalPop']]
```


```python
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>State</th>
      <th>County</th>
      <th>TotalPop</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Alabama</td>
      <td>Autauga County</td>
      <td>55036</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Alabama</td>
      <td>Baldwin County</td>
      <td>203360</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Alabama</td>
      <td>Barbour County</td>
      <td>26201</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Alabama</td>
      <td>Bibb County</td>
      <td>22580</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Alabama</td>
      <td>Blount County</td>
      <td>57667</td>
    </tr>
  </tbody>
</table>
</div>



Using  the method from the blog post, I can make a grouped dataframe that sums up the populations for each county:


```python
df.groupby('State').agg(
    state_pop = pd.NamedAgg(column='TotalPop', aggfunc='sum')
).head(7)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>state_pop</th>
    </tr>
    <tr>
      <th>State</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Alabama</th>
      <td>4850771</td>
    </tr>
    <tr>
      <th>Alaska</th>
      <td>738565</td>
    </tr>
    <tr>
      <th>Arizona</th>
      <td>6809946</td>
    </tr>
    <tr>
      <th>Arkansas</th>
      <td>2977944</td>
    </tr>
    <tr>
      <th>California</th>
      <td>38982847</td>
    </tr>
    <tr>
      <th>Colorado</th>
      <td>5436519</td>
    </tr>
    <tr>
      <th>Connecticut</th>
      <td>3594478</td>
    </tr>
  </tbody>
</table>
</div>



If  I wrap it in a `.join()`, I can add it back to the original  dataframe to use later:


```python
df.join(df.groupby('State').agg(
    state_pop = pd.NamedAgg(column='TotalPop', aggfunc='sum')
), on='State').head(7)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>State</th>
      <th>County</th>
      <th>TotalPop</th>
      <th>state_pop</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Alabama</td>
      <td>Autauga County</td>
      <td>55036</td>
      <td>4850771</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Alabama</td>
      <td>Baldwin County</td>
      <td>203360</td>
      <td>4850771</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Alabama</td>
      <td>Barbour County</td>
      <td>26201</td>
      <td>4850771</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Alabama</td>
      <td>Bibb County</td>
      <td>22580</td>
      <td>4850771</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Alabama</td>
      <td>Blount County</td>
      <td>57667</td>
      <td>4850771</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Alabama</td>
      <td>Bullock County</td>
      <td>10478</td>
      <td>4850771</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Alabama</td>
      <td>Butler County</td>
      <td>20126</td>
      <td>4850771</td>
    </tr>
  </tbody>
</table>
</div>



## Overall

Grouping data happens a bunch,  but it can be complicated to remember  the mechanics. It can also feel sometimes like blog posts  are shouts into a  void, but they can be the best teaching tools out there! Gotta say thanks again to Shane Lynn; I review [the screenshot at the top of your blog post](https://shanelynnwebsite-mid9n9g1q9y8tt.netdna-ssl.com/wp-content/uploads/2019/10/pandas-python-group-by-named-aggregation-update.jpg) often. 

#### Image Credit
[merged dataframes](https://thenounproject.com/search/?q=dataframe&creator=4129988&i=3097973) by Zach Bogart from [the Noun Project](https://thenounproject.com/) 
