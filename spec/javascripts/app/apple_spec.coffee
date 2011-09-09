describe "Apple", ->
  it "it's always ready", ->
    expect((new Apple).ready).toBe(true)

  it "won't let you peel it", ->
    expect(-> (new Apple).peel()).toThrow "You can't peel an apple, silly!"

  it "is failing to exercise Jenkins", ->
    expect(-> (new Apple).peel()).toThrow "candy!"
