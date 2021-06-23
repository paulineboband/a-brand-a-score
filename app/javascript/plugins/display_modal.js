const showModal = () => {
  const modal = document.getElementById("reviewModal");
  const button = document.getElementById("add-review");
  if (modal.dataset.display == 'show') {
    button.click();
  }
}

export{showModal};
