program = require 'commander'
fs = require 'fs'
pJson = require '../package.json'

program
  .version(pJson.version)
  .option('-d, --dir <dir>','Version control directory')
  .option('--pull','Pull from the databse')
  .option('--push','Push to the database')
  .parse(process.argv);

directory = process.cwd() + '/' +  program.dir

dbConfigFileName = directory + '/dbconfig.json'
if(!fs.existsSync(dbConfigFileName))
	console.log "Cannot find the configuation file. Please create one, or use the proper directory.
				 \nMore info at http://dgit.openly.io/doc/config.\n"
	process.exit(1)

dbConfig = require(dbConfigFileName)

DBInterface = require "./lib/#{dbConfig.type}"

dbObj = new DBInterface(dbConfig);

if(program.pull)
	console.log "Pulling from db"
	dbObj.pull();
else if(program.push)
	console.log "Pushing to db"
	dbObj.push();
