DBInterface = require('../db_interface');
class MySqlDB extends DBInterface

  pull: (env='local')->
    console.log(this.config);
    console.log "Pull the asd contents from '#{env}'?"
    
  push: (env='local')->
    pass

module.exports = MySqlDB;