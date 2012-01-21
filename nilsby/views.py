def view_root(context, request):
    return {'items':list(context), 'project':'nilsby'}

def view_model(context, request):
    return {'item':context, 'project':'nilsby'}
