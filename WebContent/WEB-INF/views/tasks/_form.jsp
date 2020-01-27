<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${error != null }">
    <div id="flush_error">
        <c:out value="${error }" />
    </div>
</c:if>

<label for = "content">タスク内容</label>
<input type = "text" name = "content" value="${tasks.content }" />

<br/><br/>


<input type = "hidden" name = "_token" value = "${_token }" />
<button type = "submit">投稿</button>