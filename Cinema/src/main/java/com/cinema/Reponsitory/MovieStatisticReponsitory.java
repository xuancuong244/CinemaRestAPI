package com.cinema.Reponsitory;

import com.cinema.Entity.MovieStatistics;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MovieStatisticReponsitory extends JpaRepository<MovieStatistics, Long> {

//    @Query(nativeQuery = true, value= " WITH VeCountCTE AS ( SELECT MaKH,Stt_XC, COUNT(*) AS so_luong_ve FROM ve  GROUP BY MaKH, Stt_XC " +
//            "SELECT kh.ten_kh,kh.sodt,phim.ten_phim," +
//            "           STUFF(( SELECT ', ' + ghe.ten_ghe" +
//            "                    FROM khach_hang kh_inner" +
//            "                  LEFT JOIN ve v ON v.MaKH = kh_inner.ma_kh"+
//            "                  LEFT JOIN chi_tiet_ghe ctg ON ctg.ma_ctghe = v.MaCTGhe "+
//            "              LEFT JOIN ghe ON ghe.ma_ghe = ctg.ma_ghe" +
//            "                   WHERE kh_inner.ma_kh = kh.ma_kh"  +
//            "                   AND v.Stt_XC = ve_count.Stt_XC" +
//            "           FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS cac_ghe_da_mua," +
//            "       (lg.phu_thu+xc.gia_xuat_chieu)* 1.05 + (case when chi_tiet_topping.idve  is null then 0 else chi_tiet_topping.SoLuongMua*topping.gia end) as tongTien\" +\n" +
//            "            FROM" +
//            "            khach_hang kh" +
//            "            LEFT JOIN VeCountCTE ve_count ON kh.ma_kh = ve_count.MaKH" +
//            "            LEFT JOIN ve ON ve.MaKH = kh.ma_kh" +
//            "           LEFT JOIN xuat_chieu xc ON xc.stt = ve.Stt_XC" +
//            "           LEFT JOIN phim ON xc.ma_phim = phim.ma_phim" +
//            "        LEFT JOIN ngay_chieu nc ON nc.stt = xc.ma_ngay_chieu" +
//            "           LEFT JOIN chi_tiet_ghe ctg ON ctg.ma_ctghe = ve.MaCTGhe" +
//            "           LEFT JOIN ghe ON ghe.ma_ghe = ctg.ma_ghe" +
//            "            LEFT JOIN loai_ghe lg ON lg.ma_loai = ghe.ma_loai" +
//            "           LEFT JOIN chi_tiet_topping ON chi_tiet_topping.idve = ve.IdVe" +
//            "            LEFT JOIN topping ON topping.ma_topping = chi_tiet_topping.matopping" +
//            "            WHERE" +
//            "                ve.MaKH IS NOT NULL" +
//            "           GROUP BY" +
//            "               kh.ma_kh, kh.ten_kh, kh.sodt, ve_count.so_luong_ve, ve_count.Stt_XC, phim.ten_phim, lg.phu_thu, xc.gia_xuat_chieu, chi_tiet_topping.SoLuongMua, topping.gia, chi_tiet_topping.idve;")
//    List<MovieStatistics> getMovieStatistics();
}
