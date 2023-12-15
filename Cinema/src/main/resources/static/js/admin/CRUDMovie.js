var app = angular.module('myApp', []);
app.controller('PhimController', function ($scope, $http) {
    // Khởi tạo mảng phim
    $scope.items = [];
    $scope.form = {};

    $scope.movieTemplate = {
        maPhim: '',
        tenPhim: '',
        dienVien: '',
        namSX: '',
        daoDien: '',
        quocGia: '',
        thoiLuong: '',
        moTa: '',
        hinh: '',
        trailer: ''
    };
    $scope.index = -1;

    // Hàm để tải danh sách phim từ máy chủ
    function loadMovies() {
        $http.get('/api/Phim/all')
            .then(function (response) {
                $scope.items = response.data;
            });
    }

    // Tải ban đầu
    loadMovies();

    // Hàm để làm mới biểu mẫu
    $scope.resetForm = function () {
        // Xóa các trường của biểu mẫu
        $scope.form = angular.copy($scope.movieTemplate);
        $scope.index = -1;
        loadMovies();
    };

    // Hàm fill
    $scope.fillForm = function (index) {
        $scope.form = angular.copy($scope.items[index]);
        console.log("Phim:", $scope.form);
    }

    // Hàm để thêm Phim mới
    $scope.add = function () {
        // Kiểm tra các điều kiện hợp lệ
        console.log("Phim:", $scope.form);
        var item = angular.copy($scope.form);

        $http.post('/api/Phim/create', item).then(resp => {
            $scope.items.push(item);
            // Xóa các trường của biểu mẫu
            $scope.resetForm();
            $scope.fillForm();
            alert("Thêm thành công!");
        }).catch(error => {
            alert("Thêm thất bại");
        });
    };

    // Hàm để xóa Phim
    $scope.delete = function (maPhim) {
        // Gửi yêu cầu DELETE để xóa khách hàng đã chọn
        $http.delete('/api/Phim/' + maPhim).then(resp => {
            var index = $scope.items.findIndex(item => item.maPhim === maPhim);
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
        $http.put('/api/Phim/' + $scope.form.maPhim, $scope.form).then(
            function (resp) {
                // Cập nhật dữ liệu trong mảng $scope.items
                var index = $scope.items.findIndex(item => item.maPhim == $scope.form.maPhim);
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
