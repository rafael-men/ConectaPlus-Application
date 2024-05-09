$("#btn_login").click(() => {
  const user = {
    email: $("#in_email_login").val(),
    pass: $("#in_pass_login").val()
  };

  axios.get(`http://localhost:8001/login?email=${user.email}&pass=${user.pass}`).then(result => {
    if (result.status != 200) {
      alert("Ocorreu algum erro, revise o email e a senha e tente novamente. Caso nao consiga tente recuperar a senha ou contate o administrador");
    } else if (result.status === 200) {
      window.sessionStorage.setItem("token", result.data);
      window.location.href = "/perfil.html"
    }
  }).catch(err => {
    alert("Ocorreu algum erro, revise o email e a senha e tente novamente. Caso nao consiga tente recuperar a senha ou contate o administrador");
  });

});