import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapboxBike = () => {

  const mapElement = document.getElementById('map_bike');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const markers = JSON.parse(mapElement.dataset.markers);
    const map = new mapboxgl.Map({
      container: 'map_bike',
      style: 'mapbox://styles/mapbox/streets-v10',
      minZoom: 14,
      center: [markers.lng, markers.lat]
    });

    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));

    const popup = new mapboxgl.Popup().setHTML(markers.infoWindow);

    new mapboxgl.Marker()
      .setLngLat([ markers.lng, markers.lat ])
      .setPopup(popup)
      .addTo(map);
  }
};

export { initMapboxBike };
