<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add</title>
</head>
<body>
<form id="/NewsFeed/add" method="POST">
    <label for="title">Title</label>
    <input type="text" name="title" id="title" value="${dto.title}">
    <label for="content">Content</label>
    <input type="text" name="content" id="content" value="${dto.content}">
    <label for="content">Picture (not necessary)</label>
    <input type="text" name="picture" id="picture" value="${dto.picture}">
    <input type="submit" value="Add new post">
</form>
</body>
</html>
