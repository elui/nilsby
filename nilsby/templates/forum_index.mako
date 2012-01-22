<html>
<body>
    % for p in posts:
    <p><a href="${request.route_url('forum_view', id=p.id)}">${p.title}</a></p>
    <p>${p.text}</p>
    % endfor

    <a href="${request.route_url('forum_post')}">Ask a question?</a>
</body>
</html>
