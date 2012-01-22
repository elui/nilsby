# -*- coding: utf-8 -*- 
<!DOCTYPE html>  
<html>
<head>
    <meta charset="utf-8">
    <title>Nilsby</title>
    <link rel="shortcut icon" href="/static/favicon.ico">
    
    <!-- HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    
    <!-- STYLES -->
    <link rel="stylesheet" href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css">
    <link rel="stylesheet" href="/static/style.css">
</head>

<body>
    <div class="topbar">
        <div class="fill">
            <div class="container">
                <a class="brand" href="${request.application_url}">Nilsby</a>
                <ul class="nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
                <form action="${request.route_url('login')}" method="POST" class="pull-right">
                    <input class="input-small" type="text" name="username" placeholder="Username">
                    <input class="input-small" type="password" name="password" placeholder="Password">
                    <input class="btn" type="submit">Sign in</button>
                </form>
            </div>
        </div>
    </div>

    <div class="container">
        % if request.session.peek_flash():
        <div class="alert-message block-message info">
            <a class="close" href="#">x</a>
            <% flash = request.session.pop_flash() %>
            % for message in flash:
            ${message}<br>
            % endfor
        </div>
        % endif
        
        <section id="content">
            <%block name="content">
            </%block>
        </section>

        <footer>
            <p>&copy; Nilsby 2012</p>
        </footer>
    </div>
</body>
</html>
