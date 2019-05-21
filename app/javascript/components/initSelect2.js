import $ from "jquery";
import select2 from "select2";

import 'select2/dist/css/select2.css';

const initSelect2 = () => {
  $(document).ready(function() {
    $('.select2').select2( {
      placeholder: "Select a date",
      allowClear: true
    });
  });
}

export { initSelect2 };
