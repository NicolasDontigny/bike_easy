import "bootstrap";

import { deleteButton } from 'plugins/delete_button'

import 'select2/dist/css/select2.css';

import { initSelect2 } from '../plugins/initSelect2';
import { initSweetalertBooking } from '../components/init_sweetalert_booking';

// Import mapbox function and and css
import { initMapbox } from '../plugins/init_mapbox';
import 'mapbox-gl/dist/mapbox-gl.css';

// Map Search feature
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

// Input address autocomplete
import { initAutocomplete } from '../plugins/init_autocomplete';

import { displayAlert } from '../plugins/bike_alert'

deleteButton();

console.log('Hello World from BikeEazy')

initSelect2();

initSweetalertBooking();

initMapbox();

initAutocomplete();

displayAlert();

