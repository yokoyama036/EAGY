document.addEventListener('turbolinks:load', () => {
  const fetchNutrientDataButton = document.getElementById('fetch-nutrient-data');

  if (fetchNutrientDataButton) {
    fetchNutrientDataButton.addEventListener('click', fetchNutrientData);
  }
});


async function fetchNutrientData(event) {
  event.preventDefault();

  var bg = document.getElementById('loader-bg'),
      loader = document.getElementById('loader');
  bg.classList.remove('is-hide');
  loader.classList.remove('is-hide');

  const name = document.getElementById('custom_food_name').value;
  const response = await fetch(`/custom_foods/fetch_nutrient_data_and_new?name=${name}`);
  const data = await response.json();

  document.getElementById('custom_food_calorie').value = data.calorie;
  document.getElementById('custom_food_protein').value = data.protein;
  document.getElementById('custom_food_carbo').value = data.carbo;
  document.getElementById('custom_food_fat').value = data.fat;
  document.getElementById('custom_food_salt').value = data.salt;
  document.getElementById('custom_food_unit').value = data.unit;

  bg.classList.add('fadeout-bg');
  loader.classList.add('fadeout-loader');
}

