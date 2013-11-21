var MapViewModel = function(id, map) {
	var self = this;
	self.map = map;
	self.el = document.getElementById(id);
    
    
    self.deviceByUser = ko.observableArray([]);
    self.deviceLayer = undefined;
    
    self.loadDeviceByUser = function(jesusSuccess){
        $.ajax(SWT_SERVER.getDeviceByUser(function(data){
            self.deviceShowMap(data);
            /*for (var i = 0; i < data.length; i++){
                console.log(data);
            }*/
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
            //self.map.panTo(v.lonlat);
        }
    };
    
    
    
	ko.applyBindings(this, self.el);
};

function init(map_id, viewmodel_id) { 
	map = new OpenLayers.Map(map_id);
	map.addControl(new OpenLayers.Control.LayerSwitcher());    
	var osm = new OpenLayers.Layer.OSM("CycleMap"); 
    var myLocation = UtilMap.convertToPoint({
		longitude : -43.2228755950928,
		latitude : -22.9853800175982
	}, map);
	map.addLayers([osm]);    
    map.setCenter(UtilMap.convertToLongLat({
		longitude : -43.2228755950928,
		latitude : -22.9853800175982
	}, map), 12);
	map.panTo(myLocation);    
	mapaViewModel = new MapViewModel(viewmodel_id, map);
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