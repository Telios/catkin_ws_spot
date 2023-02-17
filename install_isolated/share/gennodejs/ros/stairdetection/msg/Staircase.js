// Auto-generated. Do not edit!

// (in-package stairdetection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class Staircase {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
      this.id = null;
      this.width = null;
      this.height = null;
      this.depth = null;
      this.nr_steps = null;
      this.start_pose = null;
      this.going_vector = null;
    }
    else {
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
      if (initObj.hasOwnProperty('depth')) {
        this.depth = initObj.depth
      }
      else {
        this.depth = 0.0;
      }
      if (initObj.hasOwnProperty('nr_steps')) {
        this.nr_steps = initObj.nr_steps
      }
      else {
        this.nr_steps = 0;
      }
      if (initObj.hasOwnProperty('start_pose')) {
        this.start_pose = initObj.start_pose
      }
      else {
        this.start_pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('going_vector')) {
        this.going_vector = initObj.going_vector
      }
      else {
        this.going_vector = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Staircase
    // Serialize message field [type]
    bufferOffset = _serializer.int32(obj.type, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.float32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float32(obj.height, buffer, bufferOffset);
    // Serialize message field [depth]
    bufferOffset = _serializer.float32(obj.depth, buffer, bufferOffset);
    // Serialize message field [nr_steps]
    bufferOffset = _serializer.int32(obj.nr_steps, buffer, bufferOffset);
    // Serialize message field [start_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.start_pose, buffer, bufferOffset);
    // Serialize message field [going_vector]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.going_vector, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Staircase
    let len;
    let data = new Staircase(null);
    // Deserialize message field [type]
    data.type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [depth]
    data.depth = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [nr_steps]
    data.nr_steps = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [start_pose]
    data.start_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [going_vector]
    data.going_vector = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 104;
  }

  static datatype() {
    // Returns string type for a message object
    return 'stairdetection/Staircase';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '328f707a0f226253d43b60994d17c07a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new Staircase(null);
    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    if (msg.depth !== undefined) {
      resolved.depth = msg.depth;
    }
    else {
      resolved.depth = 0.0
    }

    if (msg.nr_steps !== undefined) {
      resolved.nr_steps = msg.nr_steps;
    }
    else {
      resolved.nr_steps = 0
    }

    if (msg.start_pose !== undefined) {
      resolved.start_pose = geometry_msgs.msg.Pose.Resolve(msg.start_pose)
    }
    else {
      resolved.start_pose = new geometry_msgs.msg.Pose()
    }

    if (msg.going_vector !== undefined) {
      resolved.going_vector = geometry_msgs.msg.Vector3.Resolve(msg.going_vector)
    }
    else {
      resolved.going_vector = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

// Constants for message
Staircase.Constants = {
  ASCENDING: 0,
  DESCENDING: 1,
}

module.exports = Staircase;
