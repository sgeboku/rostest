// Auto-generated. Do not edit!

// (in-package ros_adder.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Adder {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.arg_x = null;
      this.arg_y = null;
    }
    else {
      if (initObj.hasOwnProperty('arg_x')) {
        this.arg_x = initObj.arg_x
      }
      else {
        this.arg_x = 0;
      }
      if (initObj.hasOwnProperty('arg_y')) {
        this.arg_y = initObj.arg_y
      }
      else {
        this.arg_y = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Adder
    // Serialize message field [arg_x]
    bufferOffset = _serializer.int32(obj.arg_x, buffer, bufferOffset);
    // Serialize message field [arg_y]
    bufferOffset = _serializer.int32(obj.arg_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Adder
    let len;
    let data = new Adder(null);
    // Deserialize message field [arg_x]
    data.arg_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [arg_y]
    data.arg_y = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_adder/Adder';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e786a8255416662901d0f10732f9d69a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 arg_x
    int32 arg_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Adder(null);
    if (msg.arg_x !== undefined) {
      resolved.arg_x = msg.arg_x;
    }
    else {
      resolved.arg_x = 0
    }

    if (msg.arg_y !== undefined) {
      resolved.arg_y = msg.arg_y;
    }
    else {
      resolved.arg_y = 0
    }

    return resolved;
    }
};

module.exports = Adder;
