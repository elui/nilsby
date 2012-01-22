# -*- coding: utf-8 -*- 
<%inherit file="layout.mako"/>

    % for p in people:
    <p>${p.username}</p>
        % for fp in p.forum_posts:
            <strong>${fp.title}</strong>
        % endfor
    % endfor
