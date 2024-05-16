const bcrypt = dcodeIO.bcrypt;
var option;

$("input[type='radio'][name='option']").click(function () {
  option = $(this).val();
});

$("#btn_register").click(() => {
  axios.post("http://localhost:8001/register", {
    name: $("#in_name_register").val(),
    email: $("#in_email_register").val(),
    pass: bcrypt.hashSync($("#in_pass_register").val()),
    option: option
  }).then(result => {
    if (result.status == 201) {
      container.classList.remove("active");
      message.classList.add('show');
      setTimeout(function () {
        message.classList.remove('show');
      }, 2000);
      $("#in_name_register").val("");
      $("#in_email_register").val("");
      $("#in_pass_register").val("");
      $("input[type='radio'][name='option']").prop('checked', false);
    } else if (result.status != 201) {
      alert("algo deu errado");
    }
  }).catch(err => {
    alert(err.response.data);
  });

});