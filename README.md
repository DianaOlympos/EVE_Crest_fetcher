# FetchCrestMarket

###TODO
  - [x] Add poolboy to handle request (20 connection in parallel)
  - [ ] Add Tasks that handle walking through pages
  - [ ] Add a layer preparing data for sink
  - [ ] Add prosper mysql as a Sink
  - [ ] Add CSV as a Sink
  - [ ] Add email in cas of error
  - [ ] Add logging
  - [ ] Add metrics
  - [ ] Add config file for prod (conform)
  - [ ] Generate walking item through CREST (linked to history)
  - [ ] Add dealing with SDE
  - [x] Add agent to keep partial data and their logic
  - [x] Add struct to handle JSON requests

## Description

This application is aimed at creating an independant CREST fetcher for EVE Prosper show.
It aimed to be independent and be only limited by CREST Rate limit.
