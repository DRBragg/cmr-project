import React from 'react';
import { Col, PanelGroup, Panel } from 'react-bootstrap';
import ReviewForm from './reviewForm'

const RepInfo = (props) => {
  return(
    <div className="size">
      <Col xs={12}>
        <PanelGroup>
        <div className="row form-row">
          <div className="col-xs-3">
            <Panel collapsible header="Biography" eventKey="1" className="buffer">
              Name: {props.rep.name}<br />
              Office: {props.rep.office}<br />
              Party: {props.rep.party}<br />
              Elected on: {props.rep.elected}<br />
              Bio: {props.rep.bio}<br />
            </Panel>
          </div>
        </div>
        <div class="row form-row">
          <div class="col-xs-3">
            <Panel collapsible header="Contact" eventKey="2" className="buffer">
              Email: {props.rep.email}<br />
              Phone Number: {props.rep.phone_number}<br />
            </Panel>
          </div>
        </div>
        <div class="row form-row">
          <div class="col-xs-3">
            <Panel collapsible header ="Review this Representative" eventKey="3" className="buffer">
              <ReviewForm
                repId={props.rep.id}
                newReview={props.newReview}
                userId={props.userId}
              />
            </Panel>
          </div>
        </div>
        </PanelGroup>
      </Col>
    </div>
  )
}

export default RepInfo
