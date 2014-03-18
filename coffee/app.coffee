program = require 'commander'
fs = require 'fs'
pJson = require '../package.json'
path = require 'path'

program
  .version(pJson.version)
  .option('-d, --dir <dir>','Version control directory')
  .option('--pull','Pull from the databse')
  .option('--push','Push to the database')
  .parse(process.argv);

directory = process.cwd()
directory = path.resolve process.cwd(), program.dir if (program.dir) 

dbConfigFileName = directory + '/dbconfig.json'
if(!fs.existsSync(dbConfigFileName))
    console.log "Cannot find the configuation file. Please create one, or use the proper directory.
                 \nMore info at http://dgit.openly.io/doc/config.\n"
    process.exit(1)

dbConfig = require(dbConfigFileName)

errors = []
for config in dbConfig
  do (config) ->
     try
        DBInterface = require "./lib/#{config.type}"

        dbObj = new DBInterface(config);

        if(program.pull)
            dbObj.pull();
        else if(program.push)
            dbObj.push();
     catch error
        errors.push(error)

if errors.length > 0
    console.log('Error happened', errors);
else
    console.log('Successfully Done')