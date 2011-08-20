describe "Banana", ->
  banana = null
  beforeEach -> banana = new Banana
  
  describe "before peeling it", ->    
    it "is not ready", ->
      expect(banana.ready).toBeFalsy()
    
  describe "after peeling it", ->
    beforeEach -> banana.peel()        
    it "is now quite ready", ->
      expect(banana.ready).toBe(true)
    
    