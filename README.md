dgit
====

Git Management for database

Usage
-----

### Installation
```
npm install -g dgit
```

### Initialize
In an empty directory run `dgit init mysql/mongo`. This will create a configuration file and initialze a empty git repository and commits the configuration file to the git repo.

### Configure
The configuration file will be in `dbconfig.json`. A sample file would look like
```
{
  "type": "mongo",
  "output": "abhi",
  "env":{
    "test":{
      "connection":{
        "host":"server",
        "port":"27017",
        "user":"USERNAME",
        "password":"******",
        "database":"database_name"
      }
    },
    "local":{
      "connection":{
        "database":"database_name"
      }
    }
  }
}
```
Dgit supports unlimited number of environments.

### Pull form database
```
dgit --pull -e <env>
```
This command will pull the dump the database set in the configuration environment and puts it into the file system. Then it also committs it to GIT.


### Push to database
```
dgit --push -e <env>
```
This command will push the dump in the filesystem to the database set in the configuration.