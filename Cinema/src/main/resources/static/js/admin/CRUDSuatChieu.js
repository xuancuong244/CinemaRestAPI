var app = angular.module('myApp', []);

app.controller('SuatChieuController', function ($scope, $http) {
    // Khởi tạo mảng phim
    $scope.movies = [];

    $scope.movieTemplate = {
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
                $scope.movies = response.data;
            });
    }

    // Tải ban đầu
    loadSuatChieu();

    // Hàm để làm mới biểu mẫu
    $scope.resetForm = function () {
        // Xóa các trường của biểu mẫu
        $scope.newMovie = angular.copy($scope.movieTemplate);
    };

    $scope.resetForm();

    // Hàm để thêm phim mới
    $scope.addMovie = function () {
        console.log("Đã thêm suất chiếu:", $scope.newMovie);
        // Gửi yêu cầu POST để thêm phim mới
        $http.post('/api/XuatChieu', $scope.newMovie)
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
        if (!$scope.selectedMovie) {
            alert('Chưa chọn suất chiếu để sửa !');
            return;
        }
        $http.put('/api/XuatChieu/' + $scope.selectedMovie.stt, $scope.selectedMovie)
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
        $http.delete('/api/XuatChieu/' + $scope.selectedMovie.stt)
            .then(function (response) {
                // Làm mới danh sách phim
                loadMovies();
                // Xóa các trường của biểu mẫu
                $scope.resetForm();
            });
    };

    $scope.fillForm = function (index){
        $scope.selectedMovie = angular.copy($scope.movies[index]);
    }
});