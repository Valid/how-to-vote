import React                 from 'react'
import Sticky                from 'react-stickynode'
import Button                from 'components/blocks/button'
import College               from 'components/blocks/college'
import DateBox               from 'components/blocks/dateBox'
import Deadline              from 'components/blocks/deadline'
import Military              from 'components/blocks/military'
import MoreInfo              from 'components/blocks/moreInfo'
import Young                 from 'components/blocks/young'
import AddToCal              from 'components/widgets/addToCalWidget'
import Offices               from 'components/widgets/officesWidget'
import PollPlace             from 'components/widgets/pollPlaceWidget'
import Reminder              from 'components/widgets/reminderWidget'
import Share                 from 'components/widgets/shareWidget'
import $                     from 'jquery'
import moment                from 'moment'
import { primaryType, verb } from 'states'
import entity                from 'utils/entity'

module.exports = React.createClass
  displayName: 'State Info'

  render: ->
    <section className='flex'>
      <div className='left'>
        <h2>
          Key Information
          <Share {...@props} />
        </h2>
        <PollPlace state={@props.state} />
        <p>
          {@props.state.name} has {@props.state.dtlName} {entity('mdash')} {@props.state.byline}
        </p>
        {if @props.state.sameDay
          <p>
            {@props.state.sameDay}
          </p>
        else
          <Deadline {...@props} />
        }
        {if @props.state.young is true
          <Young {...@props} />
        else if @props.state.young
          <div>
            <h3 className='caps'>Only 17?</h3>
            <p>
              {@props.state.young}
            </p>
          </div>
        }
        {unless @props.state.skipCM
          <div>
            <College {...@props} />
            <Military {...@props} />
          </div>
        }
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
          <hr className='right-divider' />

          {if @props.state.regLink
            <Button title='Register to Vote' link={@props.state.regLink} classes={'blue' if moment().isAfter(moment(@props.state.regDate, 'YYYY MM DD'), 'days')} />
          }
          {if @props.state.chkLink
            <Button title='Check Registration Status' link={@props.state.chkLink} />
          }
          {if @props.state.more
            <Button title='More Info' link={@props.state.more} classes={'blue'} />
          }
        </Sticky>
      </div>
    </section>
