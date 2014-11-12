# @cjsx React.DOM

@PagerAnchor = React.createClass
  render: ->
    return (
      <li className={ if @props.disabled then 'disabled' else '' }>
        <a href="javascript:void(0)" className="result-pager" data-pager={@props.pager} data-query={@props.query}>
        {@props.children if @props.children}
        {@props.text unless @props.children}
        </a>
      </li>
    )
