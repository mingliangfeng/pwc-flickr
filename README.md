# Flickr Photo Search

[![Build Status](https://travis-ci.org/mingliangfeng/pwc-flickr.png?branch=master)](https://travis-ci.org/mingliangfeng/pwc-flickr) [![Coverage Status](https://img.shields.io/coveralls/mingliangfeng/pwc-flickr.svg)](https://coveralls.io/r/mingliangfeng/pwc-flickr?branch=master)

https://pwc-flickr.herokuapp.com

## Environment
* Ruby version: `ruby 2.1.2p95`
* Rails versioin: `Rails 4.1.7`

## Frameworks & Gems Used
* [Bootstrap](https://github.com/twbs/bootstrap) for bulding responsive UI
* [Lightbox](https://github.com/lokesh/lightbox2) for viewing large photos
* [Reactjs](https://github.com/facebook/react) for building UI components when fetching photos by AJAX
* [Flickraw](https://github.com/hanklords/flickraw) for accessing Flickr Search API
* [RSpec](https://github.com/rspec/rspec), [Webmock](https://github.com/bblimke/webmock),  [Capybara](https://github.com/jnicklas/capybara) for testing


## Major Classes
* **FlickrProxy** Flickr API proxy, delegates all Flickr API requests to [flickraw](https://github.com/hanklords/flickraw).
* **Photo** Major domain class, responsible for searching and fetching basic photo information.

## Test
This app is tested using RSpec. For testing model **Photo**, two sets of specs are provided:
* **Mock specs**: Flickr API data will be served by local json files; this will speed up the testing during developing, and gives reliable results for verifying features. This is achieved by introducing [webmock](https://github.com/bblimke/webmock). For mock testing, the testing json data can be saved from [here](https://www.flickr.com/services/api/explore/). e.g. [flickr.photos.getInfo](https://www.flickr.com/services/api/explore/flickr.photos.getInfo).

* **Live specs**: Flickr API request will hit real Flickr end point and fetch real data; these specs are time consuming, but should run before releasing to production server to make sure live search is working. Here is using Flickr search libraray [flickraw](https://github.com/hanklords/flickraw). All features specs are live specs.

## Setups
`git clone https://github.com/mingliangfeng/pwc-flickr.git` <br/> `cd pwc-flickr` <br/>
`bundle install` <br/>
`bundle exec rspec` <br/>
`rails s`

You'll need firefox installed to run the integration tests.

## TODOs
1. <del>Change to async photo searching as the current one seems time consuming;</del>
2. <del>Add integration test by using capybara;</del>
3. <del>refactor paginate.js.cjsx and fix bug when search term doesn't match anything (returns pagination with values 1,0)</del>
4. <del>can not bookmark a searched url</del>
5. <del>more feature specs (test pagination, clicking on photo)</del>
6. Photo.search refactor to be more ruby-ish
7. Enhance searching by adding **tag** search;
8. Display more inforation for photo like description, tags, etc.
