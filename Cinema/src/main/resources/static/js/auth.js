$(document).ready(function () {

    function checkLoggedInStatus() {
        if (sessionStorage.getItem("loggedIn") === "true") {

            // Đã đăng nhập, ẩn phần đăng nhập/đăng ký
            $("#loginToggleBtn").hide();

            // Hiển thị nút đăng xuất
            $("#logoutBtn").show();
        } else {
            // Chưa đăng nhập, hiển thị phần đăng nhập/đăng ký
            $("#loginToggleBtn").show();

            // Ẩn nút đăng xuất
            $("#logoutBtn").hide();
        }
    }

    // Kiểm tra trạng thái đăng nhập
    checkLoggedInStatus();

    // Xử lý sự kiện click trên nút Đăng Xuất
    $("#logoutBtn").click(function () {
        // Xóa thông tin session
        sessionStorage.removeItem("loggedIn");
        sessionStorage.removeItem("userRole");

        checkLoggedInStatus();

        // Hiển thị phần đăng nhập/đăng ký
        $("#loginToggleBtn").show();

        // Ẩn nút đăng xuất
        $("#logoutBtn").hide();
    });

    // Xử lý khi người dùng nhấn nút đăng nhập
    $("#exampleModalToggle button[type='submit']").click(function (event) {
        event.preventDefault(); // Ngăn chặn sự kiện mặc định của nút submit
        // Lấy giá trị từ các trường input
        var email = $("#exampleInputMail").val();
        var password = $("#exampleInputPassword1").val();
        var redirectUrl = $(this).data("redirect-url");
        // Kiểm tra quyền đăng nhập
        if (email && password) {
            // Gửi yêu cầu đăng nhập đến RESTful API của bạn
            $.ajax({
                type: "POST",
                url: "/api/login", // Thay đổi đường dẫn tùy thuộc vào cấu hình của bạn
                contentType: "application/json",
                data: JSON.stringify({ email: email, password: password }),
                success: function (data) {
                    // Xử lý phản hồi từ server
                    if (data.role === "nhan_vien" || data.role === "khach_hang") {
                        alert("Đăng nhập thành công");
                        // Lưu thông tin vào sessionStorage
                        sessionStorage.setItem("loggedIn", true);
                        sessionStorage.setItem("userRole", data.role);
                        // Lưu thêm thông tin khác nếu cần
                        sessionStorage.setItem("userId", data.userId); // Ví dụ: lưu ID của người dùng

                        checkLoggedInStatus();

                        // Thực hiện các hành động cho quyền nhân viên hoặc khách hàng
                        if (data.role === "nhan_vien") {
                            alert("Đăng nhập thành công với quyền nhân viên");
                            // Gọi lại hàm kiểm tra trạng thái đăng nhập
                            checkLoggedInStatus();
                            // Chuyển hướng đến trang admin
                            window.location.href = "http://localhost:8085/DynamicCinema/admin/index";
                        } else if (data.role === "khach_hang") {
                            alert("Đăng nhập thành công với quyền khách hàng");
                            // Gọi lại hàm kiểm tra trạng thái đăng nhập
                            checkLoggedInStatus();

                            // Kiểm tra nếu đường dẫn không chứa /admin/ thì mới chuyển hướng
                            if (!window.location.href.includes("/admin/")) {
                                // Chuyển hướng đến trang khách hàng
                                window.location.href = "http://localhost:8085/DynamicCinema/index";
                            } else {
                                alert("Bạn không có quyền truy cập trang admin.");
                            }
                        } else {
                            alert("Đăng nhập không thành công. Kiểm tra lại thông tin đăng nhập");
                        }
                    } else {
                        alert("Đăng nhập không thành công. Kiểm tra lại thông tin đăng nhập");
                    }
                },
                error: function () {
                    alert("Đã có lỗi xảy ra trong quá trình đăng nhập");
                }
            });
        } else {
            alert("Vui lòng nhập đầy đủ thông tin đăng nhập");
        }
    });

    // Hàm kiểm tra đăng nhập ở phía server (cần triển khai)
    function checkLogin(email, password,redirectUrl) {
        $.ajax({
            type: "POST",
            url: "/api/login", // Thay đổi đường dẫn tùy thuộc vào cấu hình của bạn
            contentType: "application/json",
            data: JSON.stringify({ email: email, password: password }),
            success: function (data) {
                // Kiểm tra quyền đăng nhập và thực hiện các hành động tương ứng
                if (data.role === "nhan_vien") {
                    alert("Đăng nhập thành công với quyền nhân viên");
                    // Thực hiện các hành động cho quyền nhân viên
                    window.location.href = redirectUrl; // Chuyển hướng đến trang đã được chỉ định
                } else if (data.role === "khach_hang") {
                    alert("Đăng nhập thành công với quyền khách hàng");
                    // Thực hiện các hành động cho quyền khách hàng
                    window.location.href = redirectUrl; // Chuyển hướng đến trang đã được chỉ định
                } else {
                    alert("Đăng nhập không thành công. Kiểm tra lại thông tin đăng nhập");
                }
            },
            error: function () {
                alert("Đã có lỗi xảy ra trong quá trình đăng nhập");
            }
        });
    }

    // Xử lý sự kiện click trên nút
    $("#staticBackdrop button").click(function () {
        // Lấy thông tin đăng nhập từ người dùng (điều này cần phải được triển khai trong ứng dụng của bạn)
        var email = prompt("Nhập email:");
        var password = prompt("Nhập mật khẩu:");

        // Lấy địa chỉ URL chuyển hướng từ thuộc tính data-redirect-url của nút
        var redirectUrl = $(this).data("redirect-url");

        // Kiểm tra đăng nhập và chuyển hướng
        checkLogin(email, password, redirectUrl);
    });


    // Xử lý sự kiện click trên nút Đăng Ký
    $("#exampleModalToggle2 button[type='submit']").click(function (event) {
        event.preventDefault(); // Ngăn chặn sự kiện mặc định của nút submit

        // Lấy giá trị từ các trường input
        var hoTen = $("#exampleInputName").val();
        var emailRegister = $("#exampleInputEmail1").val();
        var soDienThoai = $("#exampleInputPhone").val();
        // Lấy giá trị của radio button được chọn
        var selectedGender = $("input[name='gender']:checked");
        var gioiTinh = selectedGender.length > 0 ? convertGioiTinhToBoolean(selectedGender.val()) : null;
        var matKhau = $("#exampleInputPassword").val();
        var nhapLaiMatKhau = $("#exampleInputPassword2").val();

        // Hàm chuyển đổi giới tính
        function convertGioiTinhToBoolean(gioiTinh) {
            switch (gioiTinh) {
                case "Nam":
                    return true;
                case "Nữ":
                    return false;
                default:
                    return null;
            }
        }
        // Kiểm tra thông tin nhập liệu
        if (hoTen && emailRegister && soDienThoai && gioiTinh && matKhau && nhapLaiMatKhau) {
            if (matKhau === nhapLaiMatKhau) {
                // Gửi yêu cầu đăng ký đến RESTful API của bạn
                $.ajax({
                    type: "POST",
                    url: "/api/register", // Đường dẫn API đăng ký của bạn
                    contentType: "application/json",
                    data: JSON.stringify({
                        tenKH: hoTen,
                        email: emailRegister,
                        SoDT: soDienThoai,
                        gioiTinh: gioiTinh,
                        matKhau: matKhau
                    }),
                    success: function (data) {
                        alert("Đăng ký thành công");
                        // Thực hiện các hành động sau khi đăng ký thành công, chẳng hạn chuyển hướng trang
                        window.location.href = "http://localhost:8085/DynamicCinema/index";
                    },
                    error: function () {
                        alert("Đã có lỗi xảy ra trong quá trình đăng ký");
                    }
                });
            } else {
                alert("Mật khẩu không khớp. Vui lòng nhập lại mật khẩu.");
            }
        } else {
            console.log("hoTen:", hoTen);
            console.log("emailRegister:", emailRegister);
            console.log("soDienThoai:", soDienThoai);
            console.log("selectedGender:", selectedGender);
            console.log("matKhau:", matKhau);
            console.log("nhapLaiMatKhau:", nhapLaiMatKhau);
            alert("Vui lòng nhập đầy đủ thông tin đăng ký");
        }
    });


});
