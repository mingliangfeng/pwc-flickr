# @cjsx React.DOM

resultsSection = React.render <@ResultsSection />, $(".search-results-wrapper")[0]

searchPhotos = (query, page)-> resultsSection.newQuery query, page

$ ->
  $('#searh-form').submit (e)->
    e.preventDefault()
    q = $.trim $(@).find('[name=q]').val()
    searchPhotos(q, 1) if q
    false
    
  $(document).on 'click', 'a.result-pager', -> searchPhotos $(@).data('query'), $(@).data('pager')
