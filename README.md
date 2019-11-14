# Jenkins Vagrant Saltstack

Command "vagrant up"
- creates a new virtualbox with masterless salstack  
- install Jenkins with Plugins and job as example

In the VirtualBox you can find important folders like:

/etc/salt
/srv/

Jenkins WebGui is forwared to the host!
config.vm.network :forwarded_port, guest: 80, host: 8080
config.vm.network :forwarded_port, guest: 8080, host: 8081


Features

* Java 8
* Jenkins
* Salstack SLS automatic usage of pre-created admin:password from file /var/lib/jenkins/secrets/initialAdminPassword
* plugins
  * Github Plugin
  * Green Balls

## Your PHP project configuration

In your `composer` load the dev tools you require (i.e. PHPUnit, phpcpd, phpmd, phpcs etc) & have these run via Ant. This will allow one to control the version of the dev tools they use & allow developers to run them locally as well. Allowing Jenkins CI to focus on Continuous Integration.

## Config examples (coming soon)

* Composer.json (composer)
* phpunit.xml (phpunit)
* build.xml (ant)
* job-config.xml (jenkins ci)

## Recomended project directory structure (required folders/files)

* composer.json
* composer.lock
* tests/phpunit.xml
* tests/build.xml
* tests/build/.gitignore (git ignore this directory contents - will contain code coverage etc)
* tests/job-config.xml

## Debugging

If you want to see a full list of what Salt is doing you can add the following line to the VagrantFile

```
salt.verbose = true
```

Or use flag below when running vagrant command

```
--debug
```

