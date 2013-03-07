// tests for zipper multi file extenstion


zipper	= require('../lib/index.js').Zipper;
zipper	= new zipper('test_multi.zip');


files = {
'./test/car.txt':'car.txt',
'./test/spo.txt':'spo.txt'
};

zipper.addFiles(files,function(err){

	if(err){
		console.log('There was an Error!');
	}else{
		console.log('Completed with out Error');
	}
});

