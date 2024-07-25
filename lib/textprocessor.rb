# frozen_string_literal: true

require_relative "textprocessor/version"

module Textprocessor
  class Error < StandardError; end

  def self.edgegram(adata)
    len1 = adata.length
    accum = []
    for i in 0..adata.length-1 do
      accum.append adata[0..i]
    end
    return accum
  end

  def self.ngram_of_len(astr, alen)
    startidx = 0
    endidx = startidx + (alen-1)

    accum = []

    while endidx < astr.length
      accum.append astr[startidx..endidx]
      startidx += 1
      endidx += 1
    end

    return accum
  end

  def self.ngram(adata)
    len1 = adata.length
    accum = []
    for i in 1..adata.length do
      iter_accum = ngram_of_len(adata, i)
      iter_accum.each {|x| accum.append(x)}
    end
    return accum
  end
end
