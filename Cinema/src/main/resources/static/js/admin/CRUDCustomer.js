function loadCustomer() {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "http://localhost:8085/api/KhachHang/all", true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var customer = JSON.parse(xhr.responseText);
            updateTable(customer);
        }
    };
    xhr.send();
}

function convertGender(value) {
    return value ? "Nam" : "Nữ";
}

function updateTable(customers) {
    var tableBody = document.getElementById("customerTable").getElementsByTagName('tbody')[0];

    // Clear existing rows
    tableBody.innerHTML = "";

    // Iterate through the movies and add rows to the table
    for (var i = 0; i < customers.length; i++) {
        var customer = customers[i];
        var row = tableBody.insertRow(i);

        var cell1 = row.insertCell(0);
        cell1.textContent = customer.maKH;

        var cell2 = row.insertCell(1);
        cell2.textContent = customer.tenKH;

        var cell3 = row.insertCell(2);
        cell3.textContent = customer.matKhau;

        // var cell4 = row.insertCell(3);
        // cell4.textContent = movie.daoDien;

        var cell5 = row.insertCell(3);
        cell5.textContent = customer.email;

        var cell6 = row.insertCell(4);
        cell6.textContent = customer.soDT;

        var cell7 = row.insertCell(5);
        cell7.textContent = customer.diaChi;

        // var cell8 = row.insertCell(6);
        // cell8.textContent = movie.moTa;

        var cell9 = row.insertCell(6);
        cell9.textContent = convertGender(customer.gioiTinh);

        var cell10 = row.insertCell(7);
        cell10.textContent = customer.idFB;

        var cell10 = row.insertCell(8);
        cell10.textContent = customer.hinhFB;
    }
}

// Call the loadMovies function when the page is loaded
window.onload = function () {
    loadCustomer();
};

