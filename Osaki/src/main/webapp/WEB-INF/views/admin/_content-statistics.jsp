<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="/WEB-INF/views/admin/__topbar.jsp" %>

<div class="row p-5">
    <ul class="nav nav-pills mb-3" id="statistics" role="tablist">
		  <li class="nav-item" role="presentation">
		    <button class="nav-link active" id="statistics-by-product" data-bs-toggle="pill" data-bs-target="#statistics-product" type="button" role="tab" aria-controls="statistics-product" aria-selected="true">Doanh thu theo sản phẩm</button>
		  </li>
		  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="statistics-by-month" data-bs-toggle="pill" data-bs-target="#statistics-month" type="button" role="tab" aria-controls="statistics-month" aria-selected="false">Doanh thu theo tháng</button>
		  </li>
		  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="statistics-by-beetween" data-bs-toggle="pill" data-bs-target="#statistics-between" type="button" role="tab" aria-controls="statistics-between" aria-selected="false">Doanh thu theo khoảng thời gian</button>
		  </li>
    </ul>
	<div class="tab-content" id="pills-tabContent">
	  <div class="tab-pane fade show active" id="statistics-product" role="tabpanel" aria-labelledby="statistics-product-tab">
	       <canvas id="myChartStatisticsByProduct"></canvas>	  
	  </div>
	  <div class="tab-pane fade" id="statistics-month" role="tabpanel" aria-labelledby="statistics-month-tab">
	       <canvas id="myChartStatisticsByMonth"></canvas>
	  </div>
	  <div class="tab-pane fade" id="statistics-between" role="tabpanel" aria-labelledby="statistics-between-tab">
          <canvas id="myChartStatisticsBetween"></canvas>
          Chức năng đang được cập nhật
	  </div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" src="/js/admin-statistics.js"></script>
<script>
	var dataRevenueByMonth = ${dataRevenueByMonth};
	console.log(dataRevenueByMonth);
	var dataRevenueByProduct = ${dataRevenueByProduct};
	console.log(dataRevenueByProduct);
</script>

