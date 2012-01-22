<%inherit file="layout.mako"/>
<h1>New forum post</h1>

<form action="${request.route_url('forum_post')}" method="POST">
    <input type="hidden" name="action" value="post" />
    <p><input type="text" name="title" /></p>
    <p><textarea name="text"></textarea></p>

    <p><input type="submit" name="submit" value="Submit" /></p>
</form>
