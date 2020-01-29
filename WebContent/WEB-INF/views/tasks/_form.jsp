<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${error != null }">
    <div id="flush_error">
        <c:out value="${error }" />
    </div>
</c:if>
<table>
    <tbody>
        <tr>
            <td id="column_width">
                <label for="content">タスク内容</label>
            </td>
            <td>
                <input type="text" name="content" value="${tasks.content }" id="textwidth"/>
            </td>
            <td id="column_width">
                <input type = "hidden" name = "_token" value = "${_token }" />
                <button type = "submit">投稿</button>
            </td>
        </tr>
    </tbody>
</table>