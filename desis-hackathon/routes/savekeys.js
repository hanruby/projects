// Authentication & Authorization
var fs = require('fs');

exports.saveUserDetails = function(req, res) {
  var folderlocation='D:\\User\\user\\';
  var userid = req.session.user.id;
  var member1key = req.body.member1key;
  var member2key = req.body.member2key;
  var member3key = req.body.member3key;
  if(member1key!=''){
	  var file1name = folderlocation + userid+'_member1.pub'
	  fs.writeFile(file1name, member1key, function(err) {
		 if(err)
			req.session.error = 'Error occured!';
		  else{
		  	req.session.success = 'Keys saved sucessfully!';
			}
	  });
  }
  if(member2key!=''){
	  var file2name = folderlocation + userid+'_member2.pub'
	  fs.writeFile(file2name, member2key, function(err) {
		  if(err)
			req.session.error = 'Error occured!';
		  else
		  	req.session.success = 'Keys saved sucessfully!';
	  });
  }
  if(member3key!=''){
	  var file3name = folderlocation + userid+'_member3.pub'
	  fs.writeFile(file3name, member3key, function(err) {
		  if(err)
			req.session.error = 'Error occured!';
		  else
		  	req.session.success = 'Keys saved sucessfully!';
	  });
  }
  res.redirect('/userdetails');
}