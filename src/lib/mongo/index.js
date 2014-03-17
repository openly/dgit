// Generated by CoffeeScript 1.7.1
var DBInterface, MongoInterface,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

DBInterface = require('../db_interface');

MongoInterface = (function(_super) {
  __extends(MongoInterface, _super);

  function MongoInterface() {
    return MongoInterface.__super__.constructor.apply(this, arguments);
  }

  MongoInterface.prototype.pull = function(env) {
    var command, conn, e, fileName;
    if (env == null) {
      env = 'local';
    }
    console.log("Pull the mongo contents from '" + env + "'");
    conn = this.config['env'][env].connection;
    fileName = this._getFileName(env);
    try {
      command = "mongodump --host " + conn.host + " --port " + conn.port + " --username " + conn.username + " --password " + conn.password + " --dbpath " + conn.dbpath + " --out " + fileName;
      return this.exec(command);
    } catch (_error) {
      e = _error;
      return this._errors.push(e);
    }
  };

  MongoInterface.prototype.push = function(env) {
    var command, conn, e, fileName;
    if (env == null) {
      env = 'local';
    }
    console.log("Push the mongo contents to '" + env + "'");
    conn = this.config['env'][env].connection;
    fileName = this._getFileName(env);
    try {
      command = "mongorestore --host " + conn.host + " --port " + conn.port + " --username " + conn.username + " --password " + conn.password + " --dbpath " + conn.dbpath + " --journal " + fileName;
      return this.exec(command);
    } catch (_error) {
      e = _error;
      return this._errors.push(e);
    }
  };

  return MongoInterface;

})(DBInterface);

module.exports = MongoInterface;
