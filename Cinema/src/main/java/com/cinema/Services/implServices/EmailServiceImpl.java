//package com.cinema.Services.implServices;
//
//import com.cinema.Services.EmailService;
//import jakarta.mail.internet.MimeMessage;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.stereotype.Service;
//import org.springframework.mail.javamail.MimeMessageHelper;
//import org.apache.commons.lang3.RandomStringUtils;
//
//
//@Service
//public class EmailServiceImpl implements EmailService {
//    @Autowired
//    private JavaMailSender emailSender;
//
//    @Override
//    public void sendEmail(String to, String subject, String text) {
//        try {
//            MimeMessage message = emailSender.createMimeMessage();
//            MimeMessageHelper helper = new MimeMessageHelper(message, true);
//
//            helper.setTo(to);
//            helper.setSubject(subject);
//            helper.setText(text, true); // Set true if you want to send HTML content
//
//            emailSender.send(message);
//        } catch (Exception e) {
//            // Xử lý exception nếu cần thiết
//        }
//    }
//
//    @Override
//    public String sendOTP(String to) {
//        String subject = "Dynamic Cinema - Mã OTP Xác Nhận Thanh Toán";
//        String otp = generateOTP();
//        String text = "Mã OTP của bạn là: " + otp;
//
//        sendEmail(to, subject, text);
//
//        return otp;
//    }
//
//    private String generateOTP() {
//        // Tạo mã OTP ngẫu nhiên gồm 6 ký tự
//        return RandomStringUtils.randomNumeric(6);
//    }
//}
