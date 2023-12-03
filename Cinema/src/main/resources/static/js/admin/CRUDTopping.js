var app = angular.module('myApp', []);

app.controller('ToppingController', function ($scope, $http) {
    // Khởi tạo mảng phim
    $scope.toppings = [];

    $scope.tpTemplate = {
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
                $scope.toppings = response.data;
            });
    }

    // Tải ban đầu
    loadToppings();

    // Hàm để làm mới biểu mẫu
    $scope.resetForm = function () {
        // Xóa các trường của biểu mẫu
        $scope.newTP = angular.copy($scope.tpTemplate);
        $scope.index = -1;
    };

    $scope.resetForm();

    // Hàm để thêm phim mới
    $scope.addTopping = function () {
        console.log("Thêm Topping:", $scope.newTP);
        // Gửi yêu cầu POST để thêm phim mới
        $http.post('/api/OrderTopping', $scope.newTP)
            .then(function (response) {
                // Làm mới danh sách phim
                loadToppings();
                // Xóa các trường của biểu mẫu
                $scope.resetForm();
            });
    };

    // Hàm để sửa phim
    $scope.editTopping = function () {
        // Gửi yêu cầu PUT để sửa phim đã chọn
        if (!$scope.selectedTP) {
            alert('Chưa chọn topping để sửa !');
            return;
        }
        $http.put('/api/OrderTopping/' + $scope.selectedTP.maTopping, $scope.selectedTP)
            .then(function (response) {
                // Làm mới danh sách phim
                loadToppings();
                // Xóa các trường của biểu mẫu
                $scope.resetForm();
            });
    };

    // Hàm để xóa phim
    $scope.deleteTopping = function () {
        // Gửi yêu cầu DELETE để xóa phim đã chọn
        $http.delete('/api/OrderTopping/' + $scope.selectedTP.maTopping)
            .then(function (response) {
                // Làm mới danh sách phim
                loadToppings();
                // Xóa các trường của biểu mẫu
                $scope.resetForm();
            });
    };

    $scope.fillForm = function (index){
        $scope.selectedTP= angular.copy($scope.toppings[index]);
    }
});
