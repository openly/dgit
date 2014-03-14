DBInterface = require('../db_interface');
class MySqlInterface extends DBInterface
  pull: (env='local')->
    console.log "Pull the mysql contents from '#{env}'"

    envConfig = @config['env'][env];
    conn = envConfig.connection

    try
      command = "mysqldump -u #{conn.username} -p#{conn.password} --databases #{conn.database} > #{envConfig.file_name}.sql"
      this.exec(command);
    catch e
      @_errors.push(e);
    
  push: (env='local')->
    console.log "Push the mysql contents to '#{env}'"

    envConfig = @config['env'][env];
    conn = envConfig.connection

    try 
      command = "mysql -u #{conn.username} -p#{conn.password} #{conn.database} < #{envConfig.file_name}.sql" 
      this.exec(command);
    catch e
      @_errors.push(e);

module.exports = MySqlInterface;