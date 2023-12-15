var app = angular.module('myApp', []);

app.controller('NgayChieuController', function ($scope, $http) {
    // Khởi tạo mảng phim
    $scope.items = [];
    $scope.form = {};
    $scope.form.ngay = new Date();
    $scope.updateDateTime = function() {
        // Handle changes to the selectedDateTime if needed
    };
    $scope.clear = {
        stt: '',
        phim: '',
        ngay: '',
        gioBatDau: ''
    };
    $scope.index = -1;
    // Hàm để tải danh sách phim từ máy chủ
    function loadNgayChieu() {
        $http.get('/api/NgayChieu/all')
            .then(function (response) {
                $scope.items = response.data;
            });
    }

    // Tải ban đầu
    loadNgayChieu();

    // Hàm fill
    $scope.fillForm = function (index) {
        $scope.form = angular.copy($scope.items[index]);
        console.log("Ngày chiếu:", $scope.form);
    }

    // Hàm để làm mới biểu mẫu
    $scope.resetForm = function () {
        // Xóa các trường của biểu mẫu
        $scope.form = angular.copy($scope.clear);
        $scope.index = -1;
    };

    // Hàm để thêm Khách hàng mới
    $scope.add = function () {
        console.log("Ngày chiếu:", $scope.form);
        var item = angular.copy($scope.form);

        $http.post('/api/NgayChieu/create', item).then(resp => {
            $scope.items.push(item);
            // Xóa các trường của biểu mẫu
            $scope.resetForm();
            $scope.fillForm();
            alert("Thêm Ngày chiếu thành công!");
        }).catch(error => {
            alert("Thêm thất bại");
        });
    };

    // Hàm cập nhật
    $scope.edit = function () {
        // Kiểm tra các điều kiện hợp lệ


        // Gửi yêu cầu PUT để sửa Khách hàng đã chọn
        $http.put('/api/NgayChieu/' + $scope.form.stt, $scope.form).then(
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

    // Hàm để xóa NC
    $scope.delete = function (stt) {
        // Gửi yêu cầu DELETE để xóa khách hàng đã chọn
        $http.delete('/api/NgayChieu/' + stt).then(resp => {
            var index = $scope.items.findIndex(item => item.stt === stt);
            $scope.items.splice(index, 1);
            $scope.resetForm();
            $scope.fillForm();
            alert("Xóa thành công!");
        }).catch(error => {
            alert("Xóa thất bại!");
        });
    };
});
