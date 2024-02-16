package asm.osaki.service;

import asm.osaki.repositories.product_repositories.BrandRepository;
import asm.osaki.repositories.product_repositories.CategoryRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.print.attribute.standard.PrinterMoreInfoManufacturer;
@Service
public class GlobalInterceptor implements HandlerInterceptor {

    @Autowired
    CategoryRepository categoryRepository;


    @Autowired
    SessionService sessionService;
    @Autowired
    BrandRepository brandRepository;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mv) throws Exception {
        req.setAttribute("listCategories", categoryRepository.findAll());
        req.setAttribute("listBrands",brandRepository.findAll());
        System.out.println("run susseccfully postHandle");
    }
}
