exec = require '../util/exec'

class DBInterface
  constructor: (config, dir) ->
    @_errors = []
    @config = config
    @dir = dir

  pull: (env='local', callback)->
    @exec "cd #{@dir}",(e)=>
      @exec "rm -rf #{@_getFileName(env)}",(e)=>
        @doPull(env, callback)
    
  push: (env='local', callback)->
    @exec "cd #{@dir}",(e)=>
      @doPush(env, callback)

  doPull: (env='local', callback)->
    console.log "Pull the database contents from #{env}?"
    
  doPush: (env='local', callback)->
    console.log "Push the database contents to #{env}?"

  exec: (command, callback)->
    console.log "Execute the shell script command '#{command}'"
    exec command, (e, stdout, stderr)->
      console.log stdout
      callback(e, stdout, stderr);

  getErrors: ->
    return @_errors;

  _getFileName: (env)->
    fileName = @config.type + '_dump_' + @config['output'];
    return fileName;


module.exports = DBInterface;