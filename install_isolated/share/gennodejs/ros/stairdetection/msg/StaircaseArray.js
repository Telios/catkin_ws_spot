// Auto-generated. Do not edit!

// (in-package stairdetection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Staircase = require('./Staircase.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class StaircaseArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.staircases = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('staircases')) {
        this.staircases = initObj.staircases
      }
      else {
        this.staircases = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StaircaseArray
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [staircases]
    // Serialize the length for message field [staircases]
    bufferOffset = _serializer.uint32(obj.staircases.length, buffer, bufferOffset);
    obj.staircases.forEach((val) => {
      bufferOffset = Staircase.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StaircaseArray
    let len;
    let data = new StaircaseArray(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [staircases]
    // Deserialize array length for message field [staircases]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.staircases = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.staircases[i] = Staircase.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 104 * object.staircases.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'stairdetection/StaircaseArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f9e6db9a4c0a52ac0899470f521a12d7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    Staircase[] staircases
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: stairdetection/Staircase
    uint8 ASCENDING=0
    uint8 DESCENDING=1
    
    int32 type
    int32 id
    float32 width
    float32 height
    float32 depth
    int32 nr_steps
    geometry_msgs/Pose start_pose
    geometry_msgs/Vector3 going_vector
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new StaircaseArray(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.staircases !== undefined) {
      resolved.staircases = new Array(msg.staircases.length);
      for (let i = 0; i < resolved.staircases.length; ++i) {
        resolved.staircases[i] = Staircase.Resolve(msg.staircases[i]);
      }
    }
    else {
      resolved.staircases = []
    }

    return resolved;
    }
};

module.exports = StaircaseArray;
