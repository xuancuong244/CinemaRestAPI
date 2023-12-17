var app = angular.module('myApp', []);
app.controller('TaiKhoanController', function ($scope, $http) {
    // Khởi tạo mảng Tài khoản
    $scope.items = [];
    $scope.form = {
    };

    $scope.clear = {
        username: '',
        matKhau: '',
        hoTen: '',
        soDT: '',
        diaChi: '',
        gioiTinh: true
    };
    $scope.index = -1;

    // Hàm để tải danh sách Tài khoản từ máy chủ
    function load() {
            $http.get('/api/taiKhoan/all')
            .then(function (response) {
                $scope.items = response.data;
                console.log("Load Success");
            });
    }

    // Tải ban đầu
    load();

    // Hàm fill
    $scope.fillForm = function (index) {
        $scope.form = angular.copy($scope.items[index]);
        console.log("Tài khoản:", $scope.form);
    }

    // Làm mới biểu mẫu
    $scope.resetForm = function () {
        // Xóa các trường của biểu mẫu
        $scope.form = angular.copy($scope.clear);
        $scope.index = -1;
    };

    // Thêm
    $scope.add = function () {
        console.log("Tài khoản:", $scope.form);
        var item = angular.copy($scope.form);

        $http.post('/api/taiKhoan/create', item).then(resp => {
            $scope.items.push(item);
            // Xóa các trường của biểu mẫu
            $scope.resetForm();
            $scope.fillForm();
            alert("Thêm Tài khoản thành công!");
        }).catch(error => {
            alert("Thêm thất bại");
        });
    };

    // Hàm để xóa Tài khoản
    $scope.delete = function (username) {
        // Gửi yêu cầu DELETE để xóa Tài khoản đã chọn
        $http.delete('/api/taiKhoan/' + username).then(resp => {
            var index = $scope.items.findIndex(item => item.username === username);
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


        // Gửi yêu cầu PUT để sửa Tài khoản đã chọn
        $http.put('/api/taiKhoan/' + $scope.form.username, $scope.form).then(
            function (resp) {
                // Cập nhật dữ liệu trong mảng $scope.items
                var index = $scope.items.findIndex(item => item.username == $scope.form.username);
                $scope.items[index] = resp.data;
                $scope.resetForm();
                $scope.fillForm();
                console.log("Success", resp);
            }).catch(function (error) {
            // Xử lý lỗi hoặc xuất thông báo cảnh báo
            console.log("Error", error);
        });
    };

    



});
