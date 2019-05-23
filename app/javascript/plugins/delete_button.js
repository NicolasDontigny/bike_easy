import swal from 'sweetalert';

const clickOnButton = (event) => {
  const id = event.currentTarget.id;
  const authToken = event.currentTarget.dataset.token
  const httpUrl = `/bikes/${id}`
  const bikeName = event.currentTarget.parentNode.parentNode.parentNode.querySelector(".bike-title").innerText;

  swal({
    title: "Are you sure?",
    text: `This will delete "${bikeName}" permanently from your account`,
    icon: "warning",
    buttons: ["Not sure...", "Yep!"],
    dangerMode: true,
  })
  .then((willDelete) => {
    if (willDelete) {
      $.ajax({
        url: httpUrl,
        type: 'DELETE',
        data: {authenticity_token: authToken, confirm: "Are you sure?"},
      })
        .done(function( data ) {
          const deletedCard = document.getElementById(`${id}`).parentNode.parentNode.parentNode.parentNode;
          // const nextCard = deletedCard.nextSibling
          deletedCard.style.opacity = 0;
          setTimeout(function() {

            deletedCard.remove();

            swal({
              // title: createButton.innerHTML,
              title: `Deleted ${bikeName} successfully`,
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

          }, 400)

        });
    } else {
      swal("Phewww, that was close!");
    }
  });



}

const addEventToButton = (button) => {
  button.addEventListener("click", clickOnButton)
}

export const deleteButton = () => {
  const buttons = document.querySelectorAll('.delete-btn')

  if (buttons.length > 0) {
    buttons.forEach(addEventToButton);
  }
}
