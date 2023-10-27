// Function để tạo HTML cho mỗi phim
function createMovieHTML(phim) {
    const movieHTML = `
      <div class="col-lg-3 col-md-6 col-12 item_movie mb-5">
        <div class="d-flex justify-content-center">
          <a href="">
            <img class="mt-2" src="/img/phim/${phim.hinh}" alt="" width="227px" height="360px">
          </a>
        </div>
        <div class="information mt-3">
          <a href="/DynamicCinema/indexx" class="phim-link" data-phim-id="phim1">
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
            const phimContainer = document.getElementById('phimContainer');
            const phimList = document.getElementById('phimList');
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

document.addEventListener('click', function(event) {
    var target = event.target;

    // Kiểm tra xem phần tử được click có phải là tên phim hay không
    if (target.classList.contains('movieName')) {
        // Lấy thông tin chi tiết phim từ phần tử HTML
        var movieContainer = target.closest('.item_movie');
        var movieTitle = movieContainer.querySelector('.font__oswald').innerText;
        var movieGenre = movieContainer.querySelector('.font__source').innerText.split(':')[1].trim();
        var movieDuration = movieContainer.querySelector('.font__source:nth-of-type(2)').innerText.split(':')[1].trim();
        var movieReleaseDate = movieContainer.querySelector('.font__source:last-of-type').innerText.split(':')[1].trim();

        // Tạo đối tượng phim và truyền giá trị vào
        var movie = {
            tenPhim: movieTitle,
            theLoai: movieGenre,
            thoiLuong: movieDuration,
            ngayKhoiChieu: movieReleaseDate
        };

        // Chuyển hướng đến trang chi tiết phim và truyền thông tin phim dưới dạng tham số trên URL
        var queryString = Object.keys(movie).map(function(key) {
            return encodeURIComponent(key) + '=' + encodeURIComponent(movie[key]);
        }).join('&');

        var detailPageURL = 'chitiet_index.html?' + queryString;
        window.location.href = detailPageURL;
    }
});


