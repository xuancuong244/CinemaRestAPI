document.addEventListener('DOMContentLoaded', function () {
    function createMovieDetailHTML(data) {
        return `
                <div class="col-3">
                    <img src="../img/phim/${data.hinh}" alt="">
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
                        <b>NĂM SX : ${data.namSX}</b> 
                    </p>
                </div> `;
    }

    function loadMovieDetail(event) {
        event.preventDefault();
        const maPhim = event.target.getAttribute('data-phim-id');
        fetch(`http://localhost:8085/api/Phim/${maPhim}`)
            .then(response => response.json())
            .then(data => {
                const chiTietPhim = document.getElementById('chiTietPhim');
                chiTietPhim.innerHTML = "";

                const movieHTML = createMovieDetailHTML(data);
                chiTietPhim.innerHTML = movieHTML;
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }

    const phimLinks = document.getElementsByClassName('phim-link');
    Array.from(phimLinks).forEach(link => {
        link.addEventListener('click', loadMovieDetail);
    });
});

