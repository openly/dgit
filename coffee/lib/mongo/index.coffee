DBInterface = require('../db_interface');
path = require('path');

class MongoInterface extends DBInterface
  doPull: (env='local', callback)->
    console.log "Pull the mongo contents from '#{env}'"

    conn = @config['env'][env].connection
    fileName = @_getFileName(env);
    
    command = "mongodump "
    command += "--host #{conn.host} " if conn.host?
    command += "--port #{conn.port} " if conn.port?
    command += "--username #{conn.username} " if conn.username?
    command += "--password #{conn.password} " if conn.password?
    command += "--dbpath #{conn.dbpath} " if conn.dbpath?
    command += "--db #{conn.database} "
    command += "--out #{fileName}"
    this.exec command, (e, stdout, stderr)=> 
      @_errors.push(e) if e?;
      callback(@_errors);
    
  doPush: (env='local', callback)->
    console.log "Push the mongo contents to '#{env}'"

    conn = @config['env'][env].connection
    fileName = @_getFileName(env);

    command = "mongorestore "
    command += "--host #{conn.host} " if conn.host?
    command += "--port #{conn.port} " if conn.port?
    command += "--username #{conn.username} " if conn.username?
    command += "--password #{conn.password} " if conn.password?
    command += "--dbpath #{conn.dbpath} " if conn.dbpath?
    command += "--db #{conn.database} "
    command += "#{fileName}/*"
    this.exec command, (e, stdout, stderr)=> 
      @_errors.push(e) if e?;
      callback(@_errors);

module.exports = MongoInterface;