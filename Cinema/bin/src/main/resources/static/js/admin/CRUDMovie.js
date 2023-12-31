// // Function to make an API request and update the table
// function loadMovies() {
//     var xhr = new XMLHttpRequest();
//     xhr.open("GET", "http://localhost:8085/api/Phim/all", true);
//     xhr.onreadystatechange = function () {
//         if (xhr.readyState == 4 && xhr.status == 200) {
//             var movies = JSON.parse(xhr.responseText);
//             updateTable(movies);
//         }
//     };
//     xhr.send();
// }
//
// // Function to update the table with movie data
// function updateTable(movies) {
//     var tableBody = document.getElementById("movieTable").getElementsByTagName('tbody')[0];
//
//     // Clear existing rows
//     tableBody.innerHTML = "";
//
//     // Iterate through the movies and add rows to the table
//     for (var i = 0; i < movies.length; i++) {
//         var movie = movies[i];
//         var row = tableBody.insertRow(i);
//
//         var cell1 = row.insertCell(0);
//         cell1.textContent = movie.maPhim;
//
//         var cell2 = row.insertCell(1);
//         cell2.textContent = movie.tenPhim;
//
//         var cell3 = row.insertCell(2);
//         cell3.textContent = movie.daoDien;
//
//         // var cell4 = row.insertCell(3);
//         // cell4.textContent = movie.daoDien;
//
//         var cell5 = row.insertCell(3);
//         cell5.textContent = movie.namSX;
//
//         var cell6 = row.insertCell(4);
//         cell6.textContent = movie.quocGia;
//
//         var cell7 = row.insertCell(5);
//         cell7.textContent = movie.thoiLuong;
//
//         // var cell8 = row.insertCell(6);
//         // cell8.textContent = movie.moTa;
//
//         var cell9 = row.insertCell(6);
//         cell9.textContent = movie.hinh;
//
//         var cell10 = row.insertCell(7);
//         cell10.textContent = movie.trailer;
//
//     }
// }
//
// // Call the loadMovies function when the page is loaded
// window.onload = function () {
//     loadMovies();
// };
//
// function resetForm() {
//     // Clear input fields
//     var inputs = document.getElementsByClassName("input");
//     for (var i = 0; i < inputs.length; i++) {
//         inputs[i].value = "";
//     }
// }
//
// // Function to add a new movie
// function addMovie() {
//     // Get input values
//     var maPhim = document.getElementsByName("input")[0].value;
//     var tenPhim = document.getElementsByName("input")[1].value;
//     // var dienVien = document.getElementsByName("input")[2].value;
//     var namSX = document.getElementsByName("input")[2].value;
//     var daoDien = document.getElementsByName("input")[3].value;
//     var quocGia = document.getElementsByName("input")[4].value;
//     var thoiLuong = document.getElementsByName("input")[5].value;
//     // var moTa = document.getElementsByName("input")[7].value;
//     var hinh = document.getElementsByName("input")[6].value;
//     var trailer = document.getElementsByName("input")[7].value;
//
//     // Create a new row and add it to the table
//     var table = document.getElementById("movieTable").getElementsByTagName('tbody')[0];
//     var row = table.insertRow(table.rows.length);
//
//     // Populate the new row with input values
//     var cell1 = row.insertCell(0);
//     cell1.textContent = maPhim;
//
//     var cell2 = row.insertCell(1);
//     cell2.textContent = tenPhim;
//
//     // var cell3 = row.insertCell(2);
//     // cell3.textContent = dienVien;
//
//     var cell4 = row.insertCell(2);
//     cell4.textContent = daoDien;
//
//     var cell5 = row.insertCell(3);
//     cell5.textContent = namSX;
//
//     var cell6 = row.insertCell(4);
//     cell6.textContent = quocGia;
//
//     var cell7 = row.insertCell(5);
//     cell7.textContent = thoiLuong;
//
//     // var cell8 = row.insertCell(7);
//     // cell8.textContent = moTa;
//
//     var cell9 = row.insertCell(6);
//     cell9.textContent = hinh;
//
//     var cell10 = row.insertCell(7);
//     cell10.textContent = trailer;
//     // Clear input fields
//     resetForm();
// }
//
// // Function to edit an existing movie
// function editMovie() {
//     // Get the selected row
//     var table = document.getElementById("movieTable");
//     var selectedRow = table.getElementsByClassName("selected")[0];
//
//     if (selectedRow) {
//         // Update the cells in the selected row with new input values
//         selectedRow.cells[0].textContent = document.getElementsByName("input")[0].value;
//         selectedRow.cells[1].textContent = document.getElementsByName("input")[1].value;
//         selectedRow.cells[2].textContent = document.getElementsByName("input")[2].value;
//         selectedRow.cells[3].textContent = document.getElementsByName("input")[3].value;
//         selectedRow.cells[4].textContent = document.getElementsByName("input")[4].value;
//         selectedRow.cells[5].textContent = document.getElementsByName("input")[5].value;
//         selectedRow.cells[6].textContent = document.getElementsByName("input")[6].value;
//         selectedRow.cells[7].textContent = document.getElementsByName("input")[7].value;
//         // selectedRow.cells[8].textContent = document.getElementsByName("input")[8].value;
//         // selectedRow.cells[9].textContent = document.getElementsByName("input")[9].value;
//         // Clear input fields
//         resetForm();
//     }
// }
//
// // Function to delete a movie
// function deleteMovie() {
//     // Get the selected row
//     var table = document.getElementById("movieTable");
//     var selectedRow = table.getElementsByClassName("selected")[0];
//
//     if (selectedRow) {
//         // Remove the selected row
//         table.deleteRow(selectedRow.rowIndex);
//
//         // Clear input fields
//         resetForm();
//     }
// }
//
//

var app = angular.module('myApp', []);

app.controller('PhimController', function ($scope, $http) {
    // Khởi tạo mảng phim
    $scope.movies = [];

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
                $scope.movies = response.data;
            });
    }

    // Tải ban đầu
    loadMovies();

    // Hàm để làm mới biểu mẫu
    $scope.resetForm = function () {
        // Xóa các trường của biểu mẫu
        $scope.newMovie = angular.copy($scope.movieTemplate);
        $scope.index = -1;
    };

    $scope.resetForm();

    // Hàm để thêm phim mới
    $scope.addMovie = function () {
        console.log("New Movie Data:", $scope.newMovie);
        // Gửi yêu cầu POST để thêm phim mới
        $http.post('/api/Phim', $scope.newMovie)
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
            alert('Chưa chọn phim để sửa !');
            return;
        }
        $http.put('/api/Phim/' + $scope.selectedMovie.maPhim, $scope.selectedMovie)
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
        $http.delete('/api/Phim/' + $scope.selectedMovie.maPhim)
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
