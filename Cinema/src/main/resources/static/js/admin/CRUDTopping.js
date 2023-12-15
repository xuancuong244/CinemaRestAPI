var app = angular.module('myApp', []);

app.controller('ToppingController', function ($scope, $http) {
    // Khởi tạo mảng phim
    $scope.items = [];
    $scope.form = {};

    $scope.clear = {
        maTopping: '',
        tenTopping: '',
        soLuongDangCo: '',
        gia: '',
        hinh: '',

    };
    $scope.index = -1;
    // Hàm để tải danh sách phim từ máy chủ
    function loadToppings() {
        $http.get('/api/OrderTopping/all')
            .then(function (response) {
                $scope.items = response.data;
            });
    }

    // Tải ban đầu
    loadToppings();

    // Hàm để làm mới biểu mẫu
    $scope.resetForm = function () {
        // Xóa các trường của biểu mẫu
        $scope.form = angular.copy($scope.clear);
        $scope.index = -1;
        loadToppings();
    };

    $scope.resetForm();

    // Hàm fill
    $scope.fillForm = function (index) {
        $scope.form = angular.copy($scope.items[index]);
        console.log("Topping:", $scope.form);
    }

    // Hàm để thêm phim mới
    $scope.addTopping = function () {
        console.log("Topping:", $scope.form);
        var item = angular.copy($scope.form);

        $http.post('/api/OrderTopping/create', item).then(resp => {
            $scope.items.push(item);
            // Xóa các trường của biểu mẫu
            $scope.resetForm();
            $scope.fillForm();
            alert("Thêm thành công!");
        }).catch(error => {
            alert("Thêm thất bại");
        });
    };

    $scope.delete = function (maTopping) {
        // Gửi yêu cầu DELETE để xóa khách hàng đã chọn
        $http.delete('/api/OrderTopping/' + maTopping).then(resp => {
            var index = $scope.items.findIndex(item => item.maTopping === maTopping);
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
        $http.put('/api/OrderTopping/' + $scope.form.maTopping, $scope.form).then(
            function (resp) {
                // Cập nhật dữ liệu trong mảng $scope.items
                var index = $scope.items.findIndex(item => item.maTopping == $scope.form.maTopping);
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
