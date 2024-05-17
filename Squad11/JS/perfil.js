axios.get("http://localhost:8001/getuser", {
  headers: {
    token: window.sessionStorage.getItem("token")
  }
}).then(result => {
  $(".profile-info").append(`
    <h1 class="name">${result.data.name}</h1>
    <p class="email">${result.data.email}</p>
    <p class="role">${result.data.atuacao}</p>
  `);
  $(".about-section").append(`
    <p>${result.data.txt}</p>
  `);
  $(".seguidores").append(`
    <p>${Math.floor(Math.random() * 1000) + 1}</p>
  `);
  $(".seguindo").append(`
    <p>${Math.floor(Math.random() * 500) + 1}</p>
  `);
  $(".pontuacao").append(`
    <p>${Math.floor(Math.random() * 5000) + 1}</p>
  `);
}).catch(err => {
  alert("Sessão expirou, faça login novamente");
  window.location.href = "/login.html";
});


$(".btn_exit").click(function (e) {
  window.sessionStorage.removeItem("token");
  window.location.href = "/index.html"
});