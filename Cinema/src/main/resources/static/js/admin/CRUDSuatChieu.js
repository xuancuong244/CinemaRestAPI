var app = angular.module('myApp', []);

app.controller('SuatChieuController', function ($scope, $http) {
    // Khởi tạo mảng phim
    $scope.items = [];
    $scope.form = {};

    $scope.suatChieuTemplate = {
        stt: '',
        phim: '',
        phongChieu: '',
        ngayChieu: '',
        giaXuatChieu: '',
    };
    $scope.index = -1;

    // Hàm để tải danh sách phim từ máy chủ
    function loadSuatChieu() {
        $http.get('/api/XuatChieu/all')
            .then(function (response) {
                $scope.items = response.data;
            });
    }

    // Tải ban đầu
    loadSuatChieu();

    // Hàm fill
    $scope.fillForm = function (index) {
        $scope.form = angular.copy($scope.items[index]);
        console.log("Suất Chiếu:", $scope.form);
    }

    // Hàm để thêm phim mới
    $scope.addTopping = function () {
        console.log("Suất Chiếu:", $scope.form);
        var item = angular.copy($scope.form);

        $http.post('/api/XuatChieu/create', item).then(resp => {
            $scope.items.push(item);
            // Xóa các trường của biểu mẫu
            $scope.resetForm();
            $scope.fillForm();
            alert("Thêm thành công!");
        }).catch(error => {
            alert("Thêm thất bại");
        });
    };

    $scope.delete = function (stt) {
        // Gửi yêu cầu DELETE để xóa khách hàng đã chọn
        $http.delete('/api/XuatChieu/' + stt).then(resp => {
            var index = $scope.items.findIndex(item => item.stt === stt);
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
        $http.put('/api/XuatChieu/' + $scope.form.stt, $scope.form).then(
            function (resp) {
                // Cập nhật dữ liệu trong mảng $scope.items
                var index = $scope.items.findIndex(item => item.stt == $scope.form.stt);
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