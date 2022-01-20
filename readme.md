
# TED dataset

This repository contains **a simple DIY hack to scrape TED's online archive of talks and relative transcripts**.  
It fetches the data you need and by default stores it in a local PostgreSQL instance with [ActiveRecord](https://github.com/rails/rails/tree/main/activerecord).  
  
The idea is simple: first, scrape a list of slugs from the TED archive. Then, use a headless browser to fetch a page, scrape the content information and the transcript, polish the data, and finally store it in the database.
  
Originally designed to assemble a database of transcripts for NLP experiments, the scraper is now in a **stable alpha state**. It is currently under refactoring, though. The API looks good (and works well) but it needs some refinement ([WTFPL](https://leone.gdn/wtfpl)). I am still working on it.  
  
A copy of the dataset is available in the `data` directory.
