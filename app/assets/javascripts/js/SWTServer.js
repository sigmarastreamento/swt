var SWTServer = function(){
    var self = this;
    self.serverbase = 'http://localhost:3000/';
    
    self.error = function(error){
		alert(error.status + ' ' + error.statusText);
	};

    
    self.getDeviceByUser = function(jesusSuccess){
        return{
            type: 'GET',
            dataType: 'json',
            url: self.serverbase + 'device_by_user.json',
            success: jesusSuccess,
            error: self.error
        };
    };
};

var SWT_SERVER = new SWTServer();