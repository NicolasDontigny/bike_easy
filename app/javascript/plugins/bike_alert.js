import swal from 'sweetalert';

export const displayAlert = () => {
  const createButton = document.querySelector('#created-alert')
  if (createButton) {
    swal({
      title: createButton.innerText,
      // text: `This will delete "${bikeName}" permanently from your account`,
      icon: "success",
      buttons: false
    })
    .then((value) => {
      console.log("hello")
      const swalAlert = document.querySelector('.swal-modal');
      console.log(swalAlert);
      swalAlert.setAttribute("id", "swal-created");
    })
  }
}
