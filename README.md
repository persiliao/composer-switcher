Composer Mirror Repository Switcher
=========

Version
----

0.1.0

Installation
--------------

```sh
$ git clone https://github.com/persiliao/composer-switcher
$ cd composer-switcher
$ ./install_composer_switcher.sh
```

Options
--------------

- -s|--show show composer current repository mirror 


```sh
# show composer mirror repository to aliyun
$ composer-switcher -s

# show composer global mirror repository to aliyun
$ composer-switcher -g -s
```

- -m|--mirror switch composer mirror 


```sh
# switch composer mirror repository to aliyun
$ composer-switcher -m aliyun

# switch composer mirror repository to aliyun
$ composer-switcher --mirror aliyun
```

- -c|--cancel cancel composer global mirror repository to packagist


```sh
$ composer-switcher -c

$ composer-switcher --cancel
```

- -g|--global composer config global setting


```sh
# switch composer global mirror repository to aliyun
$ composer-switcher -g -m aliyun

# cancel composer global mirror repository to packagist
$ composer-switcher -g -c
```

Mirror repository supported
----------------------------------

|Name|Url|Location|
|:---|:-----|:-----|
|aliyun|https://mirrors.aliyun.com/composer/|China|
|tencent|https://mirrors.cloud.tencent.com/composer/|China|
|sjtug|https://packagist.mirrors.sjtug.sjtu.edu.cn|China|
|cnpkg|https://php.cnpkg.org|China|
|japan|https://packagist.jp|Japan|
|india|https://packagist.in|India|
|indonesia|https://packagist.phpindonesia.id|Indonesia|
|southafrica|https://packagist.co.za|South Africa|
|brazil|https://packagist.com.br|Brazil|
|korea|https://packagist.kr|Korea|
|thailand|https://packagist.mycools.in.th|Thailand|`
|usa|https://packagist-mirror.wmflabs.org|USA|

License
----

MIT

[Homebrew](http://brew.sh/)
[@PersiLiao](http://twitter.com/PersiLiao)
