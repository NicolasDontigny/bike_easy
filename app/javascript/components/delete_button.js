import swal from 'sweetalert';

const clickOnButton = (event) => {
  const id = event.currentTarget.id;
  const authToken = event.currentTarget.getAttribute('token')
  const httpUrl = `/bikes/${id}`
  const bikeName = event.currentTarget.parentNode.parentNode.querySelector("h2").innerText;

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
          const deletedCard = document.getElementById(`${id}`).parentNode.parentNode.parentNode;
          // const nextCard = deletedCard.nextSibling
          deletedCard.style.opacity = 0;
          setTimeout(function() {
            deletedCard.insertAdjacentHTML("beforebegin",
              `<div class="alert alert-success alert-dismissable fade show alert-deleted" role="alert">"${bikeName}" successfully deleted<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button></div>`
            )
            deletedCard.remove();

            const deleteAlert = document.querySelector('.alert-deleted')

            setTimeout(function() {
              deleteAlert.style.opacity = 0;


            }, 1500)

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
