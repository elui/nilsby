<%inherit file="layout.mako"/>

<%block name="content">
    %for p in people:
    <p>${p.uname}</p>
    <p>Name: ${p.rname}</p>
    %endfor

    <a href="${request.route_url('forum_post')}">Back to User Index</a>
</%block>
     