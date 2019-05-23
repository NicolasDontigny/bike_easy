import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers => bounds.extend([ marker.lng, marker.lat ]);
  map.fitBounds(bounds, { padding: 100, maxZoom: 15, duration: 0 });
};

const initMapboxBike = () => {

  const mapElement = document.getElementById('map_bike');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));

    const markers = JSON.parse(mapElement.dataset.markers);
    const popup = new mapboxgl.Popup().setHTML(markers.infoWindow);

    new mapboxgl.Marker()
      .setLngLat([ markers.lng, markers.lat ])
      .setPopup(popup)
      .addTo(map);

    fitMapToMarkers(map, markers);
  }
};

export { initMapboxBike };
