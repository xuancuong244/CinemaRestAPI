// Lấy danh sách ghế
const seats = document.querySelectorAll('.seat');

// Danh sách ghế đã chọn
let selectedSeats = [];

// Xử lý khi click vào ghế
seats.forEach(function (seat) {

    seat.addEventListener('click', function () {

        // Kiểm tra ghế đã được chọn chưa
        if (seat.classList.contains('selected')) {
            // Bỏ chọn
            seat.classList.remove('selected');

            // Xóa khỏi mảng ghế đã chọn
            selectedSeats = selectedSeats.filter(item => item !== seat);
        } else {
            // Chọn ghế
            seat.classList.add('selected');

            // Thêm vào mảng ghế đã chọn  
            selectedSeats.push(seat);
        }

        // Cập nhật giao diện
        updateSelectedSeats();

    });

});

// Hàm cập nhật giao diện
function updateSelectedSeats() {
    const selectedSeatsElement = document.getElementById('selected-seats');

    // Xóa hết nội dung trước đó
    selectedSeatsElement.innerHTML = '';

    // Thêm danh sách ghế đã chọn
    selectedSeats.forEach(function (seat) {
        const li = document.createElement('li');
        li.innerText = seat.dataset.name;
        selectedSeatsElement.appendChild(li);
    });
}

// Xử lý khi ấn Đặt vé
const bookBtn = document.getElementById('book-btn');

bookBtn.addEventListener('click', function () {
    // TODO: Validate và đặt vé
});

