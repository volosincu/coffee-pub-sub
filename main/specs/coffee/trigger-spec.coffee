
define ['jasmine', 'proto'], (jasmine, Proto)->
  "use strict"

  describe "Test trigger() subscriber list size => ", ()->

    it "On (cnk_on) subscribers list is empty.", ()->
      o =
        name : 'Bogdan'
        surname : 'Volosincu'
        language : 'JavaScript'

      proto_ = new Proto o

      expect(Object.keys(proto_.trigger()).length).toEqual 0
      return

    return
  return