class DBInterface
  constructor: (config) ->
    @config = config

  pull: (env='local')->
    console.log 'Pull the database contents from "#{env}"?'
    
    
  pushL (env='local')->
    pass