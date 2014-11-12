# @cjsx React.DOM

@PagerGapRight = React.createClass
  render: ->
    right_gap_pager = if @props.page + 5 < @props.pages then @props.page + 5 else @props.pages
    <window.PagerAnchor text=".." pager={right_gap_pager} query={@props.query} />
