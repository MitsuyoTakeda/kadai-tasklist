<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <form method="POST" action="${pageContext.request.contextPath}/update">
            <c:import url="_form.jsp" />
        </form>

        <a href="${pageContext.request.contextPath}/index">一覧に戻る</a>

    </c:param>
</c:import>