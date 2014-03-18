DBInterface = require('../db_interface');
class MySqlInterface extends DBInterface
  pull: (env='local')->
    console.log "Pull the mysql contents from '#{env}'"

    conn = @config['env'][env].connection
    fileName = @_getFileName(env);
    
    try
      command = "mysqldump -u #{conn.username} -p#{conn.password} --databases #{conn.database} > #{fileName}.sql"
      this.exec(command);
    catch e
      @_errors.push(e);
    
  push: (env='local')->
    console.log "Push the mysql contents to '#{env}'"

    conn = @config['env'][env].connection
    fileName = @_getFileName(env);

    try 
      command = "mysql -u #{conn.username} -p#{conn.password} #{conn.database} < #{fileName}.sql" 
      this.exec(command);
    catch e
      @_errors.push(e);

module.exports = MySqlInterface;