import React from 'react';
import {Button} from 'react-bootstrap';

const CommentPost = (props) => {
  return (
      <Button onClick={props.onClick}>
        Add a Comment!
      </Button>
  )
}

export default CommentPost;
