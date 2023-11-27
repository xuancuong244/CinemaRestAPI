document.addEventListener('DOMContentLoaded', function () {
    // Lấy thông tin từ localStorage
    const selectedDateTime = JSON.parse(localStorage.getItem('selectedDateTime'));

    // Hiển thị thông tin đã chọn trong console (bạn có thể thay đổi phần này tùy theo nhu cầu)
    console.log("Ngày chiếu đã chọn:", selectedDateTime.date);
    console.log("Suất chiếu đã chọn:", selectedDateTime.showtime);

    // Kiểm tra xem có thông tin phim đã được lưu trong localStorage hay không
    const selectedMovie = JSON.parse(localStorage.getItem('selectedMovie'));


    if (selectedMovie && selectedDateTime) {
        // Hiển thị thông tin phim lấy từ localStorage lên trang select
        const selectMovieInformation = document.querySelector('.select__movieInformation');

        const movieName = document.getElementById('movieName');
        movieName.innerText = selectedMovie.tenPhim;

        // Format lại ngày theo kiểu "dd/MM/yyyy"
        var dateObject = new Date(selectedDateTime.date);
        var formattedDate = `${dateObject.getDate()}/${dateObject.getMonth() + 1}/${dateObject.getFullYear()}`;

        selectMovieInformation.innerHTML = `
            <!-- Các đoạn mã HTML tương ứng với thông tin phim, bạn có thể thay đổi phần này dựa trên giao diện của bạn -->
            <div class="row">
                <div class="col-4">
                    <img src="../img/phim/${selectedMovie.hinh}" width="150px;" height="220px" alt="" />
                </div>
                <div class="col-8 select__movieInformation-text">
                    <h3 class="ms-3">${selectedMovie.tenPhim}</h3>
                    <h4>2D Phụ đề</h4>
                </div>
            </div>
            <div class="container">
                    <div class="row select__movieInformation-category">
                        <div class="col-6 mt-3">
                            <div>
                                <img src="../img/logo/vector.png" alt="" width="12px" height="12px">
                                <p class="ms-1 font__source">Thể loại: </p>
                            </div>
                            <div class="mt-3">
                                <img src="../img/logo/time.png" alt="" width="12px" height="12px">
                                <p class="ms-1 font__source">Thời lượng: </p>
                            </div>
                        </div>
                        <div class="col-6 mt-3">
                            <div>
                                <p class="font__source" style="font-weight: bold">Tâm lý</p>
                            </div>
                            <div class="mt-3">
                                <p class="font__source" style="font-weight: bold">${selectedMovie.thoiLuong}</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6 mt-3 select__movieInformation-ticket">
                            <div>
                                <img src="../img/logo/rapChieu.png" alt="" width="12px" height="12px">
                                <p class="ms-1 font__source">Rạp chiếu</p>
                            </div>
                            <div class="mt-3">
                                <img src="../img/logo/date.png" alt="" width="12px" height="12px">
                                <p class="ms-1 font__source">Ngày chiếu</p>
                            </div>
                            <div class="mt-3">
                                <img src="../img/logo/time.png" alt="" width="12px" height="12px">
                                <p class="ms-1 font__source">Giờ chiếu</p>
                            </div>
                            <div class="mt-3">
                                <img src="../img/logo/phongChieu.png" alt="" width="12px" height="12px">
                                <p class="ms-1 font__source">Phòng chiếu</p>
                            </div>
                            <div class="mt-3">
                                <img src="../img/logo/gheNgoi.png" alt="" width="12px" height="12px">
                                <p class="ms-1 font__source">Ghế ngồi</p>
                            </div>
                        </div>
                        <div class="col-6 mt-3">
                            <div>
                                <p class="font__source" style="font-weight: bold">DEC Quang Trung</p>
                            </div>
                            <div class="mt-3">
                                <p class="font__source" style="font-weight: bold">${formattedDate}</p>
                            </div>
                            <div class="mt-3">
                                <p class="font__source" style="font-weight: bold">${selectedDateTime.showtime}</p>
                            </div>
                            <div class="mt-3">
                                <p class="font__source" style="font-weight: bold">P3</p>
                            </div>
                            <div class="mt-3">
                                <div id="selected-seats" style="font-weight: bold"></div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center mt-3">
                        <a href="http://localhost:8085/DynamicCinema/payment" style="text-decoration: none;">
                        <button class="btn btn-login font__oswald" style="width: 45%;">
                            TIẾP TỤC
                        </button>
                        </a>
                    </div>
                </div>
        `;
        window.selectedMovieInfo = selectedMovie;
    }

});
