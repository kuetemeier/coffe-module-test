require 'coffee-errors'

chai = require 'chai'
sinon = require 'sinon'
# using compiled JavaScript file here to be sure module works
coffeModuleTest = require '../lib/coffe-module-test.js'

expect = chai.expect
should = chai.should()
chai.use require 'sinon-chai'

describe 'coffe-module-test', ->
  it 'works', ->
    actual = coffeModuleTest.hello 'World'
    expect(actual).to.eql 'Hello World'

  it 'world', ->
    g = coffeModuleTest.world
    g('test').should.equal('Test')
    g('Hallo').should.equal('Hallo')
    g('Huhu').should.equal('Huhu')
    g('Nichts').should.equal('Nichts')
