const initSorting = () => {
 const select = document.getElementById("select-sorting");

 select.addEventListener('change', (event) => {
  const type = event.currentTarget.value;
  var allCards = document.querySelectorAll('.card-product');

  allCards = Array.prototype.slice.call(allCards, 0);

  if (type == "A-Z") {
    allCards.sort(function(a, b){
      if(a.dataset.name < b.dataset.name) { return -1; }
      if(a.dataset.name > b.dataset.name) { return 1; }
      return 0;
    })
  } else if (type == "Z-A") {
    allCards.sort(function(a, b){
      if(a.dataset.name > b.dataset.name) { return -1; }
      if(a.dataset.name < b.dataset.name) { return 1; }
      return 0;
    })
  } else if (type == "Higher score") {
    allCards.sort(function(a, b){
      if(a.dataset.score > b.dataset.score) { return -1; }
      if(a.dataset.score < b.dataset.score) { return 1; }
      return 0;
    })
  } else if (type == "Lower score") {
    allCards.sort(function(a, b){
      if(a.dataset.score < b.dataset.score) { return -1; }
      if(a.dataset.score > b.dataset.score) { return 1; }
      return 0;
    })
  }


  var parent = document.getElementById('cards-div');
  parent.innerHTML = "";
  for(var i = 0, l = allCards.length; i < l; i++) {
  parent.appendChild(allCards[i]);
}


  });

};

export { initSorting };
