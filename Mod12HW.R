#### BAE590R Ryan Phillips
#Module 12 HW Code


library(tidyverse)
library(stringr)
library(tidytext)
library(wordcloud)
library(textdata)
library(lubridate)




tweets <- read_csv("data/hurricane-harvey-tweets.csv")
tweet <- read_csv("data/hurricane-harvey-tweets.csv")
head(tweets)
str(tweets)
View(tweets)

#Question 1
#Get counts of tweets at specific times
tweettime <- tweets %>%
  group_by(datetime) %>%
  count(datetime)
View(tweettime)
#Plot number of tweets at each time
tweettime %>%
  ggplot() +
  geom_point(mapping = aes(datetime, n), alpha = 0.5) +
  labs(y = "Number of tweets", x = NULL) +
  geom_vline(xintercept = ymd_hms("2017-08-26 03:00:00"), color = "red")+
  theme_bw()

#Question 2
#20 most commonly used words in Harvey tweets
data(stop_words)
View(stop_words)
custom_words <- c("hurricane", "harvey", "hurricaneharvey", "http", "https", "html", "ift.tt", "pic.twitter.com", "twitter.com", "fb.me", "bit.ly", "dlvr.it", "youtube", "youtu.be")
stop_words <- add_row(stop_words, word = custom_words)

#tidytweets
#
tidy_tweets <- tweets %>%
  unnest_tokens(word,tweet) %>%
  anti_join(stop_words) %>%
  count(word, sort = TRUE) %>%
  mutate(word = reorder(word,n))

#Get top 20 words tweeted

common_words <- top_n(tidy_tweets, 20)
#Plot the 20 most common words
common_words %>%
  ggplot(aes(word,n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()

# Question 3 
# SUbset tweets to look at tweets containing refinery or refineries

refine_tweets <- tweets %>%
  filter(str_detect(tweet, c("refinery", "refineries")))

refine_tweets %>%
  unnest_tokens(word,tweet) %>%
  anti_join(stop_words) %>%
  count(word, sort = TRUE) %>%
  with(wordcloud(word, n, max.words =100))

corpus <- tweets %>%
  unnest_tokens(word, tweet)
View(corpus)































