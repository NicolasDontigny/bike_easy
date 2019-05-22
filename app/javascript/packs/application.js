import "bootstrap";

import { deleteButton } from 'plugins/delete_button'

import 'select2/dist/css/select2.css';

import { initSelect2 } from '../plugins/initSelect2';
import { initSweetalert } from '../plugins/init_sweetalert';

// Import mapbox function and and css
import { initMapbox } from '../plugins/init_mapbox';
import 'mapbox-gl/dist/mapbox-gl.css';

// Map Search feature
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

// Input address autocomplete
import { initAutocomplete } from '../plugins/init_autocomplete';

deleteButton();

console.log('Hello World from BikeEazy')

initSelect2();

initSweetalert();

initMapbox();

initAutocomplete();

