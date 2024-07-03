package com.smhrd.member.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.json.JSONObject;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

@WebServlet("/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("file");
        File tempFile = File.createTempFile("upload_", ".jpg");

        try (FileOutputStream fos = new FileOutputStream(tempFile)) {
            fos.write(filePart.getInputStream().readAllBytes());
        }

        try {
            String bucketName = "plzbe";
            String sourceBlobName = "image.jpg"; // 수정 필요
            String destinationBlobName = "output.txt"; // 수정 필요

            // 업로드한 파일을 GCS에 저장
            uploadFileToGcs(bucketName, sourceBlobName, tempFile);
            
            // Python 서버에 요청 보내기
            JSONObject json = new JSONObject();
            json.put("bucket_name", bucketName);
            json.put("source_blob_name", sourceBlobName);
            json.put("destination_blob_name", destinationBlobName);

            URL url = new URL("http://localhost:5000/process_image");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            try (OutputStream os = conn.getOutputStream()) {
                os.write(json.toString().getBytes("utf-8"));
            }

            StringBuilder responseStr = new StringBuilder();
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    responseStr.append(responseLine.trim());
                }
            }

            String jsonResponse = responseStr.toString();
            System.out.println("JSON Response: " + jsonResponse); // 서버 응답 로그

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse);

        } catch (Exception e) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            JSONObject errorJson = new JSONObject();
            errorJson.put("status", "error");
            errorJson.put("message", e.getMessage());
            response.getWriter().write(errorJson.toString());
        } finally {
            tempFile.delete();
        }
    }

    private void uploadFileToGcs(String bucketName, String blobName, File file) throws IOException {
        // Google Cloud Storage 인증
        String credentialsPath = "C:/Users/smhrd1/Desktop/api_key4.json"; // 여기에 서비스 계정 키 파일 경로를 설정
        FileInputStream serviceAccountStream = new FileInputStream(credentialsPath);
        GoogleCredentials credentials = GoogleCredentials.fromStream(serviceAccountStream);
        Storage storage = StorageOptions.newBuilder().setCredentials(credentials).build().getService();
        
        BlobId blobId = BlobId.of(bucketName, blobName);
        BlobInfo blobInfo = BlobInfo.newBuilder(blobId).build();
        try {
            storage.create(blobInfo, java.nio.file.Files.readAllBytes(file.toPath()));
            System.out.println("File " + file.getName() + " uploaded to bucket " + bucketName + " as " + blobName);
        } catch (IOException e) {
            System.err.println("Failed to upload file to GCS: " + e.getMessage());
            throw e; // 예외를 다시 던져 호출자에게 알림
        }
    }
}
