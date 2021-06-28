
function move(selector) {
  var i = 0;
  const bar = document.getElementById(selector);
  const maxWidth = bar.dataset.width
  if (i == 0) {
    i = 1;
    var width = 1;
    var id = setInterval(frame, 10);
    function frame() {
      if (width >= maxWidth) {
        clearInterval(id);
        i = 0;
      } else {
        width++;
        bar.style.width = width + "%";
      }
    }
  }
}

export{move};
