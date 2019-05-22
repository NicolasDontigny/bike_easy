import swal from 'sweetalert';


const initSweetalert = () => {
  const bikeName = document.querySelector('.bike__title').innerText;
  const options = {
    title: "Please confirm the booking",
    icon: "warning",
    text: `Please confirm you want to book "${bikeName}"`,
    buttons: ['Let me check with my wife...', "Let's ride!"],
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
