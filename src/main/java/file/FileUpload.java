package file;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {

    // 업로드 처리 (MultipartRequest 생성 + 업로드 폴더 준비)
    public static MultipartRequest upload(HttpServletRequest request,
                                          String folder,
                                          int sizeLimit) throws IOException {

        String uploadPath = request.getServletContext().getRealPath(folder);

        File dir = new File(uploadPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        return new MultipartRequest(
                request,
                uploadPath,
                sizeLimit,
                "UTF-8",
                new DefaultFileRenamePolicy()
        );
    }

    // 파일 삭제
    public static void deleteFile(HttpServletRequest request,
                                  String folder,
                                  String fileName) {

        if (fileName == null || fileName.trim().isEmpty()) return;

        String uploadPath = request.getServletContext().getRealPath(folder);
        File f = new File(uploadPath, fileName);

        if (f.exists()) {
            f.delete();
        }
    }
}