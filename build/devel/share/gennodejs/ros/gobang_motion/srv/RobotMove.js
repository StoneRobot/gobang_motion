// Auto-generated. Do not edit!

// (in-package gobang_motion.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class RobotMoveRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.row = null;
      this.col = null;
    }
    else {
      if (initObj.hasOwnProperty('row')) {
        this.row = initObj.row
      }
      else {
        this.row = 0;
      }
      if (initObj.hasOwnProperty('col')) {
        this.col = initObj.col
      }
      else {
        this.col = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotMoveRequest
    // Serialize message field [row]
    bufferOffset = _serializer.int8(obj.row, buffer, bufferOffset);
    // Serialize message field [col]
    bufferOffset = _serializer.int8(obj.col, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotMoveRequest
    let len;
    let data = new RobotMoveRequest(null);
    // Deserialize message field [row]
    data.row = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [col]
    data.col = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gobang_motion/RobotMoveRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e85690eba9eeffee9ca1b40bb8b34292';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 row
    int8 col
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotMoveRequest(null);
    if (msg.row !== undefined) {
      resolved.row = msg.row;
    }
    else {
      resolved.row = 0
    }

    if (msg.col !== undefined) {
      resolved.col = msg.col;
    }
    else {
      resolved.col = 0
    }

    return resolved;
    }
};

class RobotMoveResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotMoveResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotMoveResponse
    let len;
    let data = new RobotMoveResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gobang_motion/RobotMoveResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotMoveResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: RobotMoveRequest,
  Response: RobotMoveResponse,
  md5sum() { return 'e85690eba9eeffee9ca1b40bb8b34292'; },
  datatype() { return 'gobang_motion/RobotMove'; }
};
