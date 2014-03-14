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

  _getFileName: (env)->
    fileName = @config['env'][env]['file_name'];
    if fileName == undefined
      database = @config['env'][env]['connection']['database'];
      fileName = @config.type + '_dump_' + database;
    return fileName;


module.exports = DBInterface;