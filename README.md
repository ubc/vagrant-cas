Vagrant Provision script for CAS testing server
===============================================

It will provision a CAS testing server with vagrant.

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
Point the application to https://192.168.33.10 for the CAS configuration.

Logins: you can use any username and password as long as they are the same. Cas will allow you to login. E.g. username: admin, password: admin

