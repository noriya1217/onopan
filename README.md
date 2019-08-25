# アプリ名 : 'ono pan

## 概要

- パン屋の売れ残ったパンを廃棄している問題を解決する。

- [「天気が悪くて売れ行きが悪そうな日でも、来店してくれるお客様のために一通りの種類を焼かないといけない。その日に焼いた一番おいしいパンを食べてほしいのでどうしても廃棄は出てしまう」
「第一歩にパンを選んだのは、常温で数日、冷凍すれば数週間は保存できるパンでも、焼いたその日に捨てられることが多い」](https://www.asahi.com/articles/ASM5H35LDM5HULOB001.html)

- [「持続可能な開発目標（SDGs）の12.3に明記されている、”2030年までに食品廃棄物を半減させる”という目標の達成に取り組み」](https://www.caa.go.jp/policies/policy/consumer_policy/information/food_loss/efforts/pdf/efforts_180628_0001.pdf)

- マネタイムズとしてはサブスクリプションとしてパン屋に定額制で導入してもらう。
    > ベーシックプラン¥980 / プレミアムプラン¥1980といった形式。

## コンセプト

フードロスをなくすサービス。

## バージョン

- Ruby 2.6.3
- Rails 5.2.3

## 機能一覧

- LINE Bot

    1. ユーザー登録
    1. ユーザー情報編集
    1. アカウント削除
    1. 新着商品通知
    1. 購入
    1. 注文確定メッセージ

- 商品設定・顧客情報画面(パン屋 / PC)

    1. ログイン / ユーザー登録
    1. 購入履歴 / 顧客情報参照
    1. 商品登録(ログイン後ホーム画面)
        - 画像登録
    1. 購入承認

## 使い方

https://docs.google.com/spreadsheets/d/1eDzwu_zNBpFci_TGAzBEXLxIx81iTJzf7BdUquxzmbE/edit#gid=1263182803&range=A1

## 使用した技術

- LINE Bot API(Messaging API)
- DEVISE
- AWS EC2 / S3
- RSpec(SystemSpec)

## 使用Gem
- Production

    1. CarrierWave
    1. chart-js-rails
    1. devise
    1. gon
    1. line-bot-api
    1. MiniMagic
    1. simple_calendar
    1. unicorn

- Development / Test

    1. capistrano
    1. capybara
    1. factory_bot_rails
    1. faker
    1. guard-rspec
    1. rspec
    1. rubocop
    1. seed-fu
    1. spring-commands-rspec

## カタログ設計

https://docs.google.com/spreadsheets/d/1eDzwu_zNBpFci_TGAzBEXLxIx81iTJzf7BdUquxzmbE/edit#gid=1925765415

## テーブル設計

https://docs.google.com/spreadsheets/d/1eDzwu_zNBpFci_TGAzBEXLxIx81iTJzf7BdUquxzmbE/edit#gid=368186664

## ER図

https://drive.google.com/file/d/1JBjKUueBZq6oZCChGhhQao0QqAYNKdKp/view?usp=sharing

!['ono pan_ER図](https://github.com/noriya1217/onopan/blob/images/onopan_screen_erd.jpg)

## 画面遷移図

https://drive.google.com/file/d/1JBjKUueBZq6oZCChGhhQao0QqAYNKdKp/view?usp=sharing

- 優先度(高)機能のみ
!['ono pan_画面遷移図](https://github.com/noriya1217/onopan/blob/images/onopan_screen_transition_diagram.jpg)

- 優先度(高/低)全て含む機能
!['ono pan_画面遷移図_全ての機能有](https://github.com/noriya1217/onopan/blob/images/onopan_screen_transition_diagram_all.jpg)

## 画面ワイヤーフレーム

https://docs.google.com/spreadsheets/d/1eDzwu_zNBpFci_TGAzBEXLxIx81iTJzf7BdUquxzmbE/edit#gid=679879839


## アーキテクチャ

![アーキテクチャ](https://github.com/noriya1217/onopan/blob/images/architecture.png)
