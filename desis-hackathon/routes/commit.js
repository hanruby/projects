exports.postcommit = function(req, res,io) {
	var message = req.query["commitmsg"];
    console.log(message);
	var date = new Date();
	var val = message.split(":");
	var user=val[0];
	var m = val[1];
	var commitMsg={username:user,msg:m,timestamp:date};
	io.sockets.emit('commit:new', commitMsg);
}
