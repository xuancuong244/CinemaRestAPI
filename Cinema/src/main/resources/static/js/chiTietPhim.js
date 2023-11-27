document.addEventListener('DOMContentLoaded', function () {


    function loadShowtimes(maPhim) {
        // Sử dụng fetch để gửi yêu cầu GET đến API với mã chi nhánh
        fetch(`http://localhost:8085/api/NgayChieu/maPhim?maPhim=${maPhim}`)
            .then(function (response) {
                return response.json(); // Chuyển đổi dữ liệu nhận được thành đối tượng JSON
            })
            .then(function (data) {
                // Làm điều gì đó với thông tin ngày chiếu và suất chiếu, có thể tạo các nút hoặc hiển thị trong giao diện
                console.log("Thông tin ngày và suất chiếu:", data);

                // Lặp qua danh sách ngày chiếu và suất chiếu để hiển thị trong giao diện
                var xuatChieuList = document.getElementById("xuatChieuList");
                xuatChieuList.innerHTML = ''; // Xóa các mục cũ trong danh sách

                var ngayChieuList = document.getElementById("ngayChieuList");
                ngayChieuList.innerHTML = '';

                data.forEach(function (showtime) {
                    // Tạo nút cho suất chiếu
                    var timeButton = document.createElement("button");
                    timeButton.type = "button";
                    timeButton.className = "btn btn__time";
                    timeButton.textContent = showtime.gioBatDau;

                    // Tạo nút cho ngày chiếu
                    var dateButton = document.createElement("button");
                    dateButton.type = "button";
                    dateButton.className = "btn btn__date";
                    dateButton.textContent = showtime.ngay;

                    // Thêm sự kiện khi người dùng click vào nút
                    dateButton.addEventListener('click', function () {
                        // Xử lý khi người dùng chọn ngày và suất chiếu, có thể hiển thị thông tin chi tiết, chẳng hạn
                        console.log("Đã chọn ngày chiếu:", showtime.ngay);
                    });

                    timeButton.addEventListener('click',function (){
                        console.log("Đã chọn suất chiếu:", showtime.gioBatDau);
                    })

                    xuatChieuList.appendChild(timeButton);
                    ngayChieuList.appendChild(dateButton);
                });
            })
            .catch(function (error) {
                console.error('Lỗi khi tải dữ liệu từ API về ngày và suất chiếu', error);
            });
    }




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
        loadShowtimes(maPhim);
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

