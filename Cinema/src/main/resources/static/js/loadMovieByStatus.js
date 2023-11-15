document.addEventListener('DOMContentLoaded', function() {
    function createMovieHTML(phim) {
        const movieHTML = `
      <div class="col-lg-3 col-md-6 col-12 item_movie mb-5">
        <div class="d-flex justify-content-center">
          <a href="">
            <img class="mt-2" src="../img/phim/${phim.hinh}" alt="" width="227px" height="360px" style="border-radius: 20px">
          </a>
        </div>
        <div class="information mt-3">
          <a href="/DynamicCinema/movieDetails?maPhim=${phim.maPhim}&trailer=${phim.trailer}" class="phim-link">
            <h3 class="font__oswald ms-4 movieName" style="color: #337AB7;" data-phim-id="${phim.maPhim}" data-trailer="${phim.trailer}">${phim.tenPhim}</h3>
          </a>
          <p class="font__source ms-4">
            Quốc gia: ${phim.quocGia} <br>
            Thời lượng: ${phim.thoiLuong} <br>
            Ngày khởi chiếu: ${phim.ngayKhoiChieu}
          </p>
        </div>
      </div>
    `;
        return movieHTML;
    }


    // Function để load dữ liệu phim từ API và tạo HTML
    function loadMoviesByStatus(trangThai,maCN) {
        fetch(`http://localhost:8085/api/Phim/trangThai/${trangThai}?maCN=${maCN}`)
            .then(response => response.json())
            .then(data => {
                const phimContainer = document.getElementById('phimContainer');
                const phimList = document.getElementById('phimList');
                phimList.innerHTML = ''; // Xóa các phần tử phim cũ trước khi hiển thị phim mới

                data.forEach(phim => {
                    const movieHTML = createMovieHTML(phim);
                    phimList.innerHTML += movieHTML;
                });
                phimContainer.appendChild(phimList);
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }

    function loadDataById(maCN) {
        var myList = document.getElementById("myList");
        // Sử dụng fetch để gửi yêu cầu GET đến API
        var apiUrl = maCN ? `http://localhost:8085/api/chinhanh/${maCN}` : 'http://localhost:8085/api/chinhanh/all';
        // Sử dụng fetch để gửi yêu cầu GET đến API
        fetch(apiUrl)
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
                        loadMoviesByStatus('DC', cn.maCN);
                        loadDataById(cn.maCN);// Thay 'DC' bằng trạng thái mặc định nếu cần
                        // Cập nhật URL với mã chi nhánh
                        if (data.length > 0) {
                            window.history.pushState({}, '', `http://localhost:8085/DynamicCinema/index#${encodeURIComponent(cn.maCN)}`);
                        }
                    });
                    listItem.appendChild(link);
                    myList.appendChild(listItem);
                });
            })
            .catch(function(error) {
                console.error('Error loading data from API', error);
            });
    }


    // Gọi hàm loadMoviesByStatus khi trạng thái phim được chọn
    document.getElementById('dangchieu-tab').addEventListener('click', () => {
        loadMoviesByStatus('DC');
    });

    document.getElementById('sapchieu-tab').addEventListener('click', () => {
        loadMoviesByStatus('SC');
    });

    document.getElementById('suatchieudacbiet-tab').addEventListener('click', () => {
        loadMoviesByStatus('DB');
    });

    // Gọi hàm loadMoviesByStatus để load dữ liệu phim khi trang web được tải (mặc định là phim đang chiếu)
    loadMoviesByStatus('DC');

    const phimLinks = document.getElementsByClassName('phim-link');
    Array.from(phimLinks).forEach(link => {
        link.addEventListener('click', (event) => {
            event.preventDefault();
            const maPhim = event.target.getAttribute('data-phim-id');
            const trailer = event.target.getAttribute('data-trailer');
            window.location.href = `chitiet_index.html?maPhim=${maPhim}&trailer=${trailer}`;
        });
    });

    document.getElementById('myList').addEventListener('click', function(event) {
        if (event.target.classList.contains('dropdown-item')) {
            loadDataById(event.target.dataset.maCN);
        }
    });
});