class KanjiWriter

  constructor: (divName) ->
    @paper = new Raphael(divName)

  makeStroke: (path) ->
    @stroke = @paper.path($(path).attr('d'))
    @stroke.attr
      'stroke'          : 'black'
      'stroke-width'    : '3'
      'stroke-linecap'  : 'round'
      'stroke-linejoin' : 'round'

  drawKanji: () ->
    self = this
    @paper.clear()
    groups = jQuery(@xml).find('svg > g > g > g')
    if groups.length == 0
      $(@xml).find('path').each (index, value) ->
        stroke = self.makeStroke(this)
    else
      groups.each ->
        self.paper.setStart()
        $(this).find('path').each ->
          self.makeStroke(this)
          set = self.paper.setFinish()
          element = $(this).attr('kvg:element')
          if (element == undefined)
            inners = $(this).find('g')
            for inner in inners
              set['element'] = $(inner).attr('kvg:element')

  getKanji: (kanji) =>
    @kanji = kanji
    $.ajax
      url        : 'javascripts/vendor/kanji/0' + @kanji.charCodeAt(0).toString(16) + '.svg'
      dataType   : 'xml'
      success    : (data) =>
        @xml = data
        @drawKanji(@kanji)
      
      statusCode :
        404: () ->
          parent.paper.clear()
          error = parent.paper.text(0, 0, parent.kanji + ' not found')
          error.attr
            'x'           : 50
            'y'           : 50
            'fill'        : 'black'
            'font-size'   : 18
            'text-anchor' : 'start'

window.KanjiWriter = KanjiWriter
