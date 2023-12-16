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
    const id = +btn.getAttribute('data-id');
    const input = document.getElementById('input-' + id);
    let value = parseInt(input.value);
    value = Math.max(0, value - 1);

    input.value = value;
    // console.log(value);
    updateLocalStorage();
}

// Hàm xử lý tăng số lượng
function handleTang(btn) {
    const id = +btn.getAttribute('data-id');
    const input = document.getElementById('input-' + id);
    let value = parseInt(input.value);
    value = Math.max(1, value + 1);

    input.value = value;
    updateLocalStorage();
}

// Function để cập nhật thông tin vào Local Storage
function updateLocalStorage() {
    const selectedToppings = getSelectedToppings(); // Hàm này để lấy danh sách topping đã chọn
    localStorage.setItem('selectedToppings', JSON.stringify(selectedToppings));

    const totalToppings = calculateToppingsTotal(selectedToppings);

    // Cập nhật tổng tiền toppings
    const totalElement = document.getElementById('total');
    totalElement.textContent = formatCurrency(totalToppings);

    calculateTotal();
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
    // const selectedToppingsInfo = getSelectedToppings();
    // const totalToppings = calculateToppingsTotal(selectedToppingsInfo);

    // Tổng tiền = Tổng tiền ghế
    if (!isNaN(totalSeats)) {
        // console.log('totalToppings:', totalToppings);
        console.log('totalSeats:', totalSeats);

        // Tổng tiền = Tổng tiền ghế + Tổng tiền topping
        const total = totalSeats;

        // Hiển thị tổng tiền ở một phần tử nào đó trên trang web
        // const totalElement = document.getElementById('total');
        // totalElement.textContent = formatCurrency(totalToppings);

        const totalElement1 = document.getElementById('Alltotal');
        totalElement1.textContent = formatCurrency(total);
    } else {
        // Xử lý trường hợp totalToppings hoặc totalSeats là NaN
        console.error("Giá trị totalSeats không hợp lệ");
    }
}

// function getSelectedToppings() {
//     const selectedToppings = [];
//
//     // Lấy tất cả các trường nhập liệu có id bắt đầu bằng 'input-'
//     const inputs = document.querySelectorAll('[id^="input-"]');
//
//     // Duyệt qua danh sách các phần tử
//     inputs.forEach(function (input) {
//         const value = parseInt(input.value);
//         const dataId = input.getAttribute('data-id');
//         // const price = productPrices[id];
//
//         if (dataId) {
//             const id = +dataId;
//             const price = productPrices[id];
//         // Kiểm tra nếu số lượng topping lớn hơn 0, thì thêm vào danh sách
//         if (value > 0) {
//             if (!isNaN(id) && Number.isInteger(id) && id !== 0 && value > 0) {
//                 const comboRow = document.querySelector(`tr[data-name="Combo ${id}"]`);
//                 if (comboRow) {
//                     const comboName = comboRow.dataset.name;
//                     selectedToppings.push({
//                         id: id,
//                         name: comboName,
//                         quantity: value,
//                         price: price
//                     });
//                 } else {
//                     console.error(`Không tìm thấy phần tử với data-name="Combo ${id}"`);
//                 }
//             } else {
//                 console.error(`Giá trị không hợp lệ cho id: ${input.dataset.id}`);
//             }
//         }else {
//             console.error('Thuộc tính data-id không tồn tại cho phần tử input.');
//         }
//         }});
//
//     console.log('selectedToppings:', selectedToppings);
//
//     return selectedToppings;
// }

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


