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
            })
            .catch(error => {
                console.error('Lỗi:', error);
            });
        loadNgayChieuByMaPhim(maPhim);
    }

    function loadNgayChieuByMaPhim(maPhim) {
        fetch(`http://localhost:8085/api/NgayChieu/maPhim?maPhim=${maPhim}`)
            .then(response => response.json())
            .then(data => {
                const ngayTab = document.getElementById('ngay-tab');

                // Xóa tất cả các nút cũ
                while (ngayTab.firstChild) {
                    ngayTab.removeChild(ngayTab.firstChild);
                }

                // Tạo nút cho mỗi ngày chiếu và gán nội dung
                if (Array.isArray(data)) {
                    data.forEach(ngayChieu => {
                        const button = document.createElement('button');
                        button.className = 'nav-link btn__date';
                        button.dataset.bsToggle = 'tab';
                        button.dataset.bsTarget = '#ngay';
                        button.type = 'button';
                        button.role = 'tab';
                        button.ariaControls = 'ngay';
                        button.ariaSelected = 'true';
                        button.style.color = 'black';

                        const span = document.createElement('span');
                        span.className = 'date__ngay';
                        span.textContent = ngayChieu.ngay;

                        button.appendChild(span);
                        ngayTab.appendChild(button);

                        // Xử lý sự kiện khi người dùng nhấn vào nút ngày chiếu
                        button.addEventListener('click', () => {
                            // Gọi một hàm để load thông tin xuất chiếu cho ngày chiếu tương ứng
                            // loadXuatChieuByNgayChieu(ngayChieu.ngay);
                        });
                    });
                } else {
                    const span = document.createElement('span');
                    span.textContent = 'Không có thông tin ngày chiếu';
                    ngayTab.appendChild(span);
                }
            })
            .catch(error => {
                console.error('Lỗi:', error);
            });
    }

    // function loadXuatChieuByNgayChieu(ngayChieu) {
    //     // Đây bạn cần thực hiện yêu cầu fetch để lấy thông tin xuất chiếu cho ngày chiếu cụ thể
    //     fetch(`http://localhost:8085/api/XuatChieu/ngayChieu?ngayChieu=${ngayChieu}`)
    //         .then(response => response.json())
    //         .then(data => {
    //             const xuatChieuList = document.getElementById('xuatChieuList');
    //
    //             // Xóa tất cả các thông tin xuất chiếu cũ
    //             while (xuatChieuList.firstChild) {
    //                 xuatChieuList.removeChild(xuatChieuList.firstChild);
    //             }
    //
    //             // Tạo các thông tin xuất chiếu mới dựa trên dữ liệu nhận được
    //             if (Array.isArray(data)) {
    //                 data.forEach(xuatChieu => {
    //                     const button = document.createElement('button');
    //                     button.type = 'button';
    //                     button.className = 'btn btn__time';
    //                     button.dataset.bsToggle = 'modal';
    //                     button.dataset.bsTarget = '#staticBackdrop';
    //                     button.textContent = xuatChieu.gioChieu;
    //
    //                     const link = document.createElement('a');
    //                     link.href = `http://localhost:8085/DynamicCinema/select`;
    //                     link.style.listStyleType = 'none';
    //                     link.style.textDecoration = 'none';
    //                     link.style.color = 'black';
    //
    //                     link.appendChild(button);
    //                     xuatChieuList.appendChild(link);
    //                 });
    //             } else {
    //                 const span = document.createElement('span');
    //                 span.textContent = 'Không có thông tin xuất chiếu cho ngày này';
    //                 xuatChieuList.appendChild(span);
    //             }
    //         })
    //         .catch(error => {
    //             console.error('Lỗi:', error);
    //         });
    // }

    // function loadNgayChieuByMaPhim(maPhim) {
    //     fetch(`http://localhost:8085/api/NgayChieu/maPhim?maPhim=${maPhim}`)
    //         .then(response => response.json())
    //         .then(data => {
    //             const ngayTab = document.getElementById('ngay-tab');
    //             const ngaySpan = ngayTab.querySelector('.date__ngay');
    //             // Đặt nội dung của thẻ span thành danh sách ngày chiếu
    //             if (Array.isArray(data)) {
    //                 const ngayChieuList = data.map(ngayChieu => new Date(ngayChieu.ngay));
    //                 const formattedDates = ngayChieuList.map(date => date.toLocaleDateString());
    //             } else {
    //                 ngaySpan.textContent = 'Không có thông tin ngày chiếu';
    //             }
    //         })
    //         .catch(error => {
    //             console.error('Lỗi:', error);
    //         });
    // }



});

