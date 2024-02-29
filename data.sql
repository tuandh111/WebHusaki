
go
use hasagi
go
--insert role
INSERT INTO role(role_name, is_delete)VALUES ('user', 0);
INSERT INTO role( role_name, is_delete)VALUES ('admin', 0);
-- insert user
Insert into user_custom(email,facebookid, full_name, googleid,is_delete, password,verify_code, image,role) 
values('hoangtuan97531@gmail.com',null,N'hoang tuan',null,0,'$2a$10$QlgKfm6IGC7M.fPe2o/LrOHeNtxtoGPcl4vgnKm8l8oAATiTAvFwG','dsfsdfs',null,1);
Insert into user_custom(email,facebookid, full_name, googleid,is_delete, password,verify_code, image,role) 
values('tuandhpc05076@gmail.com',null,N'hoang tuan',null,0,'$2a$10$QlgKfm6IGC7M.fPe2o/LrOHeNtxtoGPcl4vgnKm8l8oAATiTAvFwG','dsfsdfs',null,2);
Insert into user_custom(email,facebookid, full_name, googleid,is_delete, password,verify_code, image,role) 
values('hoangtuan@gmail.com',null,N'hoang tuan',null,0,'$2a$10$QlgKfm6IGC7M.fPe2o/LrOHeNtxtoGPcl4vgnKm8l8oAATiTAvFwG','dsfsdfs',null,1);
Insert into user_custom(email,facebookid, full_name, googleid,is_delete, password,verify_code, image,role) 
values('hoangtuan1@gmail.com',null,N'hoang tuan',null,0,'$2a$10$QlgKfm6IGC7M.fPe2o/LrOHeNtxtoGPcl4vgnKm8l8oAATiTAvFwG','dsfsdfs',null,1);
select * from user_custom
--address
Insert into user_address(phoneid,address,is_delete,user_infor) values('0939132511',N'Ấp khánh hội, thị trấn Ngã sáu, Châu Thành Hậu Giang',0,1);
Insert into user_address(phoneid,address,is_delete,user_infor) values('0939132512',N'Ấp khánh hội, thị trấn Ngã sáu, Châu Thành Hậu Giang',0,2);
Insert into user_address(phoneid,address,is_delete,user_infor) values('0939132513',N'Ấp khánh hội, thị trấn Ngã sáu, Châu Thành Hậu Giang',0,3);
Insert into user_address(phoneid,address,is_delete,user_infor) values('0939132514',N'Ấp khánh hội, thị trấn Ngã sáu, Châu Thành Hậu Giang',0,4);
--voucher
INSERT INTO voucher (discount, create_at, delete_at, is_delete, vouchers)vALUES ('0.1', GETDATE(), NULL, 0, 1);
INSERT INTO voucher (discount, create_at, delete_at, is_delete, vouchers)vALUES ('0.2', GETDATE(), NULL, 0, 2);
INSERT INTO voucher (discount, create_at, delete_at, is_delete, vouchers)vALUES ('0.3', GETDATE(), NULL, 0, 1);
INSERT INTO voucher (discount, create_at, delete_at, is_delete, vouchers)vALUES ('0.1', GETDATE(), NULL, 0, 3);
INSERT INTO voucher (discount, create_at, delete_at, is_delete, vouchers)vALUES ('0.2', GETDATE(), NULL, 0, 1);
--category
INSERT INTO category ( category_name,create_at,delete_at,is_delete) values (N'Sữa rửa mặt 1',GETDATE(),null,0);
INSERT INTO category ( category_name,create_at,delete_at,is_delete) values (N'Kem trang điểm 1',GETDATE(),null,0);
INSERT INTO category ( category_name,create_at,delete_at,is_delete) values (N'Son 1',GETDATE(),null,0);
INSERT INTO category ( category_name,create_at,delete_at,is_delete) values (N'Phấn 1',GETDATE(),null,0);
INSERT INTO category ( category_name,create_at,delete_at,is_delete) values (N'Sữa rửa mặt 2',GETDATE(),null,0);
INSERT INTO category ( category_name,create_at,delete_at,is_delete) values (N'Kem trang điểm 2',GETDATE(),null,0);
INSERT INTO category ( category_name,create_at,delete_at,is_delete) values (N'Son 2',GETDATE(),null,0);
INSERT INTO category ( category_name,create_at,delete_at,is_delete) values (N'Phấn 2',GETDATE(),null,0);
INSERT INTO category ( category_name,create_at,delete_at,is_delete) values (N'Sữa rửa mặt 3',GETDATE(),null,0);
INSERT INTO category ( category_name,create_at,delete_at,is_delete) values (N'Kem trang điểm 3',GETDATE(),null,0);
INSERT INTO category ( category_name,create_at,delete_at,is_delete) values (N'Son 3',GETDATE(),null,0);
INSERT INTO category ( category_name,create_at,delete_at,is_delete) values (N'Phấn 3',GETDATE(),null,0);
INSERT INTO category ( category_name,create_at,delete_at,is_delete) values (N'Sữa rửa mặt 4',GETDATE(),null,0);
INSERT INTO category ( category_name,create_at,delete_at,is_delete) values (N'Kem trang điểm 4',GETDATE(),null,0);
INSERT INTO category ( category_name,create_at,delete_at,is_delete) values (N'Son 4',GETDATE(),null,0);
INSERT INTO category ( category_name,create_at,delete_at,is_delete) values (N'Phấn 4',GETDATE(),null,0);
--brand
INSERT INTO brand (brand_name,brand_origin,create_at,delete_at,is_delete) values(N'Neutrogena',N'Việt Nam',GETDATE(),null,0);
INSERT INTO brand (brand_name,brand_origin,create_at,delete_at,is_delete) values(N'Neutrogena1',N'Việt Nam',GETDATE(),null,0);
INSERT INTO brand (brand_name,brand_origin,create_at,delete_at,is_delete) values(N'Neutrogena2',N'Việt Nam',GETDATE(),null,0);
INSERT INTO brand (brand_name,brand_origin,create_at,delete_at,is_delete) values(N'Neutrogena3',N'Việt Nam',GETDATE(),null,0);
--cosmetic-form
insert into cosmetic_form(cosmetic_form_name, create_at, delete_at,is_delete) values(N'Thương hiệu 1',GETDATE(),null, 0);
insert into cosmetic_form(cosmetic_form_name, create_at, delete_at,is_delete) values(N'Thương hiệu 2',GETDATE(),null, 0);
insert into cosmetic_form(cosmetic_form_name, create_at, delete_at,is_delete) values(N'Thương hiệu 3',GETDATE(),null, 0);
--product
insert into product values (GETDATE(),null,GETDATE(),null,N'mô tả',null,N'Nguyên liệu tự nhiên',0,N'Việt Nam',N'Sửa rửa mặt',N'Khô ráo thoáng mát',200000,100,null,N'Các hoạt chất trong sữa rửa mặt sẽ len lỏi vào sâu lỗ chân lông để cuốn đi các lớp bụi bẩn, bã nhờn, dầu thừa, vi khuẩn và mồ hôi, giúp da được làm sạch và thông thoáng hơn.',1,1,1,1)
insert into product values (GETDATE(),null,GETDATE(),null,N'mô tả1',null,N'Nguyên liệu tự nhiên1',0,N'Việt Nam',N'Sửa rửa mặt1',N'Khô ráo thoáng mát1',300000,100,null,N'Các hoạt chất trong sữa rửa mặt sẽ len lỏi vào sâu lỗ chân lông để cuốn đi các lớp bụi bẩn, bã nhờn, dầu thừa, vi khuẩn và mồ hôi, giúp da được làm sạch và thông thoáng hơn.',1,2,1,1)
insert into product values (GETDATE(),null,GETDATE(),null,N'mô tả2',null,N'Nguyên liệu tự nhiên2',0,N'Việt Nam',N'Sửa rửa mặt2',N'Khô ráo thoáng mát2',500000,100,null,N'Các hoạt chất trong sữa rửa mặt sẽ len lỏi vào sâu lỗ chân lông để cuốn đi các lớp bụi bẩn, bã nhờn, dầu thừa, vi khuẩn và mồ hôi, giúp da được làm sạch và thông thoáng hơn.',1,1,2,1)
insert into product values (GETDATE(),null,GETDATE(),null,N'mô tả3',null,N'Nguyên liệu tự nhiên3',0,N'Việt Nam',N'Sửa rửa mặt3',N'Khô ráo thoáng mát3',700000,100,null,N'Các hoạt chất trong sữa rửa mặt sẽ len lỏi vào sâu lỗ chân lông để cuốn đi các lớp bụi bẩn, bã nhờn, dầu thừa, vi khuẩn và mồ hôi, giúp da được làm sạch và thông thoáng hơn.',1,3,1,1)
insert into product values (GETDATE(),null,GETDATE(),null,N'mô tả',null,N'Nguyên liệu tự nhiên',0,N'Việt Nam',N'Sửa rửa mặt4',N'Khô ráo thoáng mát',200000,100,null,N'Các hoạt chất trong sữa rửa mặt sẽ len lỏi vào sâu lỗ chân lông để cuốn đi các lớp bụi bẩn, bã nhờn, dầu thừa, vi khuẩn và mồ hôi, giúp da được làm sạch và thông thoáng hơn.',1,1,1,1)
insert into product values (GETDATE(),null,GETDATE(),null,N'mô tả1',null,N'Nguyên liệu tự nhiên1',0,N'Việt Nam',N'Sửa rửa mặt5',N'Khô ráo thoáng mát1',300000,100,null,N'Các hoạt chất trong sữa rửa mặt sẽ len lỏi vào sâu lỗ chân lông để cuốn đi các lớp bụi bẩn, bã nhờn, dầu thừa, vi khuẩn và mồ hôi, giúp da được làm sạch và thông thoáng hơn.',1,2,1,1)
insert into product values (GETDATE(),null,GETDATE(),null,N'mô tả2',null,N'Nguyên liệu tự nhiên2',0,N'Việt Nam',N'Sửa rửa mặt6',N'Khô ráo thoáng mát2',500000,100,null,N'Các hoạt chất trong sữa rửa mặt sẽ len lỏi vào sâu lỗ chân lông để cuốn đi các lớp bụi bẩn, bã nhờn, dầu thừa, vi khuẩn và mồ hôi, giúp da được làm sạch và thông thoáng hơn.',1,1,2,1)
insert into product values (GETDATE(),null,GETDATE(),null,N'mô tả3',null,N'Nguyên liệu tự nhiên3',0,N'Việt Nam',N'Sửa rửa mặt7',N'Khô ráo thoáng mát3',700000,100,null,N'Các hoạt chất trong sữa rửa mặt sẽ len lỏi vào sâu lỗ chân lông để cuốn đi các lớp bụi bẩn, bã nhờn, dầu thừa, vi khuẩn và mồ hôi, giúp da được làm sạch và thông thoáng hơn.',1,3,1,1)
insert into product values (GETDATE(),null,GETDATE(),null,N'mô tả',null,N'Nguyên liệu tự nhiên',0,N'Việt Nam',N'Sửa rửa mặt8',N'Khô ráo thoáng mát',200000,100,null,N'Các hoạt chất trong sữa rửa mặt sẽ len lỏi vào sâu lỗ chân lông để cuốn đi các lớp bụi bẩn, bã nhờn, dầu thừa, vi khuẩn và mồ hôi, giúp da được làm sạch và thông thoáng hơn.',1,1,1,1)
insert into product values (GETDATE(),null,GETDATE(),null,N'mô tả1',null,N'Nguyên liệu tự nhiên1',0,N'Việt Nam',N'Sửa rửa mặt9',N'Khô ráo thoáng mát1',300000,100,null,N'Các hoạt chất trong sữa rửa mặt sẽ len lỏi vào sâu lỗ chân lông để cuốn đi các lớp bụi bẩn, bã nhờn, dầu thừa, vi khuẩn và mồ hôi, giúp da được làm sạch và thông thoáng hơn.',1,2,1,1)
insert into product values (GETDATE(),null,GETDATE(),null,N'mô tả2',null,N'Nguyên liệu tự nhiên2',0,N'Việt Nam',N'Sửa rửa mặt10',N'Khô ráo thoáng mát2',500000,100,null,N'Các hoạt chất trong sữa rửa mặt sẽ len lỏi vào sâu lỗ chân lông để cuốn đi các lớp bụi bẩn, bã nhờn, dầu thừa, vi khuẩn và mồ hôi, giúp da được làm sạch và thông thoáng hơn.',1,1,2,1)
insert into product values (GETDATE(),null,GETDATE(),null,N'mô tả3',null,N'Nguyên liệu tự nhiên3',0,N'Việt Nam',N'Sửa rửa mặt11',N'Khô ráo thoáng mát3',700000,100,null,N'Các hoạt chất trong sữa rửa mặt sẽ len lỏi vào sâu lỗ chân lông để cuốn đi các lớp bụi bẩn, bã nhờn, dầu thừa, vi khuẩn và mồ hôi, giúp da được làm sạch và thông thoáng hơn.',1,3,1,1)
insert into product values (GETDATE(),null,GETDATE(),null,N'mô tả',null,N'Nguyên liệu tự nhiên',0,N'Việt Nam',N'Sửa rửa mặt12',N'Khô ráo thoáng mát',200000,100,null,N'Các hoạt chất trong sữa rửa mặt sẽ len lỏi vào sâu lỗ chân lông để cuốn đi các lớp bụi bẩn, bã nhờn, dầu thừa, vi khuẩn và mồ hôi, giúp da được làm sạch và thông thoáng hơn.',1,1,1,1)
insert into product values (GETDATE(),null,GETDATE(),null,N'mô tả1',null,N'Nguyên liệu tự nhiên1',0,N'Việt Nam',N'Sửa rửa mặt13',N'Khô ráo thoáng mát1',300000,100,null,N'Các hoạt chất trong sữa rửa mặt sẽ len lỏi vào sâu lỗ chân lông để cuốn đi các lớp bụi bẩn, bã nhờn, dầu thừa, vi khuẩn và mồ hôi, giúp da được làm sạch và thông thoáng hơn.',1,2,1,1)
insert into product values (GETDATE(),null,GETDATE(),null,N'mô tả2',null,N'Nguyên liệu tự nhiên2',0,N'Việt Nam',N'Sửa rửa mặt14',N'Khô ráo thoáng mát2',500000,100,null,N'Các hoạt chất trong sữa rửa mặt sẽ len lỏi vào sâu lỗ chân lông để cuốn đi các lớp bụi bẩn, bã nhờn, dầu thừa, vi khuẩn và mồ hôi, giúp da được làm sạch và thông thoáng hơn.',1,1,2,1)
insert into product values (GETDATE(),null,GETDATE(),null,N'mô tả3',null,N'Nguyên liệu tự nhiên3',0,N'Việt Nam',N'Sửa rửa mặt15',N'Khô ráo thoáng mát3',700000,100,null,N'Các hoạt chất trong sữa rửa mặt sẽ len lỏi vào sâu lỗ chân lông để cuốn đi các lớp bụi bẩn, bã nhờn, dầu thừa, vi khuẩn và mồ hôi, giúp da được làm sạch và thông thoáng hơn.',1,3,1,1)
select * from user_custom
--image_product
insert into image_product values (GETDATE(), null,'product1.jpg',0,1)
insert into image_product values (GETDATE(), null,'product2.jpg',0,2)
insert into image_product values (GETDATE(), null,'product3.jpg',0,3)
insert into image_product values (GETDATE(), null,'product4.jpg',0,4)
insert into image_product values (GETDATE(), null,'product5.jpg',0,5)
insert into image_product values (GETDATE(), null,'product6.jpg',0,6)
insert into image_product values (GETDATE(), null,'product1.jpg',0,7)
insert into image_product values (GETDATE(), null,'product2.jpg',0,8)
insert into image_product values (GETDATE(), null,'product3.jpg',0,9)
insert into image_product values (GETDATE(), null,'product4.jpg',0,10)
insert into image_product values (GETDATE(), null,'product5.jpg',0,11)
insert into image_product values (GETDATE(), null,'product6.jpg',0,12)
insert into image_product values (GETDATE(), null,'product1.jpg',0,13)
--net_weight
insert into net_weight values(GETDATE(),null,0,1)
insert into net_weight values(GETDATE(),null,0,2)
insert into net_weight values(GETDATE(),null,0,1)
insert into net_weight values(GETDATE(),null,0,2)
insert into net_weight values(GETDATE(),null,0,1)
--comment
insert into comment values (N'sản phẩm tuyệt vời',GETDATE(),null,0,5,2,1)
insert into comment values (N'sản phẩm tuyệt vời1',GETDATE(),null,0,5,1,1)
insert into comment values (N'sản phẩm tuyệt vời2',GETDATE(),null,0,5,2,2)
insert into comment values (N'sản phẩm tuyệt vời3',GETDATE(),null,0,5,2,1)
insert into comment values (N'sản phẩm tuyệt vờ4',GETDATE(),null,0,5,1,2)
insert into comment values (N'sản phẩm tuyệt vời5',GETDATE(),null,0,5,2,1)
--img_comment
insert into image_comment_entity values (GETDATE(),null,'hinh anh 1',0,1)
insert into image_comment_entity values (GETDATE(),null,'hinh anh 2',0,2)
insert into image_comment_entity values (GETDATE(),null,'hinh anh 3',0,3)
insert into image_comment_entity values (GETDATE(),null,'hinh anh 4',0,2)
insert into image_comment_entity values (GETDATE(),null,'hinh anh 5',0,1)
--wish_list 
insert into wish_list_entity values (GETDATE(), null, 0, 1,1)
insert into wish_list_entity values (GETDATE(), null, 0, 2,1)
insert into wish_list_entity values (GETDATE(), null, 0, 2,1)
insert into wish_list_entity values (GETDATE(), null, 0, 1,1)
insert into wish_list_entity values (GETDATE(), null, 0, 1,1)
--flashsale
insert into flash_sale values ('2024/12/12',0,'2024/01/01',1)
insert into flash_sale values ('2024/12/12',1,'2024/01/01',1)
insert into flash_sale values ('2024/12/12',1,'2024/01/01',1)
insert into flash_sale values ('2024/12/12',1,'2024/01/01',1)

-- Procomtional_detail
insert into promotional_details values(100000,0,1,1)
insert into promotional_details values(120000,0,1,2)
insert into promotional_details values(130000,0,1,3)
insert into promotional_details values(123000,0,1,4)
insert into promotional_details values(125000,0,1,5)
--invoice
insert into invoice values (1,null, null ,0 ,N'Mô tả','false',10000,1)
insert into invoice values (2,null, null ,0 ,N'Mô tả','false',10000,1)
insert into invoice values (3,null, null ,0 ,N'Mô tả','false',10000,1)
insert into invoice values (4,null, null ,0 ,N'Mô tả','false',10000,1)
--invoiceDetail
insert into invoice_detail values (null, null,0,90000,10,1,1)
insert into invoice_detail values (null, null,0,90000,10,1,1)
insert into invoice_detail values (null, null,0,90000,10,1,1)
insert into invoice_detail values (null, null,0,90000,10,2,1)
insert into invoice_detail values (null, null,0,90000,10,2,1)


