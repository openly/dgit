class DBInterface
  constructor: (config) ->
    @config = config

  pull: (env='local')->
    console.log 'Pull the database contents from "#{env}"?'
    
    
  push: (env='local')->
    pass

module.exports = DBInterface;