Composer Mirror Repository Switcher
=========

Version
----

0.1.0

Installation
--------------

>macOs

```sh
# brew under macos
$ brew install composer-switcher
```

>Linux

```sh
# Linux through source code compilation and installation
$ wget -O composer-switcher-lastest.tgz https://github.com/persiliao/composer-switcher/archive/v0.1.0.tar.gz
$ tar -zxvf composer-switcher-lastest.tgz
$ ln -s ~/composer-switcher-lastest/composerswitcher.sh /usr/local/bin/composer-switcher
```

Options
--------------

- -m|--mirror switch composer mirror 

```sh
# switch composer mirror repository to aliyun
$ composer-switcher -m aliyun

# switch composer mirror repository to tencent
$ composer-switcher --mirror tencent
```

- -c|--cancel switch composer global mirror repository to packagist

```sh
$ composer-switcher -c

$ composer-switcher --cancel
```

- -g|--global composer config global setting

```sh
# switch composer global mirror repository to aliyun
$ composer-switcher -g -m aliyun

# switch composer global mirror repository to packagist
$ composer-switcher -g -c
```

License
----

MIT

[Homebrew](http://brew.sh/)
[@PersiLiao](http://twitter.com/PersiLiao)