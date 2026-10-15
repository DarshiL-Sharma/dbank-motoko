import {dbank} from "../../declarations/dbank";

window.addEventListener("load", async   function() {
  // console.log("Finished loading");
  const currentValue = await dbank.checkBalance();
  document.getElementById("value").innerText = Math.round(currentValue);

});     

document.querySelector("form").addEventListener("submit", async function(event) {
  event.preventDefault();
  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  if (!isNaN(inputAmount)) {
    await dbank.topUp(inputAmount);
  }

  const currentValue = await dbank.checkBalance();
  document.getElementById("value").innerText = Math.round(currentValue);

  document.getElementById("input-amount").value = "";
});