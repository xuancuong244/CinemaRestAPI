function getQueryParam(name) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(name);
}

function showHTML(event) {
    if (event.target.tagName === 'A') {
        // Lấy tên chi nhánh từ nội dung của thẻ "a"
        var tenCN = event.target.textContent;

        // Lưu tên chi nhánh vào localStorage
        chonChiNhanh(tenCN);

        // Thay đổi nội dung của nút "Tỉnh/Thành Phố" thành tên chi nhánh được chọn
        var dropdownButton = document.querySelector('.header__search .dropdown-toggle');
        dropdownButton.textContent = tenCN;

        // Thay đổi địa chỉ trang web
        var maCN = encodeURIComponent(tenCN);
        window.location.href = `http://localhost:8085/DynamicCinema/index?chiNhanh=${maCN}`;
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

// Hàm để cập nhật nút "Tỉnh/Thành Phố" dựa trên tham số chiNhanh trong URL
function updateTinhThanhPhoButton() {
    var dropdownButton = document.querySelector('.header__search .dropdown-toggle');
    var chiNhanhFromURL = getQueryParam('chiNhanh');

    // Nếu có tham số chiNhanh trong URL, gán nó cho nút "Tỉnh/Thành Phố"
    if (chiNhanhFromURL) {
        dropdownButton.textContent = decodeURIComponent(chiNhanhFromURL);
    } else {
        // Nếu không có tham số chiNhanh, giữ nguyên nội dung là "Tỉnh/Thành Phố"
        dropdownButton.textContent = 'Tỉnh/Thành Phố';
    }
}

// Trong hàm xử lý sự kiện khi người dùng chọn chi nhánh
function chonChiNhanh(tenChiNhanh) {
    // Lưu thông tin chi nhánh vào localStorage
    localStorage.setItem('selectedBranch', JSON.stringify({ tenChiNhanh: tenChiNhanh }));
}

document.addEventListener("DOMContentLoaded", function () {
    updateTinhThanhPhoButton();
    document.getElementById("myList").addEventListener("click", function (event) {
        loadData();
        showHTML(event);
        // Cập nhật nút "Tỉnh/Thành Phố" sau khi chọn chi nhánh
        updateTinhThanhPhoButton();
    });
});

