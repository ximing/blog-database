'use strict'
var path = require('path'),
   fs = require('fs'),
   fse = require('fs-extra');

var parentPath = path.resolve(__dirname, '..');
var fileList = [];
function walk(path) {
    var dirList = fs.readdirSync(path);
    dirList.forEach(function (item) {
        if (fs.statSync(path + '/' + item).isDirectory()) {
            walk(path + '/' + item);
        } else {
            if(item.endsWith('.md')){
                fileList.push(path + '/' + item);
            }
        }
    });
}

walk(path.join(parentPath, 'posts'));
console.log(fileList);
fileList.forEach(item=> {
    let filename = path.basename(item);
    fse.copySync(item, path.join(parentPath, '.bone','/source/_posts/',filename));
});

