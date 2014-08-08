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

    open http://localhost:8088/cas

Using
-----
The CAS server is mapped to localhost:8088. So point the application to http://localhost:8088 for the CAS configuration.

Default login: jleleu/jleleu
