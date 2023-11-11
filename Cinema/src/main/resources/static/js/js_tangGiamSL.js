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


// Hàm tính tổng tiền
// Hàm tính tổng tiền
function calculateTotal() {
    // Khởi tạo biến tổng tiền
    let total = 0;

    // Lấy tất cả các trường nhập liệu có id bắt đầu bằng 'input-'
    const inputs = document.querySelectorAll('[id^="input-"]');

    // Duyệt qua danh sách các phần tử
    inputs.forEach(function (input) {
        // Lấy giá trị và id của từng phần tử
        const value = parseInt(input.value);
        const id = input.id.slice(6); // bỏ đi 'input-' để lấy chỉ số

        // Nhân giá trị với giá tiền của sản phẩm tương ứng trong mảng productPrices
        const price = productPrices[id];
        const subtotal = value * price;

        // Cộng vào biến tổng tiền
        total += subtotal;
    });

    // Hiển thị tổng tiền ở một phần tử nào đó trên trang web
    const totalElement = document.getElementById('total');
    totalElement.textContent = total + ' vnđ';
    const totalElement1 = document.getElementById('Alltotal');
    totalElement1.textContent = total + ' vnđ';
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



// function calculateTotal() {

//     let total = 0;

//     // Lấy tất cả các trường nhập liệu có id bắt đầu bằng 'input-'
//     const inputs = document.querySelectorAll('[id^="input-"]');
//     inputs.forEach(function (input) {
//         // Lấy giá trị và id của từng phần tử
//         const value = parseInt(input.value);
//         const id = input.id.slice(6); // bỏ đi 'input-' để lấy chỉ số
//         const price = productPrices[id];
//         const subtotal = value * price;
//         total += subtotal;
//     });

//     // Hiển thị tổng tiền ở một phần tử nào đó trên trang web
//     const totalElement = document.getElementById('total');
//     totalElement.textContent = total + ' VND';
//     console.log(value, "input");
//     console.log(id, "id");
//     console.log(typeof price);
//     console.log(total);
// }