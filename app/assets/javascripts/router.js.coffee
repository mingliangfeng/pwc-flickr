@AppRouter = Backbone.Router.extend
  routes:
    "(:query)(/:page)": "search"

  search: (query, page)->
    window.resultsSection.newQuery(query, page)
