document.addEventListener("DOMContentLoaded", function () {
    // Kiểm tra xem người dùng đã đăng nhập chưa
    if (sessionStorage.getItem("loggedIn") === "true") {
        // Lấy userId từ sessionStorage
        const maKH = sessionStorage.getItem("maKH");

        if(maKH){
            // Gửi yêu cầu API để lấy thông tin khách hàng
            fetch(`http://localhost:8085/api/KhachHang/${maKH}`)
                .then(response => response.json())
                .then(data => {
                    const customerName = data.tenKH;
                    const customerPhone = data.soDT;
                    const customerEmail = data.email;

                    // Hiển thị thông tin khách hàng lên trang thanh toán
                    document.getElementById('customerName').textContent = customerName;
                    document.getElementById('customerPhone').textContent = customerPhone;
                    document.getElementById('customerEmail').textContent = customerEmail;
                })
                .catch(error => {
                    console.error('Error fetching customer data:', error);
                });
        }else {
            console.error('maKH is undefined');
        }
    }
});
