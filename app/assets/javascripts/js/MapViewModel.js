var MapViewModel = function(id, map) {
	var self = this;
	self.map = map;
	self.el = document.getElementById(id);
    
    
    self.deviceByUser = ko.observableArray([]);
    self.deviceLayer = undefined;
    
    self.loadDeviceByUser = function(jesusSuccess){
        $.ajax(SWT_SERVER.getDeviceByUser(function(data){
            if(self.deviceLayer == undefined){
                self.deviceShowMap(data);             
            } else {
                self.removeMarkerDevice(data);                
            }
        }));
    };
    
    /*### functions for layers of map  ###*/
    self.getDeviceLayer = function(){
        if(!self.deviceLayer){
            self.deviceLayer = new OpenLayers.Layer.Markers("device");
            self.map.addLayer(self.deviceLayer);
        }
        return self.deviceLayer;
    };
    /*### functions for layers of map  ###*/
    
    var marker_v;
    self.deviceShowMap = function(data){
        var layer = self.getDeviceLayer();        
        for (var i = 0; i < data.length; i++){
            var v = data[i];
            marker_v = UtilMap.createMarkerV(v, self.map);
            layer.addMarker(marker_v);
            self.map.panTo(marker_v.lonlat);
        }
    };
    
  self.updateVehiclesMap = function() {
        console.log("begin update device....");
        self.loadDeviceByUser();
        console.log("end update device....");
    };
    
    self.removeMarkerDevice = function(data){
        var layer = self.getDeviceLayer();
        var markers = layer.markers;
        for (i = 0; i < markers.length; i++){
            layer.removeMarker(markers[i]);
            i = --i;
        }
        console.log("marker removido");
        self.deviceShowMap(data);
    };
    
    
    self.timerUpdateDeviceLonLat = function() {
        setInterval(self.updateVehiclesMap, 15000);
    };
    
    
    
	ko.applyBindings(this, self.el);
};

function init(map_id, viewmodel_id) { 
	map = new OpenLayers.Map(map_id);
	map.addControl(new OpenLayers.Control.LayerSwitcher());    
	var osm = new OpenLayers.Layer.OSM("CycleMap"); 
    var myLocation = UtilMap.convertToPoint({
		longitude : -38.521262200000024,
		latitude : -3.7897738984758833
	}, map);
	map.addLayers([osm]);    
    map.setCenter(UtilMap.convertToLongLat({
		longitude : -38.521262200000024,
		latitude : -3.7897738984758833
	}, map), 12);
	map.panTo(myLocation);    
	mapaViewModel = new MapViewModel(viewmodel_id, map);
    mapaViewModel.timerUpdateDeviceLonLat();
    mapaViewModel.loadDeviceByUser();
}
function initialize() {
	init('map_id', 'master_container');
}
function loadScript() {	
	if(!window.loaded) {
		window.loaded = true;
        initialize();
	}
}
window.onload = loadScript;