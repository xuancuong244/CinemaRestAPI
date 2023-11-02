// Function để tạo HTML cho mỗi phim
function createMovieHTML(phim) {
    const movieHTML = `
      <div class="col-lg-3 col-md-6 col-12 item_movie mb-5">
        <div class="d-flex justify-content-center">
          <a href="">
            <img class="mt-2" src="../img/phim/${phim.hinh}" alt="" width="227px" height="360px">
          </a>
        </div>
        <div class="information mt-3">
          <a href="/DynamicCinema/movieDetails" class="phim-link" data-phim-id="phim1">
            <h3 class="font__oswald ms-4 movieName" style="color: #337AB7;">${phim.tenPhim}</h3>
          </a>
          <p class="font__source ms-4">
            Quốc gia: ${phim.quocGia} <br>
            Thời lượng: ${phim.thoiLuong} <br>
            Ngày khởi chiếu: ${phim.namSX}
          </p>
        </div>
      </div>
    `;
    return movieHTML;
}

// Function để load dữ liệu phim từ API và tạo HTML
function loadMovies() {
    fetch('http://localhost:8085/api/Phim/all')
        .then(response => response.json())
        .then(data => {
            const phimContainer = document.getElementById('phimContainer1');
            const phimList = document.getElementById('phimList1');
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
// Gọi hàm loadMovies để load dữ liệu phim khi trang web được tải
loadMovies();
