# -*- coding: utf-8 -*- 
<!DOCTYPE html>  
<html>
<head>
    <meta charset="utf-8">
    <title>Nilsby</title>
    <link rel="shortcut icon" href="/static/favicon.ico">
    <link rel="stylesheet" href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css">
    <link rel="stylesheet" href="/static/style.css">
	
	<link rel="stylesheet" href="/static/tinyeditor.css" />
	<script type="text/javascript" src="/static/tinyeditor.js"></script>
	
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
                <a class="brand" href="#">Project name</a>
                <ul class="nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
                <form action="" class="pull-right">
                    <input class="input-small" type="text" placeholder="Username">
                    <input class="input-small" type="password" placeholder="Password">
                    <button class="btn" type="submit">Sign in</button>
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
                    <h2>Main content</h2>
                    ${next.body()}

					<textarea id="input" style="width:400px; height:200px"></textarea>
					<script type="text/javascript">
					new TINY.editor.edit('editor',{
						id:'input',
						width:584,
						height:175,
						cssclass:'te',
						controlclass:'tecontrol',
						rowclass:'teheader',
						dividerclass:'tedivider',
						controls:['bold','italic','underline','strikethrough','|','subscript','superscript','|',
										'orderedlist','unorderedlist','|','outdent','indent','|','leftalign',
										'centeralign','rightalign','blockjustify','|','unformat','|','undo','redo','n',
										'font','size','style','|','image','hr','link','unlink','|','cut','copy','paste','print'],
						footer:true,
						fonts:['Verdana','Arial','Georgia','Trebuchet MS'],
						xhtml:true,
						cssfile:'tinyeditor.css',
						bodyid:'editor',
						footerclass:'tefooter',
						toggle:{text:'source',activetext:'wysiwyg',cssclass:'toggle'},
						resize:{cssclass:'resize'}
					});
					</script>>
					
                </div>
                <div class="span4">
                    <h3>Secondary content</h3>
                </div>
            </div>
        </div>

        <footer>
            <p>&copy; Company 2011</p>
        </footer>

    </div>
</body>
</html>