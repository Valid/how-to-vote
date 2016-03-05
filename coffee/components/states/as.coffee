import React           from 'react'
import Sticky          from 'react-stickynode'
import Button          from 'components/blocks/button'
import DateBox         from 'components/blocks/dateBox'
import MoreInfo        from 'components/blocks/moreInfo'
import AddToCal        from 'components/widgets/addToCalWidget'
import Offices         from 'components/widgets/officesWidget'
import PollPlace       from 'components/widgets/pollPlaceWidget'
import Reminder        from 'components/widgets/reminderWidget'
import Share           from 'components/widgets/shareWidget'
import moment          from 'moment'
import { primaryType } from 'states'
import entity          from 'utils/entity'

module.exports = React.createClass
  displayName: 'AS State Info'

  render: ->
    <section className='flex'>
      <div className='left'>
        <h2>
          Key Information
          <Share {...@props} />
        </h2>
        <PollPlace state={@props.state} />
        <p>
          American Samoa has closed caucuses {entity('mdash')} American Samoans must register with the Democratic party to caucus for Bernie!
        </p>
        <p>
          There is no deadline to register to vote.  Voters who wish to participate may register and declare affiliation with the Democratic Party at the caucus on Tuesday, March 1st.
        </p>
        <MoreInfo {...@props} />
        <Offices {...@props} />
      </div>
      <div className='right'>
        <Sticky top={25} bottomBoundary='section.flex'>
          <DateBox title={"#{primaryType(@props.state.fillKey, @props.state.label)} Date"} date={@props.state.date} />
          <AddToCal date={@props.state.date} state={@props.state} />
          <DateBox title='Registration Deadline' date={@props.state.regDate} />
          <AddToCal date={@props.state.regDate} state={@props.state} addendum={' Registration Deadline'} />
          <Reminder {...@props} />
        </Sticky>
      </div>
    </section>