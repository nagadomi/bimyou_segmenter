# -*- coding: utf-8 -*-
require 'test_helper'

class BimyouSegmenterTest < Test::Unit::TestCase
  def setup
  end
  def test_segment
    tokens = BimyouSegmenter.segment("私はトマトです")
    assert_equal tokens.size, 4
    assert_equal tokens[0], "私"
    assert_equal tokens[1], "は"
    assert_equal tokens[2], "トマト"
    assert_equal tokens[3], "です"
    
    tokens = BimyouSegmenter.segment("私 \tは  トマト  です。\n")
    assert_equal tokens.size, 5
    assert_equal tokens[0], "私"
    assert_equal tokens[1], "は"
    assert_equal tokens[2], "トマト"
    assert_equal tokens[3], "です"
    assert_equal tokens[4], "。"
    
    assert_equal BimyouSegmenter.segment("hello world\r\n\thello world!!\n",
                                         :white_space => true).join,
    "hello world\r\n\thello world!!\n"
    
    assert_equal BimyouSegmenter.segment("あけましておめでとう",
                                         :white_space => true).join, "あけましておめでとう"
    
    tokens = BimyouSegmenter.segment(" \t\r\n　", :white_space => true)
    assert_equal tokens[0], " "
    assert_equal tokens[1], "\t"
    assert_equal tokens[2], "\r"
    assert_equal tokens[3], "\n"
    assert_equal tokens[4], "　"

    tokens = BimyouSegmenter.segment("「私はトマトです。」", :symbol => false)
    assert_equal tokens.size, 4
    assert_equal tokens[0], "私"
    assert_equal tokens[1], "は"
    assert_equal tokens[2], "トマト"
    assert_equal tokens[3], "です"
    
    tokens = BimyouSegmenter.segment("hello. world? = !", :symbol => false)
    assert_equal tokens.size, 2
    assert_equal tokens[0], "hello"
    assert_equal tokens[1], "world"
    
    assert_equal BimyouSegmenter.segment("").size, 0
    assert_equal BimyouSegmenter.segment(nil).size, 0
    assert_equal BimyouSegmenter.segment(" " * 20, :white_space => true).size, 20

    assert_equal  BimyouSegmenter.segment(" \t\r\n　").size, 0
    tokens = BimyouSegmenter.segment("hello world\r\n")
    
    assert_equal tokens.size, 2
    assert_equal tokens[0], "hello"
    assert_equal tokens[1], "world"
  end
end
