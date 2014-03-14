class DBInterface
  constructor: (config) ->
    @_errors = []
    @config = config

  pull: (env='local')->
    console.log "Pull the database contents from #{env}?"
    
  push: (env='local')->
    console.log "Push the database contents to #{env}?"

  exec: (command)->
    console.log "Execute the shell script command '#{command}'"
    # exec(command,
    #   callback: (err, stdout, stderr)->
    #     console.log(err)
    # );

  getErrors: ->
    return @_errors;

module.exports = DBInterface;