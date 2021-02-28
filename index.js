const parseEnvString = require('parse-env-string');
const fs = require('fs');
const path = require('path');

const env = parseEnvString(process.env.INPUT_DS_ENVIROMENTS);

const files = fs.readdirSync('./.ds');

files.map(file => {

    var content = fs.readFileSync(path.resolve('./.ds', file)).toString();
    
    Object.entries(env).forEach(([key, value]) => {
        content = content.replace(new RegExp('{'+key+'}', 'g'), value);
    });

    fs.writeFileSync(path.resolve('./.ds', file), content);
});