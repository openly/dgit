program = require 'commander'
fs = require 'fs'
pJson = require '../package.json'
path = require 'path'

program
  .version(pJson.version)
  .option('-d, --dir <dir>','Version control directory')
  .option('-e, --env <env>','Version control environment')
  .option('--pull','Pull from the databse')
  .option('--push','Push to the database')
  .parse(process.argv);

directory = process.cwd()
directory = path.resolve process.cwd(), program.dir if (program.dir) 
process.chdir(directory);

dbConfigFileName = directory + '/dbconfig.json'
if(!fs.existsSync(dbConfigFileName))
  console.log "Cannot find the configuation file. Please create one, or use the proper directory.
               \nMore info at http://dgit.openly.io/doc/config.\n"
  process.exit(1)

dbConfig = require(dbConfigFileName)

errors = []

DBInterface = require "./lib/#{dbConfig.type}"

dbObj = new DBInterface(dbConfig, directory);
call = ()->
if(program.pull)
  call = dbObj.pull;
else if(program.push)
  call = dbObj.push;

call.call dbObj, program.env, (e)->
  if errors.length > 0
    console.log('Error', errors);
  else
    console.log('Successfully Done')