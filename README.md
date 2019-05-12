# terraform-with-circleci

| Branch                                                                                                     | Status                                                                                                                                                                                                                                                                        |
|:-----------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [master](https://github.com/Masatoshi-Kouda/terraform-with-circleci)                                       | [![CircleCI](https://circleci.com/gh/Masatoshi-Kouda/terraform-with-circleci/tree/master.svg?style=svg&circle-token=c3c0fe1edcf6493d84c7ee62e683b14faffcd122)](https://circleci.com/gh/Masatoshi-Kouda/terraform-with-circleci/tree/master)                                   |
| [release/movies/prd](https://github.com/Masatoshi-Kouda/terraform-with-circleci/tree/release/movies/prd)   | [![CircleCI](https://circleci.com/gh/Masatoshi-Kouda/terraform-with-circleci/tree/release%2Fmovies%2Fprd.svg?style=svg&circle-token=c3c0fe1edcf6493d84c7ee62e683b14faffcd122)](https://circleci.com/gh/Masatoshi-Kouda/terraform-with-circleci/tree/release%2Fmovies%2Fprd)   |
| [release/movies/stg](https://github.com/Masatoshi-Kouda/terraform-with-circleci/tree/release/movies/stg)   | [![CircleCI](https://circleci.com/gh/Masatoshi-Kouda/terraform-with-circleci/tree/release%2Fmovies%2Fstg.svg?style=svg&circle-token=c3c0fe1edcf6493d84c7ee62e683b14faffcd122)](https://circleci.com/gh/Masatoshi-Kouda/terraform-with-circleci/tree/release%2Fmovies%2Fstg)   |
| [release/payment/prd](https://github.com/Masatoshi-Kouda/terraform-with-circleci/tree/release/payment/prd) | [![CircleCI](https://circleci.com/gh/Masatoshi-Kouda/terraform-with-circleci/tree/release%2Fpayment%2Fprd.svg?style=svg&circle-token=c3c0fe1edcf6493d84c7ee62e683b14faffcd122)](https://circleci.com/gh/Masatoshi-Kouda/terraform-with-circleci/tree/release%2Fpayment%2Fprd) |
| [release/payment/stg](https://github.com/Masatoshi-Kouda/terraform-with-circleci/tree/release/payment/stg) | [![CircleCI](https://circleci.com/gh/Masatoshi-Kouda/terraform-with-circleci/tree/release%2Fpayment%2Fstg.svg?style=svg&circle-token=c3c0fe1edcf6493d84c7ee62e683b14faffcd122)](https://circleci.com/gh/Masatoshi-Kouda/terraform-with-circleci/tree/release%2Fpayment%2Fstg) |


## 構成

![pipeline](docs/images/pipeline.png)

## 初期設定

- `CircleCI`, `GitHub`, `GCP`に関する事前設定等は下記を参考にしてください

[初期設定](docs/setup.md)

## Workflow

#### 1. 作業用branchを作成します

```
$ git checkout master
$ git pull origin master
$ git checkout -b add-payment-pubsub
```

#### 2. 修正が完了したら作業用branchをpushし、PRを作成します

```
$ git add .
$ git commit -m "Add pyament pubsub"
$ git push origin add-payment-pubsub
$ hub pull-request -m "Add payment pubsub"
```

- branchをpushすると、CicrcleCIで下記のようにJobが実行されます

![workflow1](docs/images/workflow1.png)

- Jobをskipさせたい場合は、下記の用にコミットメッセージに`[ci skip]`を記載してください

```
$ git commit -m "[ci skip] Update README.md"
```

- しばらくすると、Jobで実行される`terraform plan`の実行結果が`thnotify`で通知されます

![workflow2](docs/images/workflow2.png)

#### 3. レビュー後問題なければmasterへマージします

- `terraform plan`の実行結果等、変更箇所に問題なければマージします

![workflow3](docs/images/workflow3.png)

#### 4. masterブランチをリリースbranchへマージ

- `release/payment/stg` from `master`

```
$ git checkout master
$ git pull origin master
$ hub pull-request -m "release/payment/stg" -b release/payment/stg
```
#### 5. masterブランチをリリースbranchへマージ

- `release/payment/prd` from `master`

```
$ git checkout master
$ git pull
$ hub pull-request -m "release/gmail/prd" -b release/gmail/stg
```
