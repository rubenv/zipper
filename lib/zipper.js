var assert = require('assert');
var zipper = require('./_zipper');
var async  = require('async');

/* assert ABI compatibility */
assert.ok(zipper.versions.node === process.versions.node, 'The running node version "' + process.versions.node + '" does not match the node version that zipper was compiled against: "' + zipper.versions.node + '"');

// push all C++ symbols into js module
for (var k in zipper) { exports[k] = zipper[k]; }


 /**
 * Add multiple files to a new zip file.
 * Add multiple files to a zip
 * Example:
 *
 *
 * @param {Object} Files to add in the form of { path to original file : save in zip as }.
 * @param {Callback} false is no errors
 */

zipper.Zipper.prototype.addFiles = function(files,callback){

	var calls = [];
	var x = 0;
		for(var path_to_file in files ){
			calls[x] = 	(function(path_to_file , save_as){
						return function(next){
							this.addFile( path_to_file , save_as , next );
						}.bind(this);
					}).call(this,path_to_file , files[path_to_file]);
			x++;			
		}
	
	async.series(calls,callback);
}
