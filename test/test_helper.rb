if (RUBY_VERSION < "1.9.0")
  $KCODE = 'u'
  begin
    require 'rubygems'
  rescue LoadError
  end
end
require 'test/unit'

$LOAD_PATH.unshift(File.expand_path(File.join('..', 'lib')))
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

require 'bimyou_segmenter'
