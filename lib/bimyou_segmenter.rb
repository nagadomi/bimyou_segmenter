require 'bimyou_segmenter/version'
require 'bimyou_segmenter/aozora_model'

module BimyouSegmenter
  begin
    require 'bimyou_segmenter_ext'
    HAS_EXT = true
  rescue LoadError
    HAS_EXT = false
  end
  
  def self.segment(text, options = {})
    if (HAS_EXT)
      BimyouSegmenterExt.segment(text, options)
    else
      AozoraModel.segment(text, options)
    end
  end
end
