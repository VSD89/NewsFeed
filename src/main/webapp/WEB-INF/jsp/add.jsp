<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
</head>
<body>
<form id="/NewsFeed/add" method="POST">
    <div class="form-group">
        <label for="title">Title</label>
        <input type="text" class="form-control" name="title" id="title" placeholder="Enter title" value="${dto.title}">
    </div>
    <div class="form-group">
        <label for="content">Content</label>
        <input type="text" class="form-control" name="content" id="content" placeholder="Enter content"
               value="${dto.content}">
    </div>
    <div class="form-group">
        <label for="picture">Picture (not necessary)</label>
        <input type="text" class="form-control" name="picture" id="picture" placeholder="Enter link for picture"
               value="${dto.picture}">
    </div>
    <input class="btn btn-primary" type="submit" value="Add">
</form>
<a class="btn btn-secondary" href="/NewsFeed/">Go to watching news</a>
</body>
</html>
