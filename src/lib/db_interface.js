// Generated by CoffeeScript 1.7.1
var DBInterface;

DBInterface = (function() {
  function DBInterface(config) {
    this._errors = [];
    this.config = config;
  }

  DBInterface.prototype.pull = function(env) {
    if (env == null) {
      env = 'local';
    }
    return console.log("Pull the database contents from " + env + "?");
  };

  DBInterface.prototype.push = function(env) {
    if (env == null) {
      env = 'local';
    }
    return console.log("Push the database contents to " + env + "?");
  };

  DBInterface.prototype.exec = function(command) {
    return console.log("Execute the shell script command '" + command + "'");
  };

  DBInterface.prototype.getErrors = function() {
    return this._errors;
  };

  DBInterface.prototype._getFileName = function(env) {
    var database, fileName;
    fileName = this.config['env'][env]['output'];
    if (fileName === void 0) {
      database = this.config['env'][env]['connection']['database'];
      fileName = this.config.type + '_dump_' + database;
    }
    return fileName;
  };

  return DBInterface;

})();

module.exports = DBInterface;
