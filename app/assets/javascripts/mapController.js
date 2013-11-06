/** controller do mapa **/

function MapController($scope, $http) {
	$scope.map = null;
	$scope.mapId = "map";
	$scope.osm = "OpenStreetMap";
	$scope.layerMapa = null;
	
	/* -- dados para o mapa -- */
	$scope.layerPosition = null;
	$scope.locations = null;
	$scope.carroLayer = null;
	/* -- dados para o mapa -- */

	
	$scope.map = new OpenLayers.Map($scope.mapId);
	$scope.layerMapa = new OpenLayers.Layer.OSM($scope.osm);
	$scope.map.addLayer($scope.layerMapa);
	
	$scope.map.setCenter(
		new OpenLayers.LonLat(-71.147, 42.472).transform(
			new OpenLayers.Projection("EPSG:4326"),
			$scope.map.getProjectionObject()
		), 12
	);
	
	$scope.map.addControl( new OpenLayers.Control.LayerSwitcher() );
	$scope.layerPosition = new OpenLayers.Layer.Vector("positions");
	$scope.map.addLayer($scope.layerPosition);
	
	
	$scope.carroLayer = new OpenLayers.Layer.Vector('carro', {
		styleMap: new OpenLayers.StyleMap({
			externalGraphic: '../assets/sportscar.png',
            graphicWidth: 20, graphicHeight: 24, graphicYOffset: -24,
            title: '${tooltip}'
        })
	});
		
	$scope.map.addLayer($scope.carroLayer);
	$scope.map.zoomToMaxExtent();
	$scope.locations = new OpenLayers.Geometry.Point(-3.76151, -38.54154666666667).transform('EPSG:4326', 'EPSG:3857');
	$scope.carroLayer.addFeatures([
		new OpenLayers.Feature.Vector($scope.locations, {tooltip: 'OpenLayers'})
	]);
	
}