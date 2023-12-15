// var app = angular.module('myApp', []);
// app.controller('ThongKeController', function ($scope, $http) {
//     // Khởi tạo mảng Khách hàng
//     $scope.items = [];
//     $scope.form = {};
//
//     $scope.clear = {
//         maNV: '',
//         hoTen: '',
//         email: '',
//         ngaySinh: '',
//         matKhau: '',
//         soDT: '',
//         chucVu: '',
//         gioiTinh: true
//     };
//     $scope.index = -1;
//
//     // Hàm để tải danh sách Khách hàng từ máy chủ
//     function loadEmployee() {
//         $http.get('/api/NhanVien/all')
//             .then(function (response) {
//                 $scope.items = response.data;
//                 console.log("Load Success");
//             });
//     }
//
//     // Tải ban đầu
//     loadEmployee();
//
//     // Hàm fill
//     $scope.fillForm = function (index) {
//         $scope.form = angular.copy($scope.items[index]);
//         console.log("Thống kê:", $scope.form);
//     }
//
// });
