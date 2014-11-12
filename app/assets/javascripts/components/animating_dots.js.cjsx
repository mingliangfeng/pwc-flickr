# @cjsx React.DOM

@AnimatingDots = React.createClass
  getInitialState: -> { dotsCount: 1 }
  changeDots: ->
    @setState dotsCount: (@state.dotsCount + 1) % 10
    @timer = setTimeout @changeDots, 200
  componentDidMount: ->
    @timer = setTimeout @changeDots, 200
  componentWillUnmount: -> clearTimeout @timer
  render: ->
    return (
      <span>{Array(@state.dotsCount + 1).join "."}</span>
    )
