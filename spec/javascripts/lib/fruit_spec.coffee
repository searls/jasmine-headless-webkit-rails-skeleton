describe "Fruit", ->
  describe "#pickSeeds", ->    
    it "picks seeds", ->
      expect((new Fruit).pickSeeds(['seed','nom','seed','yum','seed','mmm'])).toEqual(['nom','yum','mmm'])
  