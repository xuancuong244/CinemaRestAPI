function getSeatType(seat) {
  const row = seat.charAt(0);  // Loại bỏ dòng này vì seat không còn là chuỗi
  const seatNumber = parseInt(seat.slice(1), 10);
  const isVIP = row >= 'A' && row <= 'H' && seatNumber >= 5 && seatNumber <= 14;
  return isVIP ? 'Vip' : 'Thường';
}

const selectedSeats = [];
const seats = document.querySelectorAll(".seat");

seats.forEach(function (seat) {
  // Xử lý click
  seat.addEventListener("click", function () {

    const seatData = seat.dataset.seat; // Lấy dữ liệu ghế từ thuộc tính dataset
    console.log("Click on seat:", seatData);

    if (seat.classList.contains("selected")) {
      // Nếu đã chọn, bỏ chọn
      seat.classList.remove("selected");
      selectedSeats.splice(selectedSeats.findIndex(seat => seat.seat === seatData), 1);
    } else {
      // Nếu chưa chọn, thêm vào mảng
      seat.classList.add("selected");
      selectedSeats.push({ seat: seatData, seatType: getSeatType(seatData) });
    }
    updateSelectedSeats();
  });
});

function updateSelectedSeats() {
  const selectedSeatsInfo = selectedSeats.map(seat => {
    const seatType = getSeatType(seat.seat);  // Hàm getSeatType để lấy loại ghế
    return { seat: seat.seat, seatType: seatType };
  });

  const seatsHTML = selectedSeatsInfo
    .map(function (seatInfo) {
      return `<span class='text-danger'>${seatInfo.seat}(${seatInfo.seatType})</span>`;
    })
    .join(", ");


  document.getElementById("selected-seats").innerHTML = seatsHTML;

  // Lưu danh sách ghế đã chọn vào localStorage
  localStorage.setItem('selectedSeats', JSON.stringify(selectedSeatsInfo));
}
