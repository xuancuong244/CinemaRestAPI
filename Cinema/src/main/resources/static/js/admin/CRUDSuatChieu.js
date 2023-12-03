var app = angular.module('myApp', []);

app.controller('SuatChieuController', function ($scope, $http) {
    // Khởi tạo mảng phim
    $scope.suatChieu = [];

    $scope.suatChieuTemplate = {
        stt: '',
        phim: '',
        phongChieu: '',
        ngayChieu: '',
        giaXuatChieu: '',
    };

    // Hàm để tải danh sách phim từ máy chủ
    function loadSuatChieu() {
        $http.get('/api/XuatChieu/all')
            .then(function (response) {
                $scope.suatChieu = response.data;
            });
    }

    // Tải ban đầu
    loadSuatChieu();

    // Hàm để làm mới biểu mẫu
    $scope.resetForm = function () {
        // Xóa các trường của biểu mẫu
        $scope.newSuatChieu = angular.copy($scope.suatChieuTemplate);
    };

    $scope.resetForm();

    // Hàm để thêm phim mới
    $scope.addMovie = function () {
        console.log("Đã thêm suất chiếu:", $scope.newSuatChieu);
        // Gửi yêu cầu POST để thêm phim mới
        $http.post('/api/XuatChieu', $scope.newSuatChieu)
            .then(function (response) {
                // Làm mới danh sách phim
                loadMovies();
                // Xóa các trường của biểu mẫu
                $scope.resetForm();
            });
    };

    // Hàm để sửa phim
    $scope.editMovie = function () {
        // Gửi yêu cầu PUT để sửa phim đã chọn
        if (!$scope.selectedSuatChieu) {
            alert('Chưa chọn suất chiếu để sửa !');
            return;
        }
        $http.put('/api/XuatChieu/' + $scope.selectedSuatChieu.stt, $scope.selectedSuatChieu)
            .then(function (response) {
                // Làm mới danh sách phim
                loadMovies();
                // Xóa các trường của biểu mẫu
                $scope.resetForm();
            });
    };

    // Hàm để xóa phim
    $scope.deleteMovie = function () {
        // Gửi yêu cầu DELETE để xóa phim đã chọn
        $http.delete('/api/XuatChieu/' + $scope.selectedSuatChieu.stt)
            .then(function (response) {
                // Làm mới danh sách phim
                loadMovies();
                // Xóa các trường của biểu mẫu
                $scope.resetForm();
            });
    };

    $scope.fillForm = function (index){
        $scope.selectedSuatChieu = angular.copy($scope.suatChieu[index]);
    }
});