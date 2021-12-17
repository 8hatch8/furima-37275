function calcProfit() {
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener("keyup", () => {
    const taxPrice = document.getElementById("add-tax-price");
    const profit   = document.getElementById("profit");
    const price    = parseInt(itemPrice.value);

    if ( !price || price < 300 ) {
      taxPrice.innerHTML = "";
      profit.innerHTML   = "";
    } else {
      const calcTax      = parseInt(price / 10);
      const calcProfit   = parseInt(price - calcTax);
      
      taxPrice.innerHTML = calcTax.toLocaleString();
      profit.innerHTML   = calcProfit.toLocaleString();
    };
  });
};

window.addEventListener('load', calcProfit);