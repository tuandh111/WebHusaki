<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row mb-4 p-5">
    <h2>User Manager</h2>
</div>

<div class="row p-5">
    <div class="col-4">
        <h5>Add Or Edit New User</h5>
        <form action="">
          <label>Name</label>
          <input class="form-control" name="fullName">
          <br>
          <input type="file" class="form-control" name="partFile">
          <br>
          <input type="checkbox" checked="checked" name="isDelete"> 
          <label>Active ?</label>
          <br>
          <button class="btn btn-outline-primary mt-4">Add/Edit User</button>
        </form>
    </div>
    <div class="col-8">
       <div class="row justify-content-end">
           <div class="col-8 mb-3">
               <form action="" method="get">
                <div class="d-flex flex-row justify-content-end">
                    <input class="form-control me-2" name="search" style="max-width: 60%;">
                    <button class="btn btn-outline-primary" style="max-width: 40%;">Search User</button>
                </div>
             </form>
           </div>
           <div class="col-8 d-flex justify-content-end">
                 <!-- <jsp:include page="__navigation-button.jsp" /> -->                
                <input class="form-control me-2" value="135 items ${totalElement}" style="max-width: 20%;background-color: #b7a888;" disabled="disabled">
                <button class="btn btn-outline-secondary me-2">First</button>
                <button class="btn btn-outline-secondary me-2">Prev</button>
                <input class="form-control" name="currentPage" value="${currentPage}" placeholder="1" style="max-width: 10%;background-color: #b7a888;">
                <input class="form-control me-2" value="of 5 ${totalPage}" style="max-width: 10%; background-color: #b7a888;" disabled="disabled">
                <button class="btn btn-outline-secondary me-2">Next</button>
                <button class="btn btn-outline-secondary me-2">Last</button>            
           </div>            
       </div>
       <div class="row">
           <div class="table-responsive">
               <table class="table table-hover">
                   <thead>
                        <tr>
                            <th>Image</th>
                            <th>Fullname</th>
                            <th>Active</th>
                            <th>Address</th>
                            <th>Count Invoice</th>
                            <th></th> 
                        </tr>
                   </thead>
                   <tbody>   
                        <!-- Vòng lặp c:forEach -->                
                        <tr>
                            <td>
                                <img src="/images/author-item.jpg" class="img-thumbnail" alt="Ảnh đại diện" style="width: 50px;height: 50px">
                            </td>
                            <td>Nguyễn Văn A</td>
                            <td>Đang hoạt động</td>
                            <td>Cái Răng, Cần Thơ</td>
                            <td>5</td>
                            <td>
                                <a href="#">Edit</a> |
                                <a href="#" class="text-danger">Delete</a>
                            </td>
                        </tr>                  
                   </tbody>
               </table>
           </div>
       </div>   
    </div>
</div>