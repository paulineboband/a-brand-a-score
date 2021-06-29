const initCategoryFilter = () => {
 const select = document.getElementById("select-filter");
 console.log(select)

 select.addEventListener('change', (event) => {
  const type = event.currentTarget.value;
  const cards = document.querySelectorAll(`[data-category-select=${type}]`);
  console.log(cards)
  const allCards = document.querySelectorAll('.card-product')
  allCards.forEach(card => card.style.display = 'none');
  cards.forEach(card => card.parentElement.style.display = "");
  if (type == "All") {
    allCards.forEach(card => card.parentElement.style.display = "");
    }
  });


};

export { initCategoryFilter };
