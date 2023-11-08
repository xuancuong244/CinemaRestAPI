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
                        <b>THỜI LƯỢNG: ${data.thoiLuong} phút</b> 
                    </p>
                    <p class="m-0 font__source mt-3">
                        <b>QUỐC GIA: ${data.quocGia}</b> 
                    </p>
                    <p class="m-0 font__source mt-3">
                        <b>NGÀY KHỞI CHIẾU : ${data.ngayKhoiChieu}</b> 
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
                getLichXuatChieuForPhim(maPhim);
            })
            .catch(error => {
                console.error('Lỗi:', error);
            });
    }

    function getLichXuatChieuForPhim(maPhim) {
        fetch(`http://localhost:8085/api/XuatChieu/maPhim?maPhim=${maPhim}`)
            .then(response => response.json())
            .then(data => {
                const xuatChieuList = document.getElementById("xuatChieuList");
                xuatChieuList.innerHTML = ""; // Xóa nội dung cũ trước khi thêm dữ liệu mới

                data.forEach(xuatChieu => {
                    const button = document.createElement("button");
                    button.className = "btn btn__time";
                    button.textContent = xuatChieu.gio_bat_dau;
                    const redirectUrl = button.getAttribute("data-redirect-url");

                    // Gắn sự kiện click vào button để xử lý logic khi người dùng chọn xuất chiếu
                    button.addEventListener("click", () => {
                        window.location.href = redirectUrl;
                    });

                    xuatChieuList.appendChild(button);
                });
            })
            .catch(error => {
                console.error("Lỗi:", error);
            });
    }


});

