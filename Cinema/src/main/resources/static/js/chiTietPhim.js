// document.addEventListener('click', function(event) {
//     var target = event.target;
//
//     // Kiểm tra xem phần tử được click có phải là tên phim hay không
//     if (target.classList.contains('font__oswald')) {
//         // Lấy thông tin chi tiết phim từ phần tử HTML
//         var movieContainer = target.closest('.item_movie');
//         var movieTitle = movieContainer.querySelector('.font__oswald').innerText;
//         var movieGenre = movieContainer.querySelector('.font__source').innerText.split(':')[1].trim();
//         var movieDuration = movieContainer.querySelector('.font__source:nth-of-type(2)').innerText.split(':')[1].trim();
//         var movieReleaseDate = movieContainer.querySelector('.font__source:last-of-type').innerText.split(':')[1].trim();
//
//         // Chuyển hướng đến trang chi tiết phim và truyền thông tin phim dưới dạng tham số trên URL
//         var detailPageURL = 'chitiet_index.html?tenPhim=' + encodeURIComponent(movieTitle) +
//             '&theLoai=' + encodeURIComponent(movieGenre) +
//             '&thoiLuong=' + encodeURIComponent(movieDuration) +
//             '&ngayKhoiChieu=' + encodeURIComponent(movieReleaseDate);
//         window.location.href = detailPageURL;
//     }
// });

// var urlParams = new URLSearchParams(window.location.search);
// var movieTitle = urlParams.get('tenPhim');
// var movieGenre = urlParams.get('theLoai');
// var movieDuration = urlParams.get('thoiLuong');
// var movieReleaseDate = urlParams.get('ngayKhoiChieu');
//
// // Hiển thị thông tin phim lên trang
// document.getElementById('movieTitle').innerText = movieTitle;
// document.getElementById('movieGenre').innerText = movieGenre;
// document.getElementById('movieDuration').innerText = movieDuration;
// document.getElementById('movieReleaseDate').innerText = movieReleaseDate;