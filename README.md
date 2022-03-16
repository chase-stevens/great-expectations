# Great Expectations
This is a Ruby on Rails API application that can fetch text files and parse them to get all the word pairings in the text file, which are then stored in the primary database.

The parser is delimited by Chapter headers. Given the ability to get data from Project Gutenberg and similar headers in other books, I expanded the scope of the application to be able to store and handle multiple books.

Given the type and size of the datasets -- namely, text files of books -- I felt a lightweight approach was best, as the data was less well structured as well as smaller in size. Thus, I handled my ingestion and transformations in model methods as well as in rake tasks.

## Video Demonstration
Part 1: https://www.loom.com/share/fbf250da080345e68a87a29726f2ae2b
Part 2: https://www.loom.com/share/2a7674debdaf48d39a23e83bf3603f81

## Features
- Idempotency in Data Ingestion
- Supports Multiple Data Sources
- Configured with Multiple Databases
- Easy Setup

## Data Ingestion and Transformation
`rake get_book[:url]`
`rake transform_book_to_pairings[:source_id]`

## API
`get /api/v1/pairings', to: 'pairings#index'`
`get 'api/vi/pairings/:phrase', to: 'pairings#show'`
Optional parameters are `chapters: [int]` and `source: str`

## Areas of Improvement
- Transformations could be cleaner and more well defined
- Token Parser strips some punctuation and ignores others
- Implement Ruby Kiba ETL Gem for more well defined ETL processes