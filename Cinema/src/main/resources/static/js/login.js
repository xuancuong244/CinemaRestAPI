let host = "http://localhost:8085/api/taiKhoan"
const app = angular.module("app", []);
app.controller("ctrl", function($scope, $http) {
    $scope.form = {}
    $scope.products = []

    $scope.findAll = function() {
        var url = `${host}/all`;
        $http.get(url).then(resp => {
            $scope.products = resp.data;
            console.log("Success", resp)
        }).catch(error => {
            console.log("Error", error)
        });
    }
    $scope.findAll();
})