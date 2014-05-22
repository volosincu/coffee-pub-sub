define ['jasmine', 'proto'], (jasmine, Proto)->
  "use strict"


  describe "on trigger", ()->

    it "...", ()->

      o =
        aprop : 'aprop'
        bprop : 'bprop'
        cprop : (param)->
          return param
        dprop : 'dprop'
        eprop : (param)->
          return param

      proto = new Proto(o)

      expect(proto.aprop).toEqual 'aprop'
      expect(proto.bprop).toEqual 'bprop'
      expect(proto.cprop 'cprop').toEqual 'cprop'
      expect(proto.dprop).toEqual 'dprop'
      expect(proto.eprop 'eprop').toEqual 'eprop'

      return


    it "...", ()->

      expect().toEqual
      expect(true).toBe(false);

      return

    return
  return