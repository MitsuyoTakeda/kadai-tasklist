<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<h2>タスク一覧</h2>
    <table>
        <tbody>
            <tr>
                <th>No.</th>
                <th>タスク内容</th>
                <th>登録日時</th>
            </tr>

            <c:forEach var="task" items="${task }">
                <tr>
                    <td>
                        <c:out value="${task.id }" />
                    </td>
                    <td>
                        <c:out value="${task.content }" />
                    </td>
                    <td>
                        <c:out value="${task.created_at }" />
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div id = "pagenation">
        <c:forEach var = "i" begin = "1" end ="${((task_count - 1) / 10) +1 }" step = "1">
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

