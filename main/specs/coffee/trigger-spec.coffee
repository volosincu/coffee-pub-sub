
define ['jasmine', 'publisher'], (jasmine, Publisher)->
  "use strict"

  describe "Test trigger() subscriber list size => ", ()->

    it "On (cnk_on) subscribers list is empty.", ()->
      o =
        name : 'Bogdan'
        surname : 'Volosincu'
        language : 'JavaScript'

      publisher_ = new Publisher o

      expect(Object.keys(publisher_.trigger()).length).toEqual 0
      return

    return
  return