package com.smhrd.member.util;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {

    // 네이버 SMTP 서버 설정
    private static final String SMTP_SERVER = "smtp.naver.com";
    private static final String SMTP_USERNAME = "kes220@naver.com"; // 네이버 이메일 계정
    private static final String SMTP_PASSWORD = "kes314159**"; // 네이버 이메일 비밀번호

    public static void sendPasswordResetEmail(String email, String newPassword, String savedId) {
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_SERVER);
        props.put("mail.smtp.port", "465"); // SSL 포트
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SMTP_USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("임시 비밀번호 발송");

            // HTML 형식의 이메일 본문 설정
            String msg = "<html><body>"
                    + "안녕하세요, 냉장고를 부탁해입니다.<br>"
                    + "임시 비밀번호는 <b>" + newPassword + "</b> 입니다.<br>"
                    + "임시 비밀번호로 로그인 하신 후 반드시 비밀번호를 변경해주세요.<br>"
                    + "<a href=\"http://localhost:8085/coreProject/mem_pw_modify.jsp" + "\">비밀번호 변경하기</a>"
                    + "</body></html>";

            message.setContent(msg, "text/html; charset=utf-8");

            Transport.send(message);

            System.out.println("임시 비밀번호 발송 완료");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
