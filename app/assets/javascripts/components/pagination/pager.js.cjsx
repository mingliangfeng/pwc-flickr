# @cjsx React.DOM

@Pager = React.createClass
  render: ->
    <window.PagerAnchor text={@props.pager} pager={@props.pager} query={@props.query} disabled={@props.page == @props.pager} />
