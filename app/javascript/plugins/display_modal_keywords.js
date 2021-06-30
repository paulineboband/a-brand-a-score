const showKeywordsModal = () => {
  const modal = document.getElementById("keywordsModal");
  const button = document.getElementById("keywords");
  if (modal.dataset.request == 'show') {
    button.click();
  }
}

export{showKeywordsModal};
