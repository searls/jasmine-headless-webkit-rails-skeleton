describe("Banana", function() {
  var banana;
  beforeEach(function() {
    banana = new Banana();
  });
  
  describe("before peeling it", function() {
    it("isn't ready to eat", function() {
      expect(banana.ready).toBe(false);
    });
  });
  
  describe("after peeling it", function() {
    beforeEach(function() {
      banana.peel();
    });
    it("is ready to eat", function() {
      expect(banana.ready).toBe(true);
    });
  });
});