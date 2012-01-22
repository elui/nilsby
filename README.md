Nilsby
======

This is a forum/community site for families with special needs children.

Requirements
============

* `virtualenv`
* `pyramid==1.2`

Setup instructions
==================

If you don't already have `virtualenv`, install it using either your built-in package manager (e.g. `apt-get install python-virtualenv`) or using `easy_install`. (e.g. `pip install virtualenv` or `easy_install virtualenv`.)

Create a virtualenv for your site instance:

    $ virtualenv --no-site-packages env
    $ source env/bin/activate

Make sure your prompt has `(env)` in front. Install pyramid (for paster):

    (env)$ pip install pyramid==1.2

Wait for it to finish. Now enter the package directory and setup install:

    (env) nilsby$ python setup.py install

To run a server, run `paster`:

    (env) nilsby$ paster serve production.ini

Make sure to edit `production.ini` with the proper database URL.
