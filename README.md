<h2>PL/Swift
  <img src="http://zeezide.com/img/plswift.svg"
       align="right" width="128" height="128" />
</h2>

![PostgreSQL](https://img.shields.io/badge/postgresql-10-yellow.svg)
![Swift3](https://img.shields.io/badge/swift-3-blue.svg)
![Swift4](https://img.shields.io/badge/swift-4-blue.svg)
![macOS](https://img.shields.io/badge/os-macOS-green.svg?style=flat)
![tuxOS](https://img.shields.io/badge/os-tuxOS-green.svg?style=flat)

**PL/Swift** allows you to write custom SQL functions and types
for the
[PostgreSQL](https://www.postgresql.org) database server
in the 
[Swift](http://swift.org/)
programming language.

<center>*Bringing Swift to the Backend of the Backend's Backend*</center>

Checkout [PL/Swift](https://github.com/PL-Swift/PLSwift/) for more information.

This repository provides some Docker environments for playing w/ PL/Swift
on Linux.

## Running the Image

    docker run --rm -it --name plswift helje5/swift-pgdev /bin/bash

## Sample

Note: Password of user `swift` is `swift` ...

```
$ docker run --rm -it --name plswift helje5/swift-pgdev /bin/bash

swift@3393074585ff:~$ sudo /etc/init.d/postgresql start
[sudo] password for swift: 
 * Starting PostgreSQL 9.5 database server                                                                                                                                                                                  [ OK ] 

swift@3393074585ff:~$ swift pl validate
The Swift PostgreSQL build environment looks sound.

  srcroot:   /home/swift
  module:    swift
  config:    debug
  product:   /home/swift/.build/swift.so
  version:   
  sql-setup: 
  pg_config: /usr/bin/pg_config
  moddir:    /usr/lib/postgresql/9.5/lib
  extdir:    /usr/share/postgresql/9.5/extension/
  PL/Swift:  /usr/local
  swift:     4.0.3

ERROR: Missing extension control file: swift.control
ERROR: Missing setup file: 

swift@3393074585ff:~$ mkdir base36 && cd base36
swift@3393074585ff:~/base36$ swift pl init
The Swift PostgreSQL build environment looks sound.

  module:    base36
  config:    debug
  product:   /home/swift/base36/.build/base36.so
  pg_config: /usr/bin/pg_config
  PL/Swift:  /usr/local

swift@3393074585ff:~/base36$ swift pl build
Fetching https://github.com/PL-Swift/PLSwift.git
Fetching https://github.com/PL-Swift/CPLSwift.git
Cloning https://github.com/PL-Swift/PLSwift.git
Resolving https://github.com/PL-Swift/PLSwift.git at 0.0.4
Cloning https://github.com/PL-Swift/CPLSwift.git
Resolving https://github.com/PL-Swift/CPLSwift.git at 0.0.1
Compile Swift Module 'PLSwift' (3 sources)
Compile Swift Module 'base36' (2 sources)

swift@3393074585ff:~/base36$ sudo swift pl install

swift@3393074585ff:~/base36$ psql
psql (9.5.10)
Type "help" for help.

swift=# CREATE EXTENSION "base36";
CREATE EXTENSION
swift=# SELECT * FROM base36_hello();
     base36_hello      
-----------------------
 Hello Schwifty World!
(1 row)
```    

### Who

**PL/Swift** is brought to you by
[ZeeZide](http://zeezide.de).
We like feedback, GitHub stars, cool contract work,
presumably any form of praise you can think of.
