# @cjsx React.DOM

@Photo = React.createClass
  render: ->
    return (
      <a href={@props.urlBig} data-lightbox="search_result" data-title={@props.title}>
        <img src={@props.urlThumbnail} className="img-thumbnail img-responsive" alt="Responsive image" />
      </a>
    )
