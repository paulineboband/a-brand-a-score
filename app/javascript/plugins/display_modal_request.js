const showRequestModal = () => {
  const modal = document.getElementById("requestModal");
  const button = document.getElementById("add-request");
  if (modal.dataset.request == 'show') {
    button.click();
  }
}

export{showRequestModal};
