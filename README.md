# EsaArchiver

[![CircleCI](https://circleci.com/gh/Pegasus204/esa_archiver.svg?style=svg)](https://circleci.com/gh/Pegasus204/esa_archiver)

[esa.io](https://esa.io)で作成し、最終更新日から一定期間が経過した記事をアーカイブするアプリケーションです。

## Features

`.env`の`ESA_ARCHIVE_ELAPSED_DAYS`に、経過した日数を設定することで、記事を自動でアーカイブすることができます。

経過した月数と、アーカイブされる記事の最終更新月の関係は以下の表のようになります。 (例では2018年04月01日を当日とする。)

|経過した月数|アーカイブされる記事の作成日|
|:---:|:---:|
|31|2018年3月1日|
|60|2018年1月31日|

また、`.env`の`ESA_ARCHIVE_MESSAGE`には、記事更新時のメッセージを設定することができます。

このメッセージに`[skip notice]`を追加すると記事の自動アーカイブ時に記事の持ち主に通知されなくなります。

## How to Run
### Run locally
```
$ git clone git@github.com:Pegasus204/esa_archiver.git
$ cd esa_archiver
$ bundle install
$ cp .env.sample .env
$ vi .env
// setup environment variable
```

でローカル環境構築を行ってください。

`bundle exec thor posts:archive`を実行することで記事がアーカイブされます。

毎日実行されるように設定することで、指定した日数経過した記事を自動アーカイブすることができます。

## Test
```
$ bundle exec rspec
```
でテストを実行できます。
