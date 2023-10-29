const selectedSeats = [];
const seats = document.querySelectorAll(".seat");

seats.forEach(function (seat) {
  // Xử lý click
  seat.addEventListener("click", function () {
    if (seat.classList.contains("selected")) {
      // Nếu đã chọn, bỏ chọn
      seat.classList.remove("selected");
      selectedSeats.splice(selectedSeats.indexOf(seat.innerText), 1);
    } else {
      // Nếu chưa chọn, thêm vào mảng
      seat.classList.add("selected");
      selectedSeats.push(seat.innerText);
    }

    updateSelectedSeats();
  });
});

function updateSelectedSeats() {
  const seatsHTML = selectedSeats
    .map(function (seat) {
      return "<span>" + seat + "</span>";
    })
    .join(", ");

  document.getElementById("selected-seats").innerHTML = seatsHTML;
}
