<%inherit file="layout.mako"/>

<%block name="content">
    <h1>${post.title}</h1>
    % for r in post.replies:
        <p>${r.text}</p>
    % endfor

    <form action="${request.route_url('forum_reply', post_id=post.id)}" method="POST">
        <p>Reply to this post:</p>
        <textarea name="text"></textarea>
        <input type="submit" value="Submit" />
    </form>
</%block>
