program = require 'commander'
fs = require 'fs'
pJson = require '../package.json'

program
  .version(pJson.version)
  .option('-d, --dir <dir>','Version control directory')
  .option('--pull','Pull from the databse')
  .option('--push','Push to the database')
  .parse(process.argv);

directory = program.dir || process.cwd()

if(!fs.existsSync(directory + '/dbconfig.json'))
	console.log "Cannot find the configuation file. Please create one, or use the proper directory.
				 \nMore info at http://dgit.openly.io/doc/config.\n"
	process.exit(1)

# dbConfig = require(directory + '/dbconfig.json')

# DBInterface = require './lib/#{dbConfig.type}' 

if(program.pull)
	console.log "Pulling from db"
	# DBInterface.pull(dbConfig);
else if(program.push)
	console.log "Pushing to db"
	# DBInterface.push(dbConfig);
