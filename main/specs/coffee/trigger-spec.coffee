
define ['jasmine', 'cpubsub'], (jasmine, cpubsub)->
  "use strict"

  describe "(trigger-spec.coffee) Test trigger() subscriber list size => ", ()->

    it "On (cnk_on) subscribers list is empty.", ()->
      o =
        name : 'Bogdan'
        surname : 'Volosincu'
        language : 'JavaScript'

      pubsub_ = new cpubsub o

      expect(Object.keys(pubsub_.trigger()).length).toEqual 0
      return

    return
  return