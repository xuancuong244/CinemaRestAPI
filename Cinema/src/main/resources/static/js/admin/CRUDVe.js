var app = angular.module('myApp', []);

app.controller('VeController', function ($scope, $http) {
    // Khởi tạo mảng phim
    $scope.ve = [];

    $scope.veTemplate = {
        idVe: '',
        tongGiaVe: '',
        thueVAT: ''
    };
    $scope.index = -1;
    // Hàm để tải danh sách phim từ máy chủ
    function loadVe() {
        $http.get('/api/Ve/all')
            .then(function (response) {
                $scope.ve = response.data;
            });
    }
    // Tải ban đầu
    loadVe();

    // Hàm để làm mới biểu mẫu
    $scope.resetForm = function () {
        // Xóa các trường của biểu mẫu
        $scope.newVe = angular.copy($scope.veTemplate);
        $scope.index = -1;
    };

    $scope.resetForm();

    // Hàm để thêm phim mới
    $scope.addVe = function () {
        console.log("Thêm Vé:", $scope.newVe);
        // Gửi yêu cầu POST để thêm phim mới
        $http.post('/api/Ve', $scope.newVe)
            .then(function (response) {
                // Làm mới danh sách phim
                loadVe();
                // Xóa các trường của biểu mẫu
                $scope.resetForm();
            });
    };

    // Hàm để sửa phim
    $scope.editVe = function () {
        // Gửi yêu cầu PUT để sửa phim đã chọn
        if (!$scope.selectedVe) {
            alert('Chưa chọn vé để sửa !');
            return;
        }
        $http.put('/api/Ve/' + $scope.selectedVe.idVe, $scope.selectedVe)
            .then(function (response) {
                // Làm mới danh sách phim
                loadVe();
                // Xóa các trường của biểu mẫu
                $scope.resetForm();
            });
    };

    // Hàm để xóa phim
    $scope.deleteVe = function () {
        // Gửi yêu cầu DELETE để xóa phim đã chọn
        $http.delete('/api/Ve/' + $scope.selectedVe.idVe)
            .then(function (response) {
                // Làm mới danh sách phim
                loadVe();
                // Xóa các trường của biểu mẫu
                $scope.resetForm();
            });
    };

    $scope.fillForm = function (index){
        $scope.selectedVe= angular.copy($scope.ve[index]);
    }
});
