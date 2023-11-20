document.addEventListener('DOMContentLoaded', function () {
    const selectedMovieInfo = JSON.parse(localStorage.getItem('selectedMovie'));
    if (selectedMovieInfo) {
        //Lấy tên phim
        const movieName = document.getElementById('movieName');
        movieName.innerText = selectedMovieInfo.tenPhim;

        // Hiển thị thông tin phim lên trang payment
        const paymentMovieInformation = document.querySelector('.select__movieInformation');

        paymentMovieInformation.innerHTML = `
            <!-- Các đoạn mã HTML tương ứng với thông tin phim, bạn có thể thay đổi phần này dựa trên giao diện của bạn -->
            <div class="row">
                <div class="col-4">
                    <img src="../img/phim/${selectedMovieInfo.hinh}" width="150px;" height="220px" alt="" />
                </div>
                <div class="col-8 select__movieInformation-text">
                    <h3 class="ms-3">${selectedMovieInfo.tenPhim}</h3>
                    <h4>2D Phụ đề</h4>
                </div>
            </div>
            <div class="container">
                    <div class="row select__movieInformation-category">
                        <div class="col-6 mt-3">
                            <div>
                                <img src="../img/logo/vector.png" alt="" width="12px" height="12px">
                                <p class="ms-1 font__source">Thể loại</p>
                            </div>
                            <div class="mt-3">
                                <img src="../img/logo/time.png" alt="" width="12px" height="12px">
                                <p class="ms-1 font__source">Thời lượng</p>
                            </div>
                        </div>
                        <div class="col-6 mt-3">
                            <div>
                                <p class="font__source">Tâm lý</p>
                            </div>
                            <div class="mt-3">
                                <p class="font__source">${selectedMovieInfo.thoiLuong}</p>
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
                                <p class="font__source">DEC Quang Trung</p>
                            </div>
                            <div class="mt-3">
                                <p class="font__source">13/10/2023</p>
                            </div>
                            <div class="mt-3">
                                <p class="font__source">19:00</p>
                            </div>
                            <div class="mt-3">
                                <p class="font__source">P3</p>
                            </div>
                            <div class="mt-3">
                                <div id="selected-seats"></div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center mt-3">
                        <div class="row">
                            <div class="col-6">
                                <a href="http://localhost:8085/DynamicCinema/select" style="text-decoration: none;">
                                <button class="btn btn-login font__oswald" style="width: 95%;">
                                    QUAY LẠI
                                </button>
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="http://localhost:8085/DynamicCinema/thanhtoan">
                                <button class="btn btn-login font__oswald" style="width: 95%;">
                                    TIẾP TỤC
                                </button>
                                </a>
                            </div>
                        </div>
                    </div>
            </div>
        `;
    }
});