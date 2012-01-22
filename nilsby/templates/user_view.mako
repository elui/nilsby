<%inherit file="layout.mako"/>

<%block name="content">
    <p>${person.username}</p>
    <p>Name: ${person.realname}</p>

    <a href="${request.route_url('forum_post')}">Back to User Index</a>
</%block>
     