# @cjsx React.DOM

@PagerGapLeft = React.createClass
  render: ->
    left_gap_pager = if @props.page - 5 > 1 then @props.page - 5 else 1
    <window.PagerAnchor text=".." pager={left_gap_pager} query={@props.query} />
