var app = angular.module('myApp', []);
app.controller('KhachHangController', function ($scope, $http) {
    // Khởi tạo mảng Khách hàng
    $scope.items = [];
    $scope.form = {};

    $scope.clear = {
        maKH: '',
        tenKH: '',
        matKhau: '',
        email: '',
        soDT: '',
        diaChi: '',
        gioiTinh: true
    };
    $scope.index = -1;

    // Hàm để tải danh sách Khách hàng từ máy chủ
    function loadCustomer() {
        $http.get('/api/KhachHang/all')
            .then(function (response) {
                $scope.items = response.data;
                console.log("Load Success");
            });
    }

    // Tải ban đầu
    loadCustomer();

    // Hàm fill
    $scope.fillForm = function (index) {
        $scope.form = angular.copy($scope.items[index]);
        console.log("Khách hàng:", $scope.form);
    }

    // Hàm để làm mới biểu mẫu
    $scope.resetForm = function () {
        // Xóa các trường của biểu mẫu
        $scope.form = angular.copy($scope.clear);
        $scope.index = -1;
    };

    // Hàm để thêm Khách hàng mới
    $scope.add = function () {
        console.log("Khách hàng:", $scope.form);
        var item = angular.copy($scope.form);

        $http.post('/api/KhachHang/create', item).then(resp => {
            $scope.items.push(item);
            // Xóa các trường của biểu mẫu
            $scope.resetForm();
            $scope.fillForm();
            alert("Thêm khách hàng thành công!");
        }).catch(error => {
            alert("Thêm thất bại");
        });
    };

    // Hàm để xóa khách hàng
    $scope.delete = function (maKH) {
        // Gửi yêu cầu DELETE để xóa khách hàng đã chọn
        $http.delete('/api/KhachHang/' + maKH).then(resp => {
            var index = $scope.items.findIndex(item => item.maKH === maKH);
            $scope.items.splice(index, 1);
            $scope.resetForm();
            $scope.fillForm();
            alert("Xóa thành công!");
        }).catch(error => {
            alert("Xóa thất bại!");
        });
    };

    // Hàm cập nhật
    $scope.edit = function () {
        // Kiểm tra các điều kiện hợp lệ


        // Gửi yêu cầu PUT để sửa Khách hàng đã chọn
        $http.put('/api/KhachHang/' + $scope.form.maKH, $scope.form).then(
            function (resp) {
                // Cập nhật dữ liệu trong mảng $scope.items
                var index = $scope.items.findIndex(item => item.maKH == $scope.form.maKH);
                $scope.items[index] = resp.data;
                $scope.resetForm();
                $scope.fillForm();
                console.log("Success", resp);
            }).catch(function (error) {
            // Xử lý lỗi hoặc xuất thông báo cảnh báo
            console.log("Error", error);
        });
    };

    // Validate
    // Hàm kiểm tra maKH là số
    function isValidMaKH(maKH) {
        return /^\d+$/.test(maKH);
    }

    // Hàm kiểm tra mật khẩu tối đa 10 ký tự số
    function isValidPassword(password) {
        return /^\d{1,10}$/.test(password);
    }

    // Hàm kiểm tra số điện thoại là 10 số
    function isValidPhoneNumber(phoneNumber) {
        return /^\d{10}$/.test(phoneNumber);
    }

    // Hàm kiểm tra email hợp lệ
    function isValidEmail(email) {
        // Bạn có thể sử dụng một biểu thức chính quy phức tạp hơn để kiểm tra định dạng email
        // Dưới đây là một biểu thức đơn giản, nếu cần bạn có thể sử dụng biểu thức chính quy phức tạp hơn
        return /\S+@\S+\.\S+/.test(email);
    }
});
