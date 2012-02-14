var assert = require('assert');
var zipper = require('./_zipper');
var spo    = require('spo');

/* assert ABI compatibility */
assert.ok(zipper.versions.node === process.versions.node, 'The running node version "' + process.versions.node + '" does not match the node version that zipper was compiled against: "' + zipper.versions.node + '"');

// push all C++ symbols into js module
for (var k in zipper) { exports[k] = zipper[k]; }


 /**
 * Add multiple files to a new zip file.
 *
 * Example:
 *
 *
 * @param {Object} Files to add in the form of { path to save to : path to original file }.
 * @param {Callback} false is no errors
 */

zipper.Zipper.prototype.addFiles = function(files,callback){

	assert(files instanceof Object);
	assert(callback instanceof Function);

	var pending	= 0;
	var callback	= callback;
	var errors	= [];

	var cb = function(err){
		pending --;
			if(err){
				errors.push(err);
			}
		if(!pending){
			callback((errors.length)?true:false, errors);
		}
	};



	(function(){
	
			for(var path_to_file in files ){
				pending++;
				console.log(path_to_file);
				this.addFile( path_to_file , files[path_to_file] , cb );
			}
	

	}.bind(this))() ;

}
