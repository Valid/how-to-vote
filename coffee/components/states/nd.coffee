React     = require('react')
Sticky    = require('react-stickynode')
Button    = require('components/blocks/button')
College   = require('components/blocks/college')
DateBox   = require('components/blocks/dateBox')
Military  = require('components/blocks/military')
MoreInfo  = require('components/blocks/moreInfo')
AddToCal  = require('components/widgets/addToCalWidget')
Offices   = require('components/widgets/officesWidget')
PollPlace = require('components/widgets/pollPlaceWidget')
Reminder  = require('components/widgets/reminderWidget')
Share     = require('components/widgets/shareWidget')
entity    = require('utils/entity')

module.exports = React.createClass
  displayName: 'ND State Info'

  render: ->
    <section className='flex'>
      <div className='left'>
        <h2>
          Key Information
          <Share {...@props} />
        </h2>
        <PollPlace state={@props.state} />
        <p>
          North Dakota has open caucuses {entity('mdash')} any North Dakotan that intends to support the Democratic Party in the 2016 election can vote for Bernie Sanders, regardless of registration status.
        </p>
        <College {...@props} />
        <Military {...@props} />
        <MoreInfo {...@props} />
        <Offices {...@props} />
      </div>
      <div className='right'>
        <Sticky top={25} bottomBoundary='section.flex'>
          <DateBox title='Caucus Date' date={@props.state.date} />
          <AddToCal date={@props.state.date} state={@props.state} />
          <Reminder {...@props} />

          <hr className='right-divider' />
          <Button title='More Information' link={'http://demnpl.com/'} classes='blue' />
        </Sticky>
      </div>
    </section>
