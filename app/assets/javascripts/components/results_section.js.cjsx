# @cjsx React.DOM

window = @
@ResultsSection = React.createClass
  getInitialState: -> { }
  newQuery: (query, page)->
    @replaceState query: query, page: page || 1
    @goSearch()
  goSearch: ->
    that = @
    $.get "/search.json", { q: @state.query, page: @state.page }, (data)->
      that.setState photos: data.photos, page: data.page, pages: Math.min(data.pages, 10000), query: data.query
  render: ->
    return (<div></div>) unless @state.query

    return (<h3 className="searching">Searching "{@state.query}", page {@state.page} <window.AnimatingDots /></h3>) unless @state.photos

    <div className="result-section">
      <div className="result-header clearfix">
        <h3>Search results of "{@state.query}"</h3>
        <window.Paginate page={@state.page} pages={@state.pages} query={@state.query} />
      </div>

      <div className="search-results">
        {"No photo found" unless @state.photos.length > 0}
        {@state.photos.map (photo)->
          <window.Photo key={photo.id} urlBig={photo.url_big} urlThumbnail={photo.url_thumbnail} />
        }
      </div>
    </div>
