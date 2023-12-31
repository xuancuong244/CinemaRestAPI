var app = angular.module('myApp', []);

app.controller('VeController', function ($scope, $http) {
    // Khởi tạo mảng phim
    $scope.items = [];
    $scope.form = {};
    $scope.clear = {
        idVe: '',
        tongGiaVe: '',
        thueVAT: '',
        khachHang: '',
        chiTietGhe: '',
        xuatChieu: ''
    };
    $scope.index = -1;
    function loadVe() {
        $http.get('/api/Ve/all')
            .then(function (response) {
                $scope.ve = response.data;
            });
    }

    // Tải ban đầu
    loadVe();

    // Hàm fill
    $scope.fillForm = function (index) {
        $scope.form = angular.copy($scope.items[index]);
        console.log("Vé:", $scope.form);
    }

    // Hàm để làm mới biểu mẫu
    $scope.resetForm = function () {
        // Xóa các trường của biểu mẫu
        $scope.form = angular.copy($scope.clear);
        $scope.index = -1;
    };

    // Hàm để thêm Khách hàng mới
    $scope.add = function () {
        console.log("Vé:", $scope.form);
        var item = angular.copy($scope.form);

        $http.post('/api/Ve/create', item).then(resp => {
            $scope.items.push(item);
            // Xóa các trường của biểu mẫu
            $scope.resetForm();
            $scope.fillForm();
            alert("Thêm thành công!");
        }).catch(error => {
            alert("Thêm thất bại");
        });
    };

    // Hàm để xóa khách hàng
    $scope.delete = function (idVe) {
        // Gửi yêu cầu DELETE để xóa khách hàng đã chọn
        $http.delete('/api/Ve/' + idVe).then(resp => {
            var index = $scope.items.findIndex(item => item.idVe === idVe);
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
        $http.put('/api/Ve/' + $scope.form.idVe, $scope.form).then(
            function (resp) {
                // Cập nhật dữ liệu trong mảng $scope.items
                var index = $scope.items.findIndex(item => item.idVe == $scope.form.idVe);
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
