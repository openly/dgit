DBInterface = require('../db_interface');
class MongoInterface extends DBInterface
  pull: (env='local')->
    console.log "Pull the mongo contents from '#{env}'"

    conn = @config['env'][env].connection
    fileName = @_getFileName(env);
    
    try
      command = "mongodump --host #{conn.host} --port #{conn.port} --username #{conn.username} --password #{conn.password} --dbpath #{conn.dbpath} --out #{fileName}"
      this.exec(command);
    catch e
      @_errors.push(e);
    
  push: (env='local')->
    console.log "Push the mongo contents to '#{env}'"

    conn = @config['env'][env].connection
    fileName = @_getFileName(env);

    try 
      command = "mongorestore --host #{conn.host} --port #{conn.port} --username #{conn.username} --password #{conn.password} --dbpath #{conn.dbpath} --journal #{fileName}" 
      this.exec(command);
    catch e
      @_errors.push(e);

module.exports = MongoInterface;