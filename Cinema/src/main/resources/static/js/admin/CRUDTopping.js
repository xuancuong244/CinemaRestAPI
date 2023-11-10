// Function to make an API request and update the table
function loadMovies() {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "http://localhost:8085/api/OrderTopping/all", true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var toppings = JSON.parse(xhr.responseText);
            updateTable(toppings);
        }
    };
    xhr.send();
}

// Function to update the table with movie data
function updateTable(toppings) {
    var tableBody = document.getElementById("toppingTable").getElementsByTagName('tbody')[0];

    // Clear existing rows
    tableBody.innerHTML = "";

    // Iterate through the movies and add rows to the table
    for (var i = 0; i < toppings.length; i++) {
        var topping = toppings[i];
        var row = tableBody.insertRow(i);

        var cell1 = row.insertCell(0);
        cell1.textContent = topping.maTopping;

        var cell2 = row.insertCell(1);
        cell2.textContent = topping.tenTopping;

        var cell3 = row.insertCell(2);
        cell3.textContent = topping.soLuongDangCo;

        var cell4 = row.insertCell(3);
        cell4.textContent = topping.gia;

        var cell5 = row.insertCell(4);
        cell5.textContent = topping.hinh;
    }
}

// Call the loadMovies function when the page is loaded
window.onload = function () {
    loadMovies();
};
