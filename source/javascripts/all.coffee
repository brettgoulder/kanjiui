#= require 'vendor/raphael-min'
#= require 'kanji'

$ ->
  list =
    [
      {
        character:'一'
        common_words:
          [['一つ', 'One (counting)'], ['一時', 'One O Clock']]
      },
      {
        character:'二'
        common_words:
          [['二つ', 'Two (counting)'],['二時', 'Two O Clock']]
      },
      {
        character:'三'
        common_words:
          [['三つ', 'Three (counting)'],['三時', 'Three O Clock']]
      }
    ]

  
  k = new KanjiWriter('kanji')
  k.getKanji(list[0].character)

  $('.action').click (e) ->
    k = new KanjiWriter('kanji')
    k.getKanji(list[1].character)
