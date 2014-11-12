# @cjsx React.DOM

@Paginate = React.createClass
  render: ->
    paginate = @
    pagers = []
    if @props.pages <= 5
      pagers = [1..@props.pages].map (page_index)->
        <window.Pager page={paginate.props.page} pager={page_index} query={paginate.props.query} />
    else
      if @props.page - 2 < 1
        pagers = [1..5].map (page_index)->
          <window.Pager page={paginate.props.page} pager={page_index} query={paginate.props.query} />
        pagers.push <window.PagerGapRight page={@props.page} pages={@props.pages} query={@props.query} />
      else if @props.page + 2 > @props.pages
        pagers.push <window.PagerGapLeft page={@props.page} pages={@props.pages} query={@props.query} />
        [(@props.pages - 4)..@props.pages].forEach (page_index)->
          pagers.push <window.Pager page={paginate.props.page} pager={page_index} query={paginate.props.query} />
      else
        pagers.push(<window.PagerGapLeft page={@props.page} pages={@props.pages} query={@props.query} />) if @props.page - 2 > 1
        [(@props.page - 2)..(@props.page + 2)].forEach (page_index)->
          pagers.push <window.Pager page={paginate.props.page} pager={page_index} query={paginate.props.query} />
        pagers.push <window.PagerGapRight page={@props.page} pages={@props.pages} query={@props.query} /> if @props.page + 2 < @props.pages

    return (
      <ul className="pagination">
        <window.PagerAnchor pager={1} query={@props.query} disabled={@props.page == 1}>
          <i className="glyphicon glyphicon-step-backward"></i>
        </window.PagerAnchor>
        {pagers}
        <window.PagerAnchor pager={@props.pages} query={@props.query} disabled={@props.page == @props.pages}>
          <i className="glyphicon glyphicon-step-forward"></i>
        </window.PagerAnchor>
      </ul>
    )
