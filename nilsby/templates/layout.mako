# -*- coding: utf-8 -*- 
<!DOCTYPE html>  
<html>
<head>
  <meta charset="utf-8">
  <title>Nilsby</title>
  <link rel="shortcut icon" href="/static/favicon.ico">
  <link rel="stylesheet" href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css">
  <link rel="stylesheet" href="/static/style.css">
</head>

<body>

  % if request.session.peek_flash():
  <div id="flash">
    <% flash = request.session.pop_flash() %>
	% for message in flash:
	${message}<br>
	% endfor
  </div>
  % endif

  <div id="page">
    
    ${next.body()}

  </div>
  
</body>
</html>