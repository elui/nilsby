<%inherit file="layout.mako"/>

<%block name="content">
    <h1>New forum post</h1>

    <form action="${request.route_url('forum_post')}" method="POST">
        <input type="hidden" name="action" value="post" />
        <p><input type="text" name="title" /></p>
        <p><textarea id="post_text" name="text"></textarea></p>

        <p><input type="submit" name="submit" value="Submit" /></p>
    </form>

<script type="text/javascript">
new TINY.editor.edit('editor',{
	id:'post_text',
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

</%block>

