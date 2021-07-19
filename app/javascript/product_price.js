window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
     console.log(inputValue);

     const addTaxDom = document.getElementById("add-tax-price");
     const kokotax =inputValue*0.1
    addTaxDom.innerHTML =  kokotax
  

    const  Papatax= document.getElementById("profit");
      const mamatax = inputValue - kokotax
      Papatax.innerHTML=mamatax
  })
});