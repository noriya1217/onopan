# アプリ名 : 'oha pan

## 概要

- パン屋の売れ残ったパンを廃棄している問題を解決する。

- [「天気が悪くて売れ行きが悪そうな日でも、来店してくれるお客様のために一通りの種類を焼かないといけない。その日に焼いた一番おいしいパンを食べてほしいのでどうしても廃棄は出てしまう」
「第一歩にパンを選んだのは、常温で数日、冷凍すれば数週間は保存できるパンでも、焼いたその日に捨てられることが多い」](https://www.asahi.com/articles/ASM5H35LDM5HULOB001.html)

- [「持続可能な開発目標（SDGs）の12.3に明記されている、”2030年までに食品廃棄物を半減させる”という目標の達成に取り組み」](https://www.caa.go.jp/policies/policy/consumer_policy/information/food_loss/efforts/pdf/efforts_180628_0001.pdf)

- マネタイムズとしてはサブスクリプションとしてパン屋に定額制で導入してもらう。
    > ベーシックプラン¥980 / プレミアムプラン¥1980といった形式。

## コンセプト

フードロスをなくすサービス。

## 操作手順

- GIFやYouTubeを使い、操作手順としての動画を作成し、ここに載せる。

## QRコード

## バージョン

- Ruby 2.6.3
- Rails 5.2.3

## 機能一覧

- LINE Bot

    1. ユーザー登録
        - 位置情報
    1. ユーザー情報編集
    1. アカウント削除
    1. 新着商品通知
        - 位置情報
    1. 購入
    1. 購入確認メッセージ
    1. 注文取消(確定前)
    1. 注文確定メッセージ
    1. アンケート機能

- 商品設定・顧客情報画面(パン屋 / PC)

    1. ログイン / ユーザー登録
    1. 購入履歴 / 顧客情報参照
    1. 商品登録(ログイン後ホーム画面)
        - 画像登録
    1. 購入承認
    1. ページネーション

- 管理画面(サービス提供者 / PC)

    1. ユーザー管理
    1. 店舗(パン屋)管理

## 使用した技術

## 使用予定Gem

## カタログ設計

https://docs.google.com/spreadsheets/d/1eDzwu_zNBpFci_TGAzBEXLxIx81iTJzf7BdUquxzmbE/edit#gid=0

## テーブル設計

https://docs.google.com/spreadsheets/d/1eDzwu_zNBpFci_TGAzBEXLxIx81iTJzf7BdUquxzmbE/edit#gid=1796239193

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

https://docs.google.com/spreadsheets/d/1eDzwu_zNBpFci_TGAzBEXLxIx81iTJzf7BdUquxzmbE/edit#gid=1632550666

