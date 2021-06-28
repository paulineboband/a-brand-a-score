const searchBar = () => {

  const menu = document.getElementById("nav-search");
  const btn = document.getElementById("magnifying-glass");
  const search = document.getElementById("search-form");

  btn.addEventListener("click", (event) => {
    event.preventDefault();
    menu.classList.toggle("active");
    search.classList.toggle("active");

  });


}


export{searchBar};
