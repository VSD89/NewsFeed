<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Feed</title>
</head>
<body>

<nav aria-label="Navigation for news">
    <ul class="pagination">
        <c:if test="${page.number gt 0}">
            <a href="?page=${page.number-1}&size=${page.size}">Previous</a>
        </c:if>

        <c:if test="${page.totalPages gt 0}">
            <c:forEach begin="0" end="${page.totalPages-1}" var="i">
                <c:choose>
                    <c:when test="${page.number eq i}">
                        <a><strong>${i+1}</strong><span class="sr-only"></span></a>
                    </c:when>
                    <c:otherwise>
                        <a href="?page=${i}&size=${page.size}">${i+1}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </c:if>

        <c:if test="${page.number+1 lt page.totalPages}">
            <a href="?page=${page.number+1}&size=${page.size}">Next</a>
        </c:if>
    </ul>
</nav>

<nav aria-label="News on page">
    <ul class="pagination">
        <p>Show items on page:
            <c:set var="numbers" value="${[10,20,50]}"/>
            <c:forEach var="element" items="${numbers}">
                <c:choose>
                    <c:when test="${element ne page.size}">
                        <a href="?page=0&size=${element}">
                            <input type="button" value="${element}">
                        </a>
                    </c:when>

                    <c:otherwise>
                        <a href="?page=${page.number}&size=${page.size}">
                            <input type="button" value="${element}">
                        </a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </p>
    </ul>
</nav>

<h3><a href="/NewsFeed/add">Add new post</a></h3>
<c:forEach var="page" items="${page.content}">
    <table border="1">
        <tbody>
        <tr>
            <td>
                <p style="text-align:center"><strong>${page.title}</strong></p>
                <p style="text-align:center">
                    <em><fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${page.date}"/></em>
                </p>
                <p style="text-align:center">${page.content}</p>
                <c:if test="${fn:length(page.picture) gt 0}">
                    <p><img src="${page.picture}"/></p>
                </c:if>
            </td>
        </tr>
        </tbody>
    </table>
</c:forEach>

</body>
</html>