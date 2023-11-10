// Lấy các phần tử
// const minusBtn = document.querySelector('.giam')
// const plusBtn = document.querySelector('.tang')
// const input = document.querySelector('.soluong') 

const giamBtns = document.querySelectorAll('.giam');
const tangBtns = document.querySelectorAll('.tang');
// Hàm xử lý giảm số lượng
function handleGiam(btn) {
    const id = btn.dataset.id;
    const input = document.getElementById('input-' + id);

    let value = parseInt(input.value);
    value = Math.max(0, value - 1);

    input.value = value;
}

// Hàm xử lý tăng số lượng
function handleTang(btn) {
    const id = btn.dataset.id;
    const input = document.getElementById('input-' + id);

    let value = parseInt(input.value);
    value = Math.max(1, value + 1);

    input.value = value;
}

// Gắn sự kiện cho nút giảm
giamBtns.forEach(function (btn) {
    btn.addEventListener('click', function () {
        handleGiam(this);
    });
});

// Gắn sự kiện cho nút tăng
tangBtns.forEach(function (btn) {
    btn.addEventListener('click', function () {
        handleTang(this);
    });
});
// Hàm xử lý tăng số lượng
function handleTang(btn) {

    // Lấy id và input element
    const id = btn.dataset.id;
    const input = document.getElementById('input-' + id);

    // Tăng giá trị hiện tại lên 1 
    let value = parseInt(input.value);
    value = Math.max(1, value + 1);

    // Cập nhật lại giá trị mới vào input
    input.value = value;

}




// Xử lý sự kiện click cho nút trừ
// minusBtn.addEventListener('click', () => {
//     let value = parseInt(input.value) - 1
//     if (value > 0) {
//         input.value = value
//     }
// })

// // Xử lý sự kiện click cho nút cộng
// plusBtn.addEventListener('click', () => {
//     let value = parseInt(input.value) + 1
//     input.value = value
// })