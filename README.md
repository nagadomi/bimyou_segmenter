# BimyouSegmenter: Rubyだけで書かれた微妙なサイズの分かち書きソフトウェア

BimyouSegmenterはRubyだけで書かれた微妙なサイズの日本語分かち書きソフトウェアです。
約150Kバイトの微妙なサイズのソースコードで、青空文庫にある太宰治、宮沢賢治、夏目漱石、夢野久作作品であれば、MeCab+ipadicによるの分かち書きの結果と94%くらいは同じになります。
という[TinySegmenter](http://chasen.org/~taku/software/TinySegmenter/)のパロディ的なものです。

BimyouSegmenterは、[青空文庫](http://www.aozora.gr.jp/)の太宰治、宮沢賢治、夏目漱石、夢野久作 作品、高田力 ベーシック英語、[Project Gutenberg](http://www.gutenberg.org/wiki/Main_Page)の Alice's Adventures in Wonderland, by Lewis Carroll に対する[MeCab+ipadic](http://mecab.googlecode.com/svn/trunk/mecab/doc/index.html)による分かち書き結果(約800万件)を[LIBLINEAR](http://www.csie.ntu.edu.tw/~cjlin/liblinear/) の L1-regularized logistic regression で学習して、学習されたModelファイルからRubyのコードを生成しています。

## インストール

    gem install bimyou_segmenter

でインストールされます。

コマンドラインツールとライブラリがあります。

## 使い方

### コマンドラインツール
    % bimyou_segmenter
    今年もよろしくお願いします。Happy New Year 2013!
    今年
    も
    よろしく
    お願い
    し
    ます
    。
    Happy
    New
    Year
    2013
    !
    EOS
    いろいろあったけど、ぼくはげんきです
    いろいろ
    あっ
    た
    けど
    、
    ぼく
    は
    げんき
    です
    EOS

オプションは、
 -dでデリミタを指定するとその文字列で単語間を区切ります。デフォルトは\nです。
 -eでEOSの文字列を指定できます。デフォルトはEOSです。
 -sを付けると空白文字や改行コードも単語として返します。-sを付け場合、分割後の単語を繋げると元の文字列と一致します。

    % bimyou_segmenter -d "|"
    今年もよろしくお願いします。Happy New Year 2013!
    今年|も|よろしく|お願い|し|ます|。|Happy|New|Year|2013|!|EOS

    % bimyou_segmenter -s -d "<>" -e ""
    今年もよろしくお願いします。Happy New Year 2013!
    今年<>も<>よろしく<>お願い<>し<>ます<>。<>Happy<> <>New<> <>Year<> <>2013<>!

    % bimyou_segmenter --help

### Ruby ライブラリ


    # coding: utf-8
    require 'bimyou_segmenter'
    
    puts BimyouSegmenter.segment("今年もよろしくお願いします。Happy New Year 2013!").join("|")
    puts BimyouSegmenter.segment("今年もよろしくお願いします。Happy New Year 2013!",
                                 :white_space => true).join("|")


    今年|も|よろしく|お願い|し|ます|。|Happy|New|Year|2013|!
    今年|も|よろしく|お願い|し|ます|。|Happy| |New| |Year| |2013|!

 :white_spaceをtrueにすると(default: false)、空白文字や改行も単語して返します。このオプションを指定した場合は、結果の文字列配列を順に結合すると元の文字列と一致します。
また:symbol => falseにすると(default: true)、記号のみからなる単語（トークン）を返しません。

Ruby 1.8.7の場合は、require 'rubygems'と$KCODEをuにすると使えます。

