<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Feed</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
</head>
<body>

<nav aria-label="Navigation for news above">
    <ul class="pagination">
        <c:choose>
            <c:when test="${page.number gt 0}">
                <li class="page-item">
                    <a class="page-link" href="?page=${page.number-1}&size=${page.size}">Previous</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link">Previous</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:if test="${page.totalPages gt 0}">
            <c:forEach begin="0" end="${page.totalPages-1}" var="i">
                <c:choose>
                    <c:when test="${page.number eq i}">
                        <li class="page-item active">
                            <a class="page-link" href="#">${i+1}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="?page=${i}&size=${page.size}">${i+1}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </c:if>

        <c:choose>
            <c:when test="${page.number+1 lt page.totalPages}">
                <li class="page-item">
                    <a class="page-link" href="?page=${page.number+1}&size=${page.size}">Next</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link">Next</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</nav>

<nav aria-label="News on page above">
    <ul class="pagination">
        <li class="page-item disabled">
            <a class="page-link">Show items on page:</a>
        </li>

        <c:set var="numbers" value="${[10,20,50]}"/>
        <c:forEach var="element" items="${numbers}">
            <c:choose>
                <c:when test="${element ne page.size}">
                    <li class="page-item">
                        <a class="page-link" href="?page=0&size=${element}">${element}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item active">
                        <a class="page-link" href="#">${element}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </ul>
</nav>

<main>
    <a class="btn btn-secondary" href="/NewsFeed/add">Add new post</a>

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
</main>

<nav aria-label="Navigation for news below">
    <ul class="pagination">
        <c:choose>
            <c:when test="${page.number gt 0}">
                <li class="page-item">
                    <a class="page-link" href="?page=${page.number-1}&size=${page.size}">Previous</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link">Previous</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:if test="${page.totalPages gt 0}">
            <c:forEach begin="0" end="${page.totalPages-1}" var="i">
                <c:choose>
                    <c:when test="${page.number eq i}">
                        <li class="page-item active">
                            <a class="page-link" href="#">${i+1}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="?page=${i}&size=${page.size}">${i+1}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </c:if>

        <c:choose>
            <c:when test="${page.number+1 lt page.totalPages}">
                <li class="page-item">
                    <a class="page-link" href="?page=${page.number+1}&size=${page.size}">Next</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link">Next</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</nav>

<nav aria-label="News on page below">
    <ul class="pagination">
        <li class="page-item disabled">
            <a class="page-link">Show items on page:</a>
        </li>

        <c:set var="numbers" value="${[10,20,50]}"/>
        <c:forEach var="element" items="${numbers}">
            <c:choose>
                <c:when test="${element ne page.size}">
                    <li class="page-item">
                        <a class="page-link" href="?page=0&size=${element}">${element}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item active">
                        <a class="page-link" href="#">${element}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </ul>
</nav>

</body>
</html>