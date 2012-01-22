<%inherit file="layout.mako"/>

<%block name="content">
    % for p in posts:
    <p><a href="${request.route_url('forum_view', id=p.id)}">${p.title}</a></p>
    <p>${p.text}</p>
    % endfor

    % if request.is_logged_in():
        <a href="${request.route_url('forum_post')}">Ask a question?</a>
    % else:
        <p>Log in to ask a question</p>
    % endif
</%block>
