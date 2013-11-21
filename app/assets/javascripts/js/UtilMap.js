var UtilMap = {
	projectionDomain : new OpenLayers.Projection("EPSG:4326"),
    getProjectionDomain : function(){ return this.projectionDomain; },
    
	/* utilizado para converter latlong em point para ser usado em um OpenLayers.Feature.Vector */
	convertToPoint : function(domainGeom, map) {
		var long_lat = this.convertToLongLat(domainGeom, map);
		return new OpenLayers.Geometry.Point(long_lat.lon, long_lat.lat);
	},

	convertToLongLat : function(domainGeom, map) {
        var latitude = domainGeom[4];
        var longitude = domainGeom[5];
		var long_lat = new OpenLayers.LonLat(longitude, latitude).transform(this.projectionDomain, map.getProjectionObject());
		return long_lat;
	},
    
    createMarkerV : function(v, map){
        var size = new OpenLayers.Size(29, 29);
        var offset = new OpenLayers.Pixel(-((size.w/2)-1), -(size.h/2));
		var icon = new OpenLayers.Icon(SWTImages.sportcar(), size, offset);
		var marker = new OpenLayers.Marker(this.convertToLongLat(v, self.map), icon);
        return marker;
    }
};