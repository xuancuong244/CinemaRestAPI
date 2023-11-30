document.addEventListener('DOMContentLoaded', function () {
    // Lấy thông tin từ localStorage
    const selectedDateTime = JSON.parse(localStorage.getItem('selectedDateTime'));
    const selectedMovieInfo = JSON.parse(localStorage.getItem('selectedMovie'));
    const selectedSeatsInfo = JSON.parse(localStorage.getItem('selectedSeats'));

    // Hiển thị thông tin đã chọn trong console
    console.log("Ngày chiếu đã chọn:", selectedDateTime.date);
    console.log("Suất chiếu đã chọn:", selectedDateTime.showtime);
    console.log("SelectedSeatsInfo:", selectedSeatsInfo);
    console.log(selectedSeats);
    console.log(localStorage.getItem('selectedSeats'));


    // Hàm hiển thị thông tin ghế đã chọn
    function displaySelectedSeats(seatsInfo) {
        const selectedSeatsContainer = document.getElementById('selected-seats');
        if (selectedSeatsContainer && seatsInfo) {
            const seatsHTML = seatsInfo.map(seatInfo => {
                return `<span class='text-danger'>${seatInfo.seat}(${seatInfo.seatType})</span>`;
            }).join(", ");
            selectedSeatsContainer.innerHTML = seatsHTML;
        }
    }
    // Gọi hàm để hiển thị thông tin ghế đã chọn
    if (selectedSeatsInfo && selectedSeatsInfo.length > 0) {
        displaySelectedSeats(selectedSeatsInfo);
    }

    if (selectedSeatsInfo) {
        // Duyệt qua danh sách ghế đã chọn và hiển thị thông tin
        selectedSeatsInfo.forEach(seatInfo => {
            displaySeatInfo(seatInfo);
        });
    }

    function displaySeatInfo(seatInfo) {
        const seatPriceContainer = document.querySelector('.seatPrice');
        const seatBox = document.createElement('div');
        seatBox.classList.add('seatPrice__box', 'row', 'font__oswald', 'mt-3');

        const seatTitleCol = document.createElement('div');
        seatTitleCol.classList.add('col-8');
        const seatTitle = document.createElement('p');
        seatTitle.classList.add('seatPrice__title');
        seatTitle.innerText = `GHẾ ${seatInfo.seatType.toUpperCase()}`;
        seatTitleCol.appendChild(seatTitle);

        const seatTextPriceCol = document.createElement('div');
        seatTextPriceCol.classList.add('col-4');
        const seatTextPrice = document.createElement('p');
        seatTextPrice.classList.add('text-end', 'seatPrice__textPrice', 'me-5');
        seatTextPrice.innerText = `${getSeatPrice(seatInfo.seatType)}`;
        seatTextPriceCol.appendChild(seatTextPrice);

        seatBox.appendChild(seatTitleCol);
        seatBox.appendChild(seatTextPriceCol);
        seatPriceContainer.appendChild(seatBox);
    }

    function getSeatPrice(seatType) {
        // Giả sử giá được lưu trữ trong một đối tượng hoặc bảng dữ liệu
        const seatPrices = {
            'Vip': 75000,
            'Thường': 45000,
            // Thêm các loại ghế khác nếu có
        };

        // Trả về giá ghế tương ứng với loại ghế
        return seatPrices[seatType] || 0; // Trả về giá mặc định nếu không tìm thấy loại ghế
    }

    if (selectedMovieInfo && selectedDateTime) {
        //Lấy tên phim
        const movieName = document.getElementById('movieName');
        movieName.innerText = selectedMovieInfo.tenPhim;

        // Format lại ngày theo kiểu "dd/MM/yyyy"
        var dateObject = new Date(selectedDateTime.date);
        var formattedDate = `${dateObject.getDate()}/${dateObject.getMonth() + 1}/${dateObject.getFullYear()}`;

        // Hiển thị thông tin phim lên trang payment
        const paymentMovieInformation = document.querySelector('.select__movieInformation');

        paymentMovieInformation.innerHTML = `
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
                                <p class="font__source" style="font-weight: bold">Tâm lý</p>
                            </div>
                            <div class="mt-3">
                                <p class="font__source" style="font-weight: bold">${selectedMovieInfo.thoiLuong}</p>
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
                                <div id="selected-seats" style="color: red;font-weight: bold"></div>
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