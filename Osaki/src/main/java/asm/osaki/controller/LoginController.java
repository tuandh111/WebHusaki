package asm.osaki.controller;

import asm.osaki.Rest.RestFB;
import asm.osaki.Rest.RestGG;
import asm.osaki.constants.Constants;
import asm.osaki.user.UserGoogleDto;
import com.google.gson.Gson;
import com.restfb.json.JsonObject;
import com.restfb.types.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.SneakyThrows;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
@RequestMapping("login")
public class LoginController {
    int anInt = 0;

    @SneakyThrows
    @GetMapping()
    public String login(HttpServletRequest request, HttpSession session) {
        String code = request.getParameter("code");

        //Login Facebook
//        if (code != null) {
//            String accessToken = RestFB.getToken(code);
//            User user = RestFB.getUserInfo(accessToken);
//            request.setAttribute("u", user);
//            session.setAttribute("loggedInUser", user);
//            return "redirect:/login/index";
//        }
        //Login Google
		if (code != null) {
			String accessToken = RestGG.getToken(code);
			UserGoogleDto user =  RestGG.getUserInfo(accessToken);
			session.setAttribute("loggedInUser", user);
			return "redirect:/login/index";
		}
        return "login";
    }

    @GetMapping("index")
    public String index(Model model, HttpServletRequest request, HttpSession session) {
        //Login Facebook
        //User loggedInUser = (User) session.getAttribute("loggedInUser");
        //Login Google
        UserGoogleDto loggedInUser = (UserGoogleDto) session.getAttribute("loggedInUser");
        System.out.println("loggedInUser" + loggedInUser);
        if (loggedInUser != null) {
            model.addAttribute("u", loggedInUser);
            return "index";
        }

        String code = request.getParameter("code");
        if (code != null) {
            String accessToken = null;
            try {
                accessToken = RestGG.getToken(code);
                UserGoogleDto user =  RestGG.getUserInfo(accessToken);
                model.addAttribute("user", user);
                session.setAttribute("loggedInUser", user);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

            return "redirect:/login/index";
        }

        return "index";
    }

//    public static String getToken(String code) throws IOException {
//        // call api to get token
//        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN).bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID).add("client_secret", Constants.GOOGLE_CLIENT_SECRET).add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code).add("grant_type", Constants.GOOGLE_GRANT_TYPE).build()).execute().returnContent().asString();
//
//        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
//        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
//        return accessToken;
//    }
//
//    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
//        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
//        String response = Request.Get(link).execute().returnContent().asString();
//
//        UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);
//
//        return googlePojo;
//    }


}
