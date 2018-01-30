# EsaArchiver

[![CircleCI](https://circleci.com/gh/Pegasus204/esa_archiver.svg?style=svg)](https://circleci.com/gh/Pegasus204/esa_archiver)

[esa.io](https://esa.io)で作成し、最終更新日から一定期間が経過した記事をアーカイブするアプリケーションです。

## Features

`.env`の`ESA_ARCHIVE_ELAPSED_MONTH`に、経過した月数を設定することで、1ヶ月ごとに記事をアーカイブすることができます。

経過した月数と、アーカイブされる記事の最終更新月の関係は以下の表のようになります。
(例では2018年01月を当月とする。)

| 経過した月数 | アーカイブされる記事の最終更新月 |
|:--:|:--:|
| 0 | 2018年01月 |
| 1 | 2017年12月 |
| 2 | 2017年11月 |

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

毎月実行されるようにcronを設定することで、指定した月数経過した記事を自動アーカイブすることができます。

## Test
```
$ bundle exec rspec
```
でテストを実行できます。
