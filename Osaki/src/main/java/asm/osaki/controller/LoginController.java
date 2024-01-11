package asm.osaki.controller;

import asm.osaki.constants.Constants;
import asm.osaki.user.UserGoogleDto;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.SneakyThrows;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.net.http.HttpRequest;

@Controller
@RequestMapping("login")
public class LoginController {

	@SneakyThrows
	@GetMapping
	public String login(HttpServletRequest request, HttpSession session) {
		String code = request.getParameter("code");
		if (code != null) {
			String accessToken = getToken(code);
			UserGoogleDto user = getUserInfo(accessToken);
			// Lưu user vào session
			session.setAttribute("loggedInUser", user);
			return "redirect:/login/index";
		}
		return "login";
	}
	@GetMapping("index")
	public String index(Model model, HttpServletRequest request, HttpSession session) {
		// Kiểm tra xem có user trong session không
		UserGoogleDto loggedInUser = (UserGoogleDto) session.getAttribute("loggedInUser");
		System.out.println("loggedInUser"+ loggedInUser);
		if (loggedInUser != null) {
			// Hiển thị thông tin user trên trang index
			model.addAttribute("u", loggedInUser);
			return "index";
		}

		String code = request.getParameter("code");
		if (code != null) {
			String accessToken = null;
			try {
				accessToken = getToken(code);
				UserGoogleDto user = getUserInfo(accessToken);
				model.addAttribute("user", user);
				// Lưu user vào session
				session.setAttribute("loggedInUser", user);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}

			return "redirect:/login/index";
		}

		return "index";
	}

	public static String getToken(String code) throws  IOException {
		// call api to get token
		String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
								  .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
													.add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
													.add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
													.add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
								  .execute().returnContent().asString();

		JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
		String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
		return accessToken;
	}
	public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
		String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
		String response = Request.Get(link).execute().returnContent().asString();

		UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);

		return googlePojo;
	}
}
