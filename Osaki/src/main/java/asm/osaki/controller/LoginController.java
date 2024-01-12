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
            UserGoogleDto user = RestGG.getUserInfo(accessToken);
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
                UserGoogleDto user = RestGG.getUserInfo(accessToken);
                model.addAttribute("user", user);
                session.setAttribute("loggedInUser", user);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            return "redirect:/login/index";
        }
        return "index";
    }

}
