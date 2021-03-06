React                             = require('react')
{ShareButtons, generateShareIcon} = require('react-share')
{verb}                            = require('states')
_capitalize                       = require('lodash.capitalize')

module.exports = React.createClass
  display: 'Share'

  render: ->
    FacebookIcon = generateShareIcon('facebook')
    TwitterIcon = generateShareIcon('twitter')

    <div className='share'>
      <ShareButtons.FacebookShareButton title={"Vote for Bernie in #{@props.state.name}!"} className='share-btn' url={"https://vote.berniesanders.com/#{@props.stateKey}"}>
        <FacebookIcon size={40} round={true} />
      </ShareButtons.FacebookShareButton>
      <ShareButtons.TwitterShareButton title={"#{_capitalize(verb(@props.state))} for Bernie in #{@props.state.name}!"} className='share-btn' url={"https://vote.berniesanders.com/#{@props.stateKey}"}>
        <TwitterIcon size={40} round={true} />
      </ShareButtons.TwitterShareButton>
    </div>
