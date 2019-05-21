import swal from 'sweetalert';


const initSweetalert = () => {
  const options = {
    title: "Please confirm the booking",
    text: "<%= @booking.id %>",
    icon: "warning",
    buttons: true,
    dangerMode: true,
  };

  const swalButton = document.getElementById('booking__submit');
  const form = document.getElementById('new_booking')

  if(swalButton) {
    swalButton.addEventListener('click', (event) => {
      event.preventDefault();
      swal(options).then((value) => {
        if (value) { form.submit(); };
      })
    });
  }
}

export { initSweetalert };
