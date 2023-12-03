var app = angular.module('myApp', []);

app.controller('NgayChieuController', function ($scope, $http) {
    // Khởi tạo mảng phim
    $scope.ngayChieu = [];

    $scope.ngayChieuTemplate = {
        stt: '',
        ngay: '',
        gioBatDau: ''
    };
    $scope.index = -1;
    // Hàm để tải danh sách phim từ máy chủ
    function loadNgayChieu() {
        $http.get('/api/NgayChieu/all')
            .then(function (response) {
                $scope.cus = response.data;
            });
    }

    // Tải ban đầu
    loadNgayChieu();

    // Hàm để làm mới biểu mẫu
    $scope.resetForm = function () {
        // Xóa các trường của biểu mẫu
        $scope.newNC = angular.copy($scope.ngayChieuTemplate);
        $scope.index = -1;
    };

    $scope.resetForm();

    // Hàm để thêm phim mới
    $scope.addNgayChieu = function () {
        console.log("Thêm Ngày Chiếu:", $scope.newNC);
        // Gửi yêu cầu POST để thêm phim mới
        $http.post('/api/NgayChieu', $scope.newNC)
            .then(function (response) {
                // Làm mới danh sách phim
                loadNgayChieu();
                // Xóa các trường của biểu mẫu
                $scope.resetForm();
            });
    };

    // Hàm để sửa phim
    $scope.editNgayChieu = function () {
        // Gửi yêu cầu PUT để sửa phim đã chọn
        if (!$scope.selectedNC) {
            alert('Chưa chọn ngày chiếu để sửa !');
            return;
        }
        $http.put('/api/NgayChieu/' + $scope.selectedNC.stt, $scope.selectedNC)
            .then(function (response) {
                // Làm mới danh sách phim
                loadNgayChieu();
                // Xóa các trường của biểu mẫu
                $scope.resetForm();
            });
    };

    // Hàm để xóa phim
    $scope.deleteNgayChieu = function () {
        // Gửi yêu cầu DELETE để xóa phim đã chọn
        $http.delete('/api/NgayChieu/' + $scope.selectedNC.stt)
            .then(function (response) {
                // Làm mới danh sách phim
                loadNgayChieu();
                // Xóa các trường của biểu mẫu
                $scope.resetForm();
            });
    };

    $scope.fillForm = function (index){
        $scope.selectedNC= angular.copy($scope.ngayChieu[index]);
    }
});
