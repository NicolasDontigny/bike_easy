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

  if(swalButton) {
    swalButton.addEventListener('click', (event) => {
      const link = event.currentTarget;
      swal(options).then((value) => {
        if (value) { link.click(); };
      })
    });
  }
}

export { initSweetalert };
