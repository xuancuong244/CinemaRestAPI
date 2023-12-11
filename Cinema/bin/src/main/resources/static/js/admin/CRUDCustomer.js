var app = angular.module('myApp', []);

app.controller('KhachHangController', function ($scope, $http) {
    // Khởi tạo mảng phim
    $scope.cus = [];

    $scope.cusTemplate = {
        maKH: '',
        tenKH: '',
        matKhau: '',
        email: '',
        soDT: '',
        diaChi: '',
        gioiTinh: ''
    };
    $scope.index = -1;
    // Hàm để tải danh sách phim từ máy chủ
    function loadCustomer() {
        $http.get('/api/KhachHang/all')
            .then(function (response) {
                $scope.cus = response.data;
            });
    }
    function convertGender(value) {
        return value ? "Nam" : "Nữ";
    }
    // Tải ban đầu
    loadCustomer();

    // Hàm để làm mới biểu mẫu
    $scope.resetForm = function () {
        // Xóa các trường của biểu mẫu
        $scope.newCus = angular.copy($scope.cusTemplate);
        $scope.index = -1;
    };

    $scope.resetForm();

    // Hàm để thêm phim mới
    $scope.addCustomer = function () {
        console.log("Thêm Khách hàng:", $scope.newCus);
        // Gửi yêu cầu POST để thêm phim mới
        $http.post('/api/KhachHang', $scope.newCus)
            .then(function (response) {
                // Làm mới danh sách phim
                loadMovies();
                // Xóa các trường của biểu mẫu
                $scope.resetForm();
            });
    };

    // Hàm để sửa phim
    $scope.editCustomer = function () {
        // Gửi yêu cầu PUT để sửa phim đã chọn
        if (!$scope.selectedCus) {
            alert('Chưa chọn khách hàng để sửa !');
            return;
        }
        $http.put('/api/KhachHang/' + $scope.selectedCus.maKH, $scope.selectedCus)
            .then(function (response) {
                // Làm mới danh sách phim
                loadCustomer();
                // Xóa các trường của biểu mẫu
                $scope.resetForm();
            });
    };

    // Hàm để xóa phim
    $scope.deleteCustomer = function () {
        // Gửi yêu cầu DELETE để xóa phim đã chọn
        $http.delete('/api/KhachHang/' + $scope.selectedCus.maKH)
            .then(function (response) {
                // Làm mới danh sách phim
                loadCustomer();
                // Xóa các trường của biểu mẫu
                $scope.resetForm();
            });
    };

    $scope.fillForm = function (index){
        $scope.selectedCus= angular.copy($scope.cus[index]);
    }
});
