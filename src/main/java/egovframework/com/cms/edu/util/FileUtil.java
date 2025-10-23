package egovframework.com.cms.edu.util;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Component
public class FileUtil {
    
    // 파일 저장 기본 경로
    // Windows: C:/uploads/edu/
    // Linux: /var/www/uploads/edu/
    private static final String UPLOAD_DIR = "C:/uploads/edu/";
    /**
     * 파일을 서버에 저장하고 저장된 파일 경로를 반환
     * @param file 업로드된 파일
     * @return 저장된 파일의 경로
     * @throws IOException 파일 저장 실패 시
     */
    public String saveFile(MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) {
            return null;
        }
        
        // 업로드 디렉토리 생성 (없으면)
        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        
        // 날짜별 폴더 생성 (예: 2025/01/15)
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String datePath = sdf.format(new Date());
        File dateDir = new File(UPLOAD_DIR + datePath);
        if (!dateDir.exists()) {
            dateDir.mkdirs();
        }
        
        // 고유 파일명 생성 (UUID + 원본 파일명)
        String originalFilename = file.getOriginalFilename();
        String extension = "";
        if (originalFilename != null && originalFilename.contains(".")) {
            extension = originalFilename.substring(originalFilename.lastIndexOf("."));
        }
        
        String uniqueFilename = UUID.randomUUID().toString() + extension;
        String filePath = datePath + "/" + uniqueFilename;
        
        // 파일 저장
        File destFile = new File(UPLOAD_DIR + filePath);
        file.transferTo(destFile);
        
        return filePath;
    }
    
    /**
     * 파일 삭제
     * @param filePath 삭제할 파일 경로
     * @return 삭제 성공 여부
     */
    public boolean deleteFile(String filePath) {
        if (filePath == null || filePath.trim().isEmpty()) {
            return false;
        }
        
        try {
            File file = new File(UPLOAD_DIR + filePath);
            if (file.exists()) {
                return file.delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    /**
     * 파일의 전체 경로 반환
     * @param filePath 상대 경로
     * @return 절대 경로
     */
    public String getFullPath(String filePath) {
        if (filePath == null || filePath.trim().isEmpty()) {
            return null;
        }
        return UPLOAD_DIR + filePath;
    }
    
    /**
     * 파일 크기를 사람이 읽기 쉬운 형태로 변환
     * @param size 파일 크기(byte)
     * @return 포맷팅된 파일 크기 (예: 1.5 MB)
     */
    public static String formatFileSize(Long size) {
        if (size == null || size == 0) {
            return "0 B";
        }
        
        final String[] units = {"B", "KB", "MB", "GB", "TB"};
        int digitGroups = (int) (Math.log10(size) / Math.log10(1024));
        
        return String.format("%.1f %s", 
            size / Math.pow(1024, digitGroups), 
            units[digitGroups]);
    }
}

