package file;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

public class FileUpload {

    public static String upload(HttpServletRequest request, String folder) throws Exception {

        String uploadPath = request.getServletContext().getRealPath(folder);
        int sizeLimit = 15 * 1024 * 1024;

        File dir = new File(uploadPath);
        if (!dir.exists()) dir.mkdirs();

        MultipartRequest multi = new MultipartRequest(
                request,
                uploadPath,
                sizeLimit,
                "UTF-8",
                new DefaultFileRenamePolicy()
        );

        // 파일 업로드 input name="photo"
        return multi.getFilesystemName("photo");
    }

    public static void delete(HttpServletRequest request, String folder, String fileName) {
        if (fileName == null || fileName.trim().equals("")) return;

        String uploadPath = request.getServletContext().getRealPath(folder);
        File file = new File(uploadPath, fileName);

        if (file.exists()) {
            file.delete();
        }
    }
}