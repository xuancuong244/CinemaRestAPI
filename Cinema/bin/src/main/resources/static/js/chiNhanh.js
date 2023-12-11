function showHTML(event) {
    if (event.target.tagName === 'A') {
        // Lấy tên chi nhánh từ nội dung của thẻ "a"
        var tenCN = event.target.textContent;

        // Lưu tên chi nhánh vào localStorage
        chonChiNhanh(tenCN);

        // Thay đổi địa chỉ trang web
        var name = encodeURIComponent(tenCN);
        window.location.href = `http://localhost:8085/DynamicCinema/index?${name}`;
    }
}

function loadData() {
    var myList = document.getElementById("myList");

    // Sử dụng fetch để gửi yêu cầu GET đến API
    fetch('http://localhost:8085/api/chinhanh/all')
        .then(function (response) {
            return response.json(); // Chuyển đổi dữ liệu nhận được thành đối tượng JSON
        })
        .then(function (data) {
            // Xóa các mục cũ trong danh sách
            myList.innerHTML = '';
            // Tạo các mục mới từ dữ liệu và thêm vào danh sách
            data.forEach(function (cn) {
                var listItem = document.createElement("li");
                var link = document.createElement("a");
                link.textContent = cn.tenCN; // Thay item.name bằng thuộc tính tương ứng từ API
                link.href = `http://localhost:8085/DynamicCinema/index/${encodeURIComponent(cn.maCN)}`; // Thay href bằng thuộc tính tương ứng
                link.addEventListener('click', function (event) {
                    event.preventDefault();
                    console.log("Chi nhánh được chọn:", cn.tenCN);
                });
                listItem.appendChild(link);
                myList.appendChild(listItem);
            });
        })
        .catch(function (error) {
            console.error('Error loading data from API', error);
        });
}

// Trong hàm xử lý sự kiện khi người dùng chọn chi nhánh
function chonChiNhanh(tenChiNhanh) {
    // Lưu thông tin chi nhánh vào localStorage
    localStorage.setItem('selectedBranch', JSON.stringify({ tenChiNhanh: tenChiNhanh }));
}

document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("myList").addEventListener("click", function (event) {
        loadData();
        showHTML(event);
    });
});

