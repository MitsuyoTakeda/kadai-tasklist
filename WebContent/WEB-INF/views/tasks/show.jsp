<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/app.jsp" >
    <c:param name="content">
        <c:choose>
            <c:when test="${tasks != null}">
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
                                <fmt:formatDate value="${tasks.created_at }" pattern="yyyy/MM/dd hh:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td>
                                <fmt:formatDate value="${tasks.update_at }" pattern="yyyy/MM/dd hh:mm:ss"/>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div id="change_page">
                    <a href="${pageContext.request.contextPath}/edit?id=${tasks.id }">編集</a>&nbsp&nbsp&nbsp&nbsp&nbsp
                    <a href="${pageContext.request.contextPath}/index">一覧に戻る</a>
                </div>
            </c:when>
            <c:otherwise>
                お探しのデータは見つかりませんでした。
            </c:otherwise>
        </c:choose>
   </c:param>
</c:import>