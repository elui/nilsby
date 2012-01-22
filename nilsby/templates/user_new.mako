<%inherit file="layout.mako"/>

<%block name="content">
    <h1>Sign up!</h1>

    <form action="${request.route_url('user_new')}" method="POST">
        <input type="hidden" name="action" value="post" />
        <p>Username: <input type="text" name="uname" /></p>
        <p>Real name: <input type="text" name="rname" /></p>
        
        <p><input type="submit" name="submit" value="Submit" /></p>
    </form>
</%block>

