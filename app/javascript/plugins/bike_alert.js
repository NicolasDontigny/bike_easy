import swal from 'sweetalert';

export const displayAlert = () => {
  const createButton = document.querySelector('#created-alert')
  if (createButton) {
    swal({
      // title: createButton.innerHTML,
      title: createButton.innerText,
      icon: "success",
      buttons: false
    })

    const swalOverlay = document.querySelector('.swal-overlay');
    swalOverlay.setAttribute("id", "swal-created-overlay");

    const swalAlert = document.querySelector('.swal-modal');
    swalAlert.setAttribute("id", "swal-created");

    setTimeout(() => {
      swalOverlay.style.opacity = 0;
    }, 2000)

    setTimeout(() => {
      swalOverlay.remove();
    }, 3000);
  }
}
