<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<input class="form-control me-2" value="135 items ${totalElement}" style="max-width: 10%;background-color: #b7a888;" disabled="disabled">
<button class="btn btn-outline-secondary me-2">First</button>
<button class="btn btn-outline-secondary me-2">Prev</button>
<input class="form-control" name="currentPage" value="${currentPage}" placeholder="1" style="max-width: 5%;background-color: #b7a888;">
<input class="form-control me-2" value="of ${totalPage}" style="max-width: 5%; background-color: #b7a888;" disabled="disabled">
<button class="btn btn-outline-secondary me-2">Next</button>
<button class="btn btn-outline-secondary me-2">Last</button>


           