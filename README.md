Vagrant Provision script for CAS testing server
===============================================

It will provision a CAS 3.5.2 testing server with vagrant.

Running
-------

    git clone https://github.com/ubc/vagrant-cas.git
    cd vagrant-cas
    vagrant up

Testing
-------

    open http://192.168.33.10/cas/login

Or if you need SSL enabled version:

    open https://192.168.33.10/cas/login

Using
-----
Point the application to https://192.168.33.10/cas/ for the CAS configuration.

Logins are listed in the deployerConfigContext.xml file. As an example:

scott:casuser
rich:test
student:student
employee:employee
guest:guest
basic:basic

Attributes
----------

The person-attributes.conf file contains a list of attributes for each user. This is JSON format.
In order for your CAS server to release these attributes you must enable them in the services app.
This can be accessed at 192.168.33.10/cas/services/ -- you will need to sign in as scott:casuser
(by default but you are able to change this in deployerConfigContext.xml under userDetailsService.
Also, the user must have a `"memberOf": ["ROLE_ADMIN"],` attribute.

Once you access the Manage Services app, click on the 'edit' next to the HTTP and IMAP service and
then cmd/ctrl click on each of the attributes you wish to release. This list is populated from
the keys of attributes that you set in the person-attributes.conf file.

Click Save Changes.
