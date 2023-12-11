const giamBtns = document.querySelectorAll('.giam');
const tangBtns = document.querySelectorAll('.tang');
const productPrices = {
    '1': 139000,
    '2': 46000,
    '3': 28000,
    '4': 95000
};
// Hàm xử lý giảm số lượng
function handleGiam(btn) {
    const id = btn.dataset.id;
    const input = document.getElementById('input-' + id);
    let value = parseInt(input.value);
    value = Math.max(0, value - 1);

    input.value = value;
    // console.log(value);
}

// Hàm xử lý tăng số lượng
function handleTang(btn) {
    const id = btn.dataset.id;
    const input = document.getElementById('input-' + id);
    let value = parseInt(input.value);
    value = Math.max(1, value + 1);

    input.value = value;

}

function getSeatPrice(seatType) {
    // Giả sử giá được lưu trữ trong một đối tượng hoặc bảng dữ liệu
    const seatPrices = {
        'Vip': 75000,
        'Thường': 45000,
        // Thêm các loại ghế khác nếu có
    };

    // Trả về giá ghế tương ứng với loại ghế
    return seatPrices[seatType] || 0; // Trả về giá mặc định nếu không tìm thấy loại ghế
}

function calculateToppingsTotal() {
    let totalToppings = 0;

    // Lấy tất cả các trường nhập liệu có id bắt đầu bằng 'input-'
    const inputs = document.querySelectorAll('[id^="input-"]');

    // Duyệt qua danh sách các phần tử
    inputs.forEach(function (input) {
        const value = parseInt(input.value);
        const id = input.id.slice(6);
        const price = productPrices[id];
        const subtotal = value * price;

        totalToppings += subtotal;
    });
    console.log('totalToppings (calculated):', totalToppings);
    return totalToppings;
}

function formatCurrency(amount) {
    return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(amount);
}

function calculateTotal() {
    let totalSeats = 0;

    // Lấy giá trị ghế đã chọn từ localStorage
    const selectedSeatsInfo = JSON.parse(localStorage.getItem('selectedSeats'));

    // Duyệt qua danh sách ghế đã chọn và tính tổng tiền ghế
    if (selectedSeatsInfo) {
        selectedSeatsInfo.forEach(function (seatInfo) {
            totalSeats += getSeatPrice(seatInfo.seatType);
        });
    }

    // Tổng tiền ghế
    const totalSeatsElement = document.getElementById('totalSeats');
    totalSeatsElement.textContent = formatCurrency(totalSeats);

    // Tổng tiền topping
    const totalToppings = calculateToppingsTotal();

    // Tổng tiền = Tổng tiền ghế + Tổng tiền topping
    if (!isNaN(totalToppings) && !isNaN(totalSeats)) {
        console.log('totalToppings:', totalToppings);
        console.log('totalSeats:', totalSeats);

        // Tổng tiền = Tổng tiền ghế + Tổng tiền topping
        const total = totalSeats + totalToppings;

        // Hiển thị tổng tiền ở một phần tử nào đó trên trang web
        const totalElement = document.getElementById('total');
        totalElement.textContent = formatCurrency(totalToppings);

        const totalElement1 = document.getElementById('Alltotal');
        totalElement1.textContent = formatCurrency(total);
    } else {
        // Xử lý trường hợp totalToppings hoặc totalSeats là NaN
        console.error("Giá trị totalToppings hoặc totalSeats không hợp lệ");
    }
}


// Gọi hàm tính tổng tiền mỗi khi thay đổi số lượng của một sản phẩm
giamBtns.forEach(function (btn) {
    btn.addEventListener('click', function () {
        handleGiam(this);
        calculateTotal();
    });
});

tangBtns.forEach(function (btn) {
    btn.addEventListener('click', function () {
        handleTang(this);
        calculateTotal();
    });
});


