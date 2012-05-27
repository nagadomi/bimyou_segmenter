# BimyouSegmenter

BimyouSegmenterはRubyだけで書かれた微妙なサイズの日本語分かち書きソフトウェアです。

約150Kバイトの微妙なサイズのソースコードで、太宰治、宮沢健二、夏目漱石、夢野久作 作品であれば、MeCab+ipadicによるの分かち書きの結果と94%くらいは同じになります。

太宰治、宮沢賢治、夏目漱石、夢野久作 作品、高田力 ベーシック英語、Alice's Adventures in Wonderland, by Lewis Carroll に対するMeCab+ipadicによる分かち書きを L1-regularized logistic regression で学習しています。

## Installation

Add this line to your application's Gemfile:

    gem 'bimyou_segmenter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bimyou_segmenter

## Usage

    require 'bimyou_segmenter'

    p BimyouSegmenter.segment("私は鳥です。")
    p BimyouSegmenter.segment("watashi ha tori desu.\n")
    p BimyouSegmenter.segment("watashi ha tori desu.\n", :white_space => true)

segmentは、分かち書きした結果を文字列の配列として返します。この結果には空白文字や改行コードを含まれません。
:white_space => trueを付けると空白文字や改行コードも返します。このオプションをtrueに指定した場合は、返した文字列配列を順に結合すると元の文字列と一致します。

Ruby1.8.7の場合、$KCODE='u'にしないと動きません。
