document.addEventListener("turbolinks:load", () => {
  const registerFoodButtons = document.querySelectorAll(".register-food");

  registerFoodButtons.forEach((button) => {
    button.addEventListener("click", (event) => {
      const foodId = event.currentTarget.dataset.foodId;
      const mealTiming = event.currentTarget.previousElementSibling.value;

      console.log("Food ID:", foodId);
      console.log("Meal Timing:", mealTiming);
    });
  });
});
