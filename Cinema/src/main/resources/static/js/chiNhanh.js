function loadData() {
    var myList = document.getElementById("myList");

    // Sử dụng fetch để gửi yêu cầu GET đến API
    fetch('http://localhost:8085/api/chinhanh/all')
        .then(function(response) {
            return response.json(); // Chuyển đổi dữ liệu nhận được thành đối tượng JSON
        })
        .then(function(data) {
            // Xóa các mục cũ trong danh sách
            myList.innerHTML = '';

            // Tạo các mục mới từ dữ liệu và thêm vào danh sách
            data.forEach(function(cn) {
                var listItem = document.createElement("li");
                var link = document.createElement("a");
                link.textContent = cn.tenCN; // Thay item.name bằng thuộc tính tương ứng từ API
                link.href = `http://localhost:8085/DynamicCinema/index/${encodeURIComponent(cn.maCN)}`; // Thay href bằng thuộc tính tương ứng
                link.addEventListener('click', function(event) {
                    event.preventDefault();
                    console.log("Chi nhánh được chọn:", cn.tenCN);
                });
                listItem.appendChild(link);
                myList.appendChild(listItem);
            });
        })
        .catch(function(error) {
            console.error('Error loading data from API', error);
        });
}