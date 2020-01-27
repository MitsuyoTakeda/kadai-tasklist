<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/app.jsp" >
    <c:param name="content">
        <table>
            <tbody>
                <tr>
                    <th>No.</th>
                    <td>
                        <c:out value="${tasks.id }" />
                    </td>
                </tr>
                <tr>
                    <th>タスク内容</th>
                    <td>
                        <c:out value="${tasks.content }" />
                    </td>
                </tr>
                <tr>
                    <th>作成日時</th>
                    <td>
                        <fmt:formatDate value="${tasks.created_at }" pattern="yyyy-MM-dd hh:mm:ss" />
                    </td>
                </tr>
                <tr>
                    <th>更新日時</th>
                    <td>
                        <fmt:formatDate value="${tasks.update_at }" pattern="yyyy-MM-dd hh:mm:ss"/>
                    </td>
                </tr>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/edit?id=${tasks.id }">このタスクを編集</a>
        <a href="${pageContext.request.contextPath}/index">一覧に戻る</a>
   </c:param>
</c:import>