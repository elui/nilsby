# -*- coding: utf-8 -*- 
<!DOCTYPE html>  
<html>
<head>
    <meta charset="utf-8">
    <title>Nilsby</title>
    <link rel="shortcut icon" href="/static/favicon.ico">
    <link rel="stylesheet" href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css">
    <link rel="stylesheet" href="/static/style.css">
    <style type="text/css">
      /* Override some defaults */
      html, body {
        background-color: #eee;
      }
      body {
        padding-top: 40px; /* 40px to make the container go all the way to the bottom of the topbar */
      }
      .container > footer p {
        text-align: center; /* center align it with the container */
      }
      .container {
        width: 820px; /* downsize our container to make the content feel a bit tighter and more cohesive. NOTE: this removes two full columns from the grid, meaning you only go to 14 columns and not 16. */
      }

      /* The white background content wrapper */
      .content {
        background-color: #fff;
        padding: 20px;
        margin: 0 -20px; /* negative indent the amount of the padding to maintain the grid system */
        -webkit-border-radius: 0 0 6px 6px;
           -moz-border-radius: 0 0 6px 6px;
                border-radius: 0 0 6px 6px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.15);
                box-shadow: 0 1px 2px rgba(0,0,0,.15);
      }

      /* Page header tweaks */
      .page-header {
        background-color: #f5f5f5;
        padding: 20px 20px 10px;
        margin: -20px -20px 20px;
      }

      /* Styles you shouldn't keep as they are for displaying this base example only */
      .content .span10,
      .content .span4 {
        min-height: 500px;
      }
      /* Give a quick and non-cross-browser friendly divider */
      .content .span4 {
        margin-left: 0;
        padding-left: 19px;
        border-left: 1px solid #eee;
      }

      .topbar .btn {
        border: 0;
      }

    </style>
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
        <div id="flash">
            <% flash = request.session.pop_flash() %>
            % for message in flash:
            ${message}<br>
            % endfor
        </div>
        % endif

        <div class="content">
            <div class="page-header">
                <h1>Page name <small>Supporting text or tagline</small></h1>
            </div>
            <div class="row">
                <div class="span10">
                    <%block name="content">
                    <h2>Main content</h2>
                    </%block>
                </div>
                <div class="span4">
                    <%block name="side_content">
                    <h3>Secondary content</h3>
                    </%block>
                </div>
            </div>
        </div>

        <footer>
            <p>&copy; Company 2011</p>
        </footer>
    </div>
</body>
</html>
