var app = angular.module('myApp', []);
app.controller('ThongKeController', function ($scope, $http) {
    // Khởi tạo mảng Khách hàng
    $scope.items = [];
    $scope.form = {};

    $scope.clear = {
        ten_kh: '',
        sodt: '',
        ten_phim: '',
        cac_ghe_da_mua: '',
        tong_tien: ''
    };
    $scope.index = -1;

    // Hàm để tải danh sách Khách hàng từ máy chủ
    function loadThongKe() {
        $http.get('/api/NhanVien/all')
            .then(function (response) {
                $scope.items = response.data;
                console.log("Load Success");
            });
    }

    // Tải ban đầu
    loadThongKe();

    // Hàm fill
    $scope.fillForm = function (index) {
        $scope.form = angular.copy($scope.items[index]);
        console.log("Thống kê:", $scope.form);
    }

});
