import swal from 'sweetalert';

const swalButton = document.getElementById('booking__submit');
const form = document.getElementById('new_booking');

const initSweetalertBooking = () => {
  const bikeName = document.querySelector('.bike__title');
  if (bikeName) {
    const options = {
      title: "Please confirm the booking",
      icon: "warning",
      text: `Please confirm you want to book "${bikeName.innerText}"`,
      buttons: ['Let me check with my wife...', "Let's ride!"],
      dangerMode: true,
    };

    if(swalButton) {
      swalButton.addEventListener('click', (event) => {
        event.preventDefault();
        swal(options).then((value) => {
          if (value) {
            form.submit();
            swal("Done! Get yo' helmet on!", {
              icon: "success",
            });
          }else {
            swal("No worries! Walking is cool too.");
          }
        });
      });
    };
  }
}

export { initSweetalertBooking };
