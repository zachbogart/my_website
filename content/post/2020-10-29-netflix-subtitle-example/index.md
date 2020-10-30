
---
title: "Scraping Netflix Subtitle Data: Small Example"  
subtitle: Getting at Netflix Subtitles and Exploring a Dave Chappelle joke setup
summary: Getting my hands on some of that Stove Top stuffing
date: 2020-10-29  
categories:  
  - Python  
tags:  
  - pandas  
  - beautifulsoup
slug: "netflix-subtitle-small-example"  
image:
  caption: ''
  focal_point: ''
  preview_only: yes
links:
  donate_button:
    icon: seedling
    icon_pack: fas
    name: Ways to Support
    url: /support/

---

<!-- Icon Image: Small -->
<img src="featured.png" width="100"/> 

This is a little example of parsing Netflix subtitle data. Here we look at Dave Chappelle's comedy special *Equanimity* and the story that he uses to setup a punchline he alludes to at the start of the show.

**Note About Getting Subtitles From Netflix**: I looked at [this GitHub repo](https://github.com/isaacbernat/netflix-to-srt) for a little, which helped me find the subtitle file, but parsing it wasn't working. So, I saved it off as an XML file and did it myself with python.

1. Find episode to get subtitles
2. Developer Tools > Network > file starting with `?o=`
3. Save off as an `.xml` file


```python
def make_netflix_subtitle_df(netflix_xml_file):
    '''
        Formatting from XML file of Netflix subtitles into a dataframe
    '''
    
    # open file
    with open(netflix_xml_file, 'r') as f:
        contents = f.read()
    
        # replace <br> tags with space, important to get a full string per timestamp
        contents = contents.replace('<br/>', ' ')
    
        # beautiful soup
        soup = BeautifulSoup(contents, 'html.parser')
    
    # grab p tags, loop thru and get tags/text from each
    subtitles = soup.find_all('p')
    df_dict = {}

    for ind, timestamp in enumerate(subtitles):
#         print(timestamp.attrs)
#         print(timestamp.text)

        df_dict[ind] = timestamp.attrs
        df_dict[ind]['text'] = timestamp.text
        
    # dataframe
    df = pd.DataFrame(df_dict.values())[['begin', 'end', 'text']]
    
    # format
    df['begin'] = pd.to_numeric(df.begin.str.replace('t', ''))
    df['end'] = pd.to_numeric(df.end.str.replace('t', ''))
    
    return df
```

## Dave Chappelle Fishbowl Story
- How many words before he wraps back around to the original punchline?
- How long is that gap?


```python
df = make_netflix_subtitle_df('chappelle-equanimity.xml')
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
      <th>begin</th>
      <th>end</th>
      <th>text</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>63813750</td>
      <td>72572500</td>
      <td>["Killing Me Softly with His Song" playing]</td>
    </tr>
    <tr>
      <th>1</th>
      <td>73406667</td>
      <td>100934167</td>
      <td>[woman vocalizes]</td>
    </tr>
    <tr>
      <th>2</th>
      <td>111778334</td>
      <td>149732917</td>
      <td>♪ I heard he sang a good song ♪</td>
    </tr>
    <tr>
      <th>3</th>
      <td>150567084</td>
      <td>191024167</td>
      <td>♪ I heard he had a style ♪ -[camera shutter clicks]</td>
    </tr>
    <tr>
      <th>4</th>
      <td>191858334</td>
      <td>241074167</td>
      <td>♪ And so I came to see him To listen for a while ♪</td>
    </tr>
  </tbody>
</table>
</div>




```python
interim_story = df.loc[57:146]
```


```python
interim_story.head()
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
      <th>begin</th>
      <th>end</th>
      <th>text</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>57</th>
      <td>2051215834</td>
      <td>2064145417</td>
      <td>You know what's weird?</td>
    </tr>
    <tr>
      <th>58</th>
      <td>2072487084</td>
      <td>2090421667</td>
      <td>I've always been this talented.</td>
    </tr>
    <tr>
      <th>59</th>
      <td>2105853750</td>
      <td>2123788334</td>
      <td>I can't remember a time when I wasn't.</td>
    </tr>
    <tr>
      <th>60</th>
      <td>2124622500</td>
      <td>2159240417</td>
      <td>You know, when I was growing up, I was probably about eight years old,</td>
    </tr>
    <tr>
      <th>61</th>
      <td>2160074584</td>
      <td>2188436250</td>
      <td>and at the time,  we were living in Silver Spring.</td>
    </tr>
  </tbody>
</table>
</div>



### How Many Words?


```python
story_text = interim_story.text.str.cat(sep = ' ')
```


```python
text = story_text

text = text.lower()

text = re.sub("[^\w ]", "", text)

text
```




    'you know whats weird ive always been this talented i cant remember a time when i wasnt you know when i was growing up i was probably about eight years old and at the time we were living in silver spring yeah yes common misconception about me and dc a lot of people think im from the hood thats not true but i never bothered to correct anybody because i wanted the streets to embrace me as a matter of fact i kept it up as a ruse like sometimes ill hang out with rappers like nas and them and these motherfuckers start talking about the projects yo it was wild in the pjs yo and ill be like word nigga word but i dont know i have no idea my parents did just well enough so that i could grow up poor around white people to be honest whennas and them talk about the projects nigga i used to get jealous because it sounded fun everybody in the projects was poor and thats fair but if you were poor in silver spring nigga it felt like it was only happening to you nas does not know the pain of that first sleepover at a white friends house when you come back home on sunday and just look at your parents like yall need to step your game up everything at timmys house works remember the first time you saw that the cold winter and to be at a white friends house and see them motherfuckers in their living room without their coats on timmy was one of my first white friends like in my life man good dude too he moved to silver spring from utah of all places i guess his family was affiliated with that mormon church they got down there me and him used to hang out one day i was at his house just hanging out and timmy says dave why dont you stay for dinner tonight i said oh man id love to but i cant if im not home before dark my mother will kill me that was a lie my mother had several jobs i hadnt seen her in three or four days and the only reason i lied to timmy was because at that point in my life it was my experience that white dinner wasnt delicious id rather go home and fry some bologna or some shit like that but then old timmy threw me a curveball i wasnt expecting he said oh its too bad you cant stay dave cause mama made stove top stuffing i said what the fuck stove top hold on nigga let me make some phone calls real quick i had seen that commercial so many times i had dreamt of getting my hands on some of that stove top stuffing finally i met a motherfucker that actually had a box of stove top in the house i couldnt miss this opportunity so i pretended to call my mother then i came back and i said timmy timmy youre not gonna believe this great news mom said i can stay he said fantastic he said why dont you come with me and well help set the table and then we can say the blessing i had no interest in setting this motherfuckers table or saying these crazyass mormon prayers i just wanted the goddamn stuffing i told timmy you know what id love to help but let me go wash my hands first my plan was simple wash my hands slowly and by the time im done the table will be set the blessing will be said and all that there will be left to do is eat went to the bathroom i wash my hands very slowly i must have been in there for about ten minutes and suddenly one of his mothers came to the door she was like hi david right i said yes maam she said timmy tells me that youre planning on staying for dinner i said i hope thats not a problem maam she says no its no problem wed love to have you its just that we werent expecting company and im afraid theres not enoughstove top stuffing for everybody'




```python
words = text.split(' ')
word_count = Counter(words)
```


```python
len(list(word_count.elements()))
```




    712



### How Long of a Gap?


```python
interim_story.head()
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
      <th>begin</th>
      <th>end</th>
      <th>text</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>57</th>
      <td>2051215834</td>
      <td>2064145417</td>
      <td>You know what's weird?</td>
    </tr>
    <tr>
      <th>58</th>
      <td>2072487084</td>
      <td>2090421667</td>
      <td>I've always been this talented.</td>
    </tr>
    <tr>
      <th>59</th>
      <td>2105853750</td>
      <td>2123788334</td>
      <td>I can't remember a time when I wasn't.</td>
    </tr>
    <tr>
      <th>60</th>
      <td>2124622500</td>
      <td>2159240417</td>
      <td>You know, when I was growing up, I was probably about eight years old,</td>
    </tr>
    <tr>
      <th>61</th>
      <td>2160074584</td>
      <td>2188436250</td>
      <td>and at the time,  we were living in Silver Spring.</td>
    </tr>
  </tbody>
</table>
</div>




```python
start = interim_story.iat[0, 0]
end = interim_story.iat[-1, 1]
```


```python
duration = end - start
```

The duration is provided as 10^7 seconds.


```python
minutes_full = duration/(10 ** 7)/60
minutes_full
```




    5.243432638333333




```python
minutes = int(minutes_full)
seconds_frac = minutes_full % 1
seconds = int(seconds_frac * 60)
```


```python
print(f"Story lasts for {minutes} minutes, {seconds} seconds")
```

    Story lasts for 5 minutes, 14 seconds


## Conclusion

- Example of parsing Netflix subtitles. Data includes timestamp for a given subtitle and the associated text.

### What's Useful for Later:
- Function for parsing Netflix `.xml` subtitle files

### Going Further
- I could see attempting to recreate work I have done previously on the use of [swear words in comedy specials](https://zachbogart.com/project/comedy/)

Till next time!

![](https://media.giphy.com/media/42D3CxaINsAFemFuId/giphy.gif)

#### Image Credit
[comedy mask](https://thenounproject.com/search/?creator=4129988&q=comedy&i=3169849) by Zach Bogart from [the Noun Project](https://thenounproject.com/) 
