package asm.osaki.service;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest request;

	/**
	 * Đọc chuỗi giá trị của tham số
	 * 
	 * @param name         tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public String getString(String name, String defaultValue) {
		String value = request.getParameter(name);
		return value != null ? value : defaultValue;
	}

	/**
	 * Đọc số nguyên giá trị của tham số
	 * 
	 * @param name         tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 * 
	 */
	public int getInt(String name, int defaultValue) {
		String value = getString(name, String.valueOf(defaultValue));
		return Integer.parseInt(value);
	}

	/**
	 * Đọc số thực giá trị của tham số
	 * 
	 * @param name         tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public double getDouble(String name, double defaultValue) {
		String value = getString(name, String.valueOf(defaultValue));
		return Double.parseDouble(value);
	}

	/**
	 * Đọc giá trị boolean của tham số
	 * 
	 * @param name         tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public boolean getBoolean(String name, boolean defaultValue) {
		String value = getString(name, String.valueOf(defaultValue));
		return Boolean.parseBoolean(value);
	}

	/**
	 * Đọc giá trị thời gian của tham số
	 * 
	 * @param name    tên tham số
	 * @param pattern là định dạng thời gian
	 * @return giá trị tham số hoặc null nếu không tồn tại
	 * @throws RuntimeException lỗi sai định dạng
	 */
	public Date getDate(String name, String pattern) {
		String value = getString(name, null);
		if (value == null) {
			return null;
		}

		SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
		try {
			return dateFormat.parse(value);
		} catch (ParseException e) {
			throw new RuntimeException("Lỗi sai định dạng thời gian");
		}
	}

	/**
	 * Lưu file upload vào thư mục
	 * 
	 * @param file chứa file upload từ client
	 * @param path đường dẫn tính từ webroot
	 * @return đối tượng chứa file đã lưu hoặc null nếu không có file upload
	 * @throws RuntimeException lỗi lưu file
	 */
	public File save(MultipartFile file, String path) {
	    if (!file.isEmpty()) {
	        File dir = new File(request.getServletContext().getRealPath(path));
	        if (!dir.exists()) {
	            dir.mkdirs();
	        }
	        try {
	            // Tránh tên trùng lặp bằng cách thêm timestamp vào tên tệp
	            String originalFileName = file.getOriginalFilename();
	            String fileExtension = getFileExtension(originalFileName);
	            String timestamp = String.valueOf(System.currentTimeMillis());
	            String uniqueFileName = timestamp+fileExtension;
	            File saveFile = new File(dir, uniqueFileName);

	            // Kiểm tra phần mở rộng của tệp (đảm bảo là tệp hình ảnh hợp lệ)
	            if (isValidImageExtension(fileExtension)) {
	                file.transferTo(saveFile);
	                return saveFile;
	            } else {
	                // Xử lý lỗi nếu phần mở rộng không hợp lệ
	                System.out.println("Định dạng tệp không hợp lệ");
	                return null;
	            }
	        } catch (Exception e) {
	            // Xử lý lỗi nếu có
	            System.out.println(e);
	        }
	    }
	    return null; 
	}
	
	
	//saveImgProduct
	public File saveImgProduct(MultipartFile file, String path) {
		try {
            File savePath = new File(path);
            if (!savePath.exists()) {
                savePath.mkdirs();
            }

            File savedFile = new File(savePath, file.getOriginalFilename());
            file.transferTo(savedFile);

            return savedFile;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
	};
	
	

	private String getFileExtension(String filename) {
	    int dotIndex = filename.lastIndexOf(".");
	    if (dotIndex >= 0) {
	        return filename.substring(dotIndex);
	    }
	    return "";
	}

	private boolean isValidImageExtension(String fileExtension) {
	    // Kiểm tra phần mở rộng của tệp có phải là một hình ảnh hợp lệ (vd: jpg, jpeg, png)
	    return fileExtension.equalsIgnoreCase(".jpg") ||
	           fileExtension.equalsIgnoreCase(".jpeg") ||
	           fileExtension.equalsIgnoreCase(".png");
	}

}
