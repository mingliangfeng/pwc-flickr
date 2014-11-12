# Flickr Photo Search

[![Build Status](https://travis-ci.org/mingliangfeng/pwc-flickr.png?branch=master)](https://travis-ci.org/mingliangfeng/pwc-flickr)

https://pwc-flickr.herokuapp.com

#### Environment

* Ruby version: `ruby 2.1.2p95`
* Rails versioin: `Rails 4.1.7`

## Major Classes

* **FlickrProxy** Flickr API proxy, delegates all Flickr API requests to [flickraw](https://github.com/hanklords/flickraw).
* **Photo** Major domain class, responsible for searching and fetching basic photo information.

## Test

This app is tested using RSpec. For testing model **Photo**, two sets of specs are provided:
* **Mock specs**: Flickr API data will be served by local json files; this will speed up the testing during developing, and gives reliable results for verifying features. This is achieved by introducing [webmock](https://github.com/bblimke/webmock). For mock testing, the testing json data can be saved from [here](https://www.flickr.com/services/api/explore/). e.g. [flickr.photos.getInfo](https://www.flickr.com/services/api/explore/flickr.photos.getInfo).

* **Live specs**: Flickr API request will hit real Flickr end point and fetch real data; these specs are time consuming, but should run before releasing to production server to make sure live search is working. Here is using Flickr search libraray [flickraw](https://github.com/hanklords/flickraw)

## TODOs
1. <del>Change to async photo searching as the current one seems time consuming;</del>
2. Add integration test by using capybara;
3. Enhance searching by adding **tag** search;
4. Display more inforation for photo like description, tags, etc.
