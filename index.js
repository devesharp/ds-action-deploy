const parseEnvString = require('parse-env-string')
 
const env = parseEnvString(process.env.INPUT_DS_ENVIROMENTS);
 
console.log(env);