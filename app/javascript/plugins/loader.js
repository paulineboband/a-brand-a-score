const loader = () => {

  const btn = document.getElementById("loader-btn");
  const loader = document.getElementById("img-loading");
  const form = document.getElementById("review-loading");

  const tab = document.getElementById("nav-profile-tab");

  if (tab.dataset.displayReview == 'true') {
    tab.click();
  }

  loader.style.display = "none";

  btn.addEventListener("click", (event) => {
    setTimeout(function () {
      loader.style.display = "";
      form.style.display = "none";
    }, 1000);
  });



}

export{loader};
