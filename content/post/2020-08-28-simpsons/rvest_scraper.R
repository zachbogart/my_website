# rvest scraper
# for grabbing imdb data
require(tidyverse)
require(glue)
require(rvest)

grab_imdb_ratings <- function(imdb_code, seasons) {
  # Grabbing Rating Data for a show on IMDb
  # 
  # - imdb_code: url code for a given show (the "tt<number_string>" in the url)
  # - seasons: list of desired seasons
  
  # empty list to store dataframes
  df_list = list()
  
  # lez go!
  for (season in seasons) {
    
    # define url, using glue for combining strings
    base_url <- "https://www.imdb.com/title/"
    season_url <- glue("{base_url}{imdb_code}/episodes?season={season}")
    
    # go get the html
    html <- read_html(season_url)
    
    # isolate the desired data
    show <- html_nodes(html, ".parent a") %>% 
      html_text(trim = TRUE)
    title <- html_nodes(html, "#episodes_content strong a") %>% 
      html_text(trim = TRUE)
    rating <- html_nodes(html, ".ipl-rating-star.small .ipl-rating-star__rating") %>% 
      html_text(trim = TRUE) %>% 
      as.numeric()
    votes <- html_nodes(html, ".ipl-rating-star__total-votes") %>% 
      html_text(trim = TRUE) %>% 
      parse_number() # this saved the day! super helpful readr function
    air_date <- html_nodes(html, ".airdate") %>% 
      html_text(trim = TRUE) %>% 
      str_remove("[.]") %>%  # remove periods (May doesn't have a period like the rest: Apr., Oct.)
      parse_date("%d %b %Y")
    
    # make a tibble for each season 
    df <- tibble(show, air_date, title, rating, votes) %>%
      mutate(season = season,
             episode = seq(1, nrow(.))) %>% 
      select(show, season:episode, everything())
    
    # add to list
    df_list[[season]] <- df
  }
  
  # smoosh the list into one tibble
  show_run <- bind_rows(df_list)
  
  return(show_run)
  
}