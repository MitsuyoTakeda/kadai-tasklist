<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null }">
            <div id ="flush_success">
                <c:out value="${flush }" />
            </div>
        </c:if>
        <h2>タスク一覧</h2>
        <p id="new">
            <a href = "${pageContext.request.contextPath }/new">新規投稿</a>
        </p>

        <div id = "pagenation">
            <c:forEach var = "i" begin = "1" end ="${((tasks_count - 1) / 10) +1 }" step = "1">
                <c:choose>
                    <c:when test="${i == page }">
                        <c:out value="${i }" />
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath }/index?page=${i}"><c:out value="${i }" /></a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <table>
            <tbody>
                <tr>
                    <th>No.</th>
                    <th>タスク内容</th>
                    <th>登録日時</th>
                </tr>

                <c:forEach var="tasks" items="${tasks }">
                    <tr>
                        <td id="column_width">
                            <a href = "${pageContext.request.contextPath }/show?id=${tasks.id}">
                                <c:out value="${tasks.id }" />
                            </a>
                        </td>
                        <td id="taskContent">
                            <c:out value="${tasks.content }" />
                        </td>
                        <td id="column_width">
                            <fmt:formatDate value="${tasks.created_at }" pattern="yyyy/MM/dd"/>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:param>
</c:import>