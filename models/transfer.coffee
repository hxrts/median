Backbone = require 'backbone'
sd = require("sharify").data
_ = require 'underscore'
numeral = require 'numeral'

module.exports = class Transfer extends Backbone.Model
  url: ->
    "#{sd.KERNAL_API_URL}/transfers/#{@id}"

  href: ->
    "#{sd.APP_URL}/transfers/#{@idOrTransfer()}"

  idOrTransfer: ->
    @get('transfer') or @id

  counterparty: ->
    @get.counterparty