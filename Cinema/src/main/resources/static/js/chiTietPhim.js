document.addEventListener('DOMContentLoaded', function () {
    function createMovieDetailHTML(data) {
        // Lấy tên phim và cập nhật #movieName (Trang Chủ / #movieName)
        const movieName = document.getElementById('movieName');
        movieName.innerText = data.tenPhim;

        const videoUrl = data.trailer;

        // Lấy thẻ iframe
        const trailerFrame = document.getElementById('trailerFrame');

        // Cập nhật đường dẫn của iframe
        trailerFrame.src = videoUrl;

        const ngayKhoiChieu = new Date(data.ngayKhoiChieu);
        const formattedNgayKhoiChieu = `${ngayKhoiChieu.getDate()}/${ngayKhoiChieu.getMonth()+1}/${ngayKhoiChieu.getFullYear()}`;

        return `
                <div class="col-3">
                    <img style="border-radius: 20px" width="258px" height="407px" src="../img/phim/${data.hinh}" alt="">
                </div>
                <div class="col-9 p-0">
                    <p class="font__oswald" style="font-size: 32px;">${data.tenPhim}</p>
                    <P class="font__source content__chiTiet--moTa">${data.moTa}</P>
                    <p class="m-0 font__source mt-3">
                        <b>ĐẠO DIỄN: ${data.daoDien}</b>
                    </p>
                    <p class="m-0 font__source mt-3">
                        <b>DIỄN VIÊN: ${data.dienVien}</b>
                    </p>
                    <p class="m-0 font__source mt-3">
                        <b>THỜI LƯỢNG: ${data.thoiLuong}</b> 
                    </p>
                    <p class="m-0 font__source mt-3">
                        <b>QUỐC GIA: ${data.quocGia}</b> 
                    </p>
                    <p class="m-0 font__source mt-3">
                        <b>NGÀY KHỞI CHIẾU : ${formattedNgayKhoiChieu}</b> 
                    </p>
                </div> `;
    }

    function getMaPhimFromURL() {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get('maPhim');
    }

    const maPhim = getMaPhimFromURL();

    if (maPhim) {
        // Gọi API để lấy thông tin chi tiết phim
        fetch(`http://localhost:8085/api/Phim/${maPhim}`)
            .then(response => response.json())
            .then(data => {
                const chiTietPhim = document.getElementById('chiTietPhim');
                chiTietPhim.innerHTML = createMovieDetailHTML(data);

                localStorage.setItem('selectedMovie', JSON.stringify(data));
            })
            .catch(error => {
                console.error('Lỗi:', error);
            });
    }

});

