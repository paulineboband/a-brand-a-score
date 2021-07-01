function capitalizeFirstLetter(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}

const card = (brand) => {

  const categories = brand.categories.map(category => `<p class="tag">${capitalizeFirstLetter(category)}</p>`);
  console.log(categories);
 return `
  <div class="card-product" data-name="${brand.name}" data-score="${brand.overall_score}" data-id="${brand.id}">
      <div data-category-select="clothing">  </div>
      <div>
        <img src="${brand.logo}">
      </div>
      <div class="card-product-infos">
        <p id="brand-name"><a href="/brands/${brand.id}">${brand.name}</a></p>
        <sl-rating class="star-index" precision=".1" readonly="" value="${brand.overall_score}"></sl-rating>
        <span class="rate-index">${Math.round(brand.overall_score*10)/10}</span>
        <div class="container-tags">
            ${categories.join(' ')}
        </div>
      </div>
  </div>
 `;
}


const initCategoryFilter = () => {
   const select = document.getElementById("select-filter");
   console.log(select)



//  const initialType = document.getElementById('select-filter').value
//  const cards = document.querySelectorAll(`[data-category-select=${initialType}]`);
//  const allCards = document.querySelectorAll('.card-product')
//  allCards.forEach(card => card.style.display = 'none');
//  cards.forEach(card => card.parentElement.style.display = "");
//  if (type == "All") {
//    allCards.forEach(card => card.style.display = "");
//  }


 select.addEventListener('change', (event) => {

  // Clear url
  const url = window.location.href
  if ( url.match(/\?\w*=\w*/) ) {
    window.history.pushState('', '', url.replace(/\?\w*=\w*/, ''))
  };

  let brands;
  const type = event.currentTarget.value;
  // Fetch brands
  fetch(window.location.href + `?category=${type}`, {
      headers : {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
       }

    })
  .then((response) => {
    return response.json();
  })
  .then((data) => {
    console.log(data);
    brands = data;


    // Clear brands cards
    const cardsDiv = document.getElementById('cards-div');
    cardsDiv.innerHTML = '';
    // Add brands card to the DOM
    console.log(card(brands[0]));
    brands.forEach((brand) => {
      cardsDiv.insertAdjacentHTML('beforeend', card(brand))
    });
  });



  // Filter brands
  //const type = event.currentTarget.value;
  //const cards = document.querySelectorAll(`[data-category-select=${type}]`);
  //const allCards = document.querySelectorAll('.card-product')
  //allCards.forEach(card => card.style.display = 'none');
  //cards.forEach(card => card.parentElement.style.display = "");
  //if (type == "All") {
  //  allCards.forEach(card => card.style.display = "");
  //  }

  });


};

export { initCategoryFilter };
