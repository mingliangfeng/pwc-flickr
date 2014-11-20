# @cjsx React.DOM

@resultsSection = React.render <@ResultsSection />, $(".search-results-wrapper")[0]
@router = new window.AppRouter()

@searchPhotos = (query, page)->
  query = $.trim(query || '')
  page = page || 1
  window.router.navigate("#{query}/#{page}", {trigger: true}) if query.length > 0

$ ->
  $('#searh-form').submit (e)->
    e.preventDefault()
    window.searchPhotos $(@).find('[name=q]').val()
    false

  $(document).on 'click', 'a.result-pager', -> window.searchPhotos $(@).data('query'), $(@).data('pager')
