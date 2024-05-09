axios.get("http://localhost:8001/getuser", {
  headers: {
    token: window.sessionStorage.getItem("token")
  }
}).then(result => {
  console.log(result);
});