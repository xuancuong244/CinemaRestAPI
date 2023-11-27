document.addEventListener("DOMContentLoaded", function () {
    // Make a request to the API
    fetch('http://localhost:8085/api/KhachHang/all')
        .then(response => response.json())
        .then(data => {
            // Assuming the API response contains 'name', 'phone', and 'email' properties
            const customerName = data.tenKH;
            const customerPhone = data.soDT;
            const customerEmail = data.email;

            // Update the content of the respective <span> elements
            document.getElementById('customerName').textContent = customerName;
            document.getElementById('customerPhone').textContent = customerPhone;
            document.getElementById('customerEmail').textContent = customerEmail;
        })
        .catch(error => {
            console.error('Error fetching customer data:', error);
        });


});
