<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<span class="me-2">135 items ${totalElement}</span>
<button class="me-2">First</button>
<button class="me-2">Prev</button>
<input class="me-2" name="currentPage" value="${currentPage}" placeholder="1" style="max-width: 10%;">
<span class="me-2">of 5 ${totalPage}</span>
<button class="me-2">Next</button>
<button class="me-2">Last</button>