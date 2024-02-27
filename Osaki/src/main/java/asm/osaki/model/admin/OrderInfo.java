package asm.osaki.model.admin;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import asm.osaki.entities.product.Product;
import asm.osaki.entities.product.image_product.ImageProduct;
import asm.osaki.entities.user.Address;
import asm.osaki.entities.user.Invoice;
import asm.osaki.entities.user.UserCustom;
import lombok.Data;

@Data
public class OrderInfo {
	private String imageProduct;
	private String nameProduct;
	private String nameCustomer;
	private String addressCustomer;
	private String phoneCustomer;
	private String invoiceID;
	private double totalAmount;
	private String status;
	
	
	public static List<OrderInfo> convert(List<Object[]> list){
		List<OrderInfo> finalList = new ArrayList<OrderInfo>();
		for (Object[] o : list) {
			OrderInfo orderInfo = new OrderInfo();
			Product product = (Product) o[0];
			List<ImageProduct> productImages = product.getProductImages();
			
			UserCustom userCustom = (UserCustom) o[1];
			Invoice invoice = (Invoice) o[2];
			Address address = (Address) o[3];
			if(productImages.isEmpty()) {
				orderInfo.setImageProduct(null);
			}else {
				orderInfo.setImageProduct(productImages.get(0).getImageName());
			}
			
			orderInfo.setNameProduct(product.getName());
			orderInfo.setNameCustomer(userCustom.getFullName());
			orderInfo.setAddressCustomer(address.getAddress());
			orderInfo.setPhoneCustomer(address.getPhoneID());
			orderInfo.setInvoiceID(invoice.getInvoiceID());
			orderInfo.setTotalAmount(invoice.getTotalAmount());
			orderInfo.setStatus(invoice.getStatus());
			finalList.add(orderInfo);
		}
		return finalList;
	}
}
