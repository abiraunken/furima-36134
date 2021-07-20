window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;

     const addTaxDom = document.getElementById("add-tax-price");
     const kokotax =Math.floor(inputValue*0.1)
    addTaxDom.innerHTML =  kokotax
  

    const  Papatax= document.getElementById("profit");
      const mamatax = inputValue - kokotax
      Papatax.innerHTML=mamatax
  })
});