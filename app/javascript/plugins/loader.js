const loader = () => {

  const tab = document.getElementById("nav-profile-tab");

  if (tab.dataset.displayReview == 'true') {
    tab.click();
  }

}

export{loader};
