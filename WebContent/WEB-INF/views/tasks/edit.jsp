<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${tasks != null }">
                <form method="POST" action="${pageContext.request.contextPath}/update">
                    <c:import url="_form.jsp" />
                </form>

                <div id="change_page">
                    <a href="${pageContext.request.contextPath}/index">一覧に戻る</a>&nbsp&nbsp&nbsp&nbsp&nbsp
                    <a href="#" onclick="confirmDestroy();">削除</a>
                    <form method="POST" action="${pageContext.request.contextPath }/destroy">
                        <input type="hidden" name="_token" value="${_token }" />
                    </form>
                </div>

                <script>
                    function confirmDestroy(){
                        if(confirm("本当に削除してよろしいですか？")){
                            document.forms[1].submit();
                        }
                    }

                </script>
            </c:when>
            <c:otherwise>
                お探しのデータは見つかりませんでした。
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>