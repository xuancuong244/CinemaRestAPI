document.addEventListener('DOMContentLoaded', function () {

    // Biến selectedDate để lưu trữ ngày được chọn
    var selectedDate = null;

    // Lấy phần tử ngayChieuList
    var ngayChieuList = document.getElementById("ngayChieuList");

    // Mảng để lưu trữ các ngày đã được thêm vào DOM
    var addedDates = [];

    //Function xử lý ngày chiếu
    function loadShowtimes(maPhim) {
        // Sử dụng fetch để gửi yêu cầu GET đến API với mã chi nhánh
        fetch(`http://localhost:8085/api/NgayChieu/maPhim?maPhim=${maPhim}`)
            .then(function (response) {
                // Chuyển đổi dữ liệu nhận được thành đối tượng JSON
                return response.json();
            })
            .then(function (data) {
                console.log("Thông tin ngày và suất chiếu:", data);

                // Xóa nút ngày cũ
                ngayChieuList.innerHTML = '';

                // Lặp qua danh sách ngày
                data.forEach(function (showtime) {
                    // Kiểm tra xem ngày đã được thêm vào DOM chưa
                    if (!addedDates.includes(showtime.ngay)) {
                        // Nếu chưa, thêm nó vào DOM và mảng
                        addDateButton(showtime.ngay,data);
                        addedDates.push(showtime.ngay);
                    }
                });

                // Mặc định hiển thị suất chiếu cho ngày đầu tiên trong danh sách
                if (data.length > 0) {
                    selectedDate = data[0].ngay;
                    showShowtimesForSelectedDate(data, selectedDate);
                }

            })
            .catch(function (error) {
                console.error('Lỗi khi tải dữ liệu từ API về ngày và suất chiếu', error);
            });
    }

    //Function xử lý suất chiếu
    function showShowtimesForSelectedDate(data, selectedDate) {
        // Lặp qua danh sách suất chiếu để hiển thị trong giao diện
        var xuatChieuList = document.getElementById("xuatChieuList");
        xuatChieuList.innerHTML = ''; // Xóa các mục cũ trong danh sách

        // Lặp qua danh sách suất chiếu để hiển thị trong giao diện
        data.forEach(function (showtime) {
            if (showtime.ngay === selectedDate) {
                // Tạo nút cho suất chiếu
                var timeButton = document.createElement("button");
                timeButton.type = "button";
                timeButton.className = "btn btn__time";
                timeButton.textContent = showtime.gioBatDau;

                // Thêm sự kiện khi người dùng click vào nút suất chiếu
                timeButton.addEventListener('click', function () {
                    // Xử lý khi người dùng chọn ngày và suất chiếu, có thể hiển thị thông tin chi tiết, chẳng hạn
                    console.log("Đã chọn suất chiếu:", showtime.gioBatDau);
                    var selectedDateTime = {
                        date: selectedDate,
                        showtime: showtime.gioBatDau
                    };
                    localStorage.setItem('selectedDateTime', JSON.stringify(selectedDateTime));
                    window.location.href = "http://localhost:8085/DynamicCinema/select";
                });

                xuatChieuList.appendChild(timeButton);
            }
        });
    }


    function addDateButton(date, data) {
        // Tạo phần tử div mới cho mỗi ngày
        var ngayChieuItem = document.createElement("div");
        ngayChieuItem.className = "d-flex";

        // Format lại ngày theo kiểu "dd/MM/yyyy"
        var dateObject = new Date(date);
        var formattedDate = `${dateObject.getDate()}/${dateObject.getMonth() + 1}/${dateObject.getFullYear()}`;

        // Tạo nút cho ngày chiếu
        var dateButton = document.createElement("button");
        dateButton.type = "button";
        dateButton.className = "btn btn__date";
        dateButton.textContent = formattedDate;

        // Thêm sự kiện khi người dùng click vào nút
        dateButton.addEventListener('click', function () {
            selectedDate = date;
            console.log("Đã chọn ngày chiếu:", date);
            showShowtimesForSelectedDate(data, selectedDate);
        });

        // Thêm nút ngày vào phần tử ngayChieuItem
        ngayChieuItem.appendChild(dateButton);

        // Thêm phần tử ngayChieuItem vào ngayChieuList
        ngayChieuList.appendChild(ngayChieuItem);
    }

    function createMovieDetailHTML(data) {

        // Lấy thông tin thể loại từ đối tượng Phim
        const genres = data.theLoai.map(theloai => theloai.tenTheLoai).join(', ');

        // Lấy tên phim và cập nhật #movieName (Trang Chủ / #movieName)
        const movieName = document.getElementById('movieName');
        movieName.innerText = data.tenPhim;

        const videoUrl = data.trailer;

        // Lấy thẻ iframe
        const trailerFrame = document.getElementById('trailerFrame');

        // Cập nhật đường dẫn của iframe
        trailerFrame.src = videoUrl;

        //Hiển thị ngày chiếu và format ngày chiếu theo dạng ngày/tháng/năm
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
                        <b>THỂ LOẠI: ${genres}</b>
                    </p>
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
                const genresUrl = `http://localhost:8085/api/Phim/${maPhim}/theLoai`;
                fetch(genresUrl)
                    .then(response => response.json())
                    .then(genres => {
                        // Cập nhật đối tượng Phim với thông tin thể loại
                        data.theLoai = genres;

                const chiTietPhim = document.getElementById('chiTietPhim');
                chiTietPhim.innerHTML = createMovieDetailHTML(data);

                localStorage.setItem('selectedMovie', JSON.stringify(data));
                localStorage.setItem('selectedGenres', JSON.stringify(genres));
            })
                    .catch(error => {
                        console.error('Lỗi khi lấy thông tin thể loại', error);
                    });
            })
            .catch(error => {
                console.error('Lỗi:', error);
            });
    }
});

