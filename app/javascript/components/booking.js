import flatpickr from 'flatpickr';
require("flatpickr/dist/themes/dark.css");


const toggleDateInputs = function() {
  const startDateInput = document.getElementById('booking_start_date');
  const endDateInput = document.getElementById('booking_end_date');

  if (startDateInput && endDateInput) {
    const unvailableDates = JSON.parse(document.querySelector('.form__wrapper').dataset.unavailable)

    flatpickr(startDateInput, {
    minDate: 'today',
    // mode: 'range',
    dateFormat: "Y-m-d",
    disable: unvailableDates,
    onChange: function(selectedDates, selectedDate) {
      if (selectedDate === '') {
        endDateInput.disabled = true;
      }
      let minDate = selectedDates[0];
      minDate.setDate(minDate.getDate() + 1);
      endDateCalendar.set('minDate', minDate);
      endDateInput.disabled = false;
    }
  });

    const endDateCalendar =
      flatpickr(endDateInput, {
        minDate: 'today',
        dateFormat: "Y-m-d",
        disable: unvailableDates,
    });
  }
};

export { toggleDateInputs }
