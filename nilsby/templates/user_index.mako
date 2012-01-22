<%inherit file="layout.mako"/>

<%block name="content">
    %for p in people:
    <p>${p.username}</p>
    <p>Name: ${p.realname}</p>
    %endfor

    <a href="${request.route_url('forum_post')}">Back to User Index</a>
</%block>
