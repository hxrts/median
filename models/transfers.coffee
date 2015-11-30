Backbone = require 'backbone'
sd = require("sharify").data
_ = require 'underscore'

module.exports = class Transfers extends Backbone.Model
  url: -> "#{sd.KERNAL_API_URL}/accounts/#{@user_id}/transfers"

  initialize: ({ @user_id }) ->
    # just destructured assigning

  parse: (data) ->
    data[0]

  allBlockIds: ->
    transfers = _.map @get('transfers'), (transfers) ->
      _.map transfers.all_rewards, (reward) -> reward.block_id
    _.uniq _.flatten transfers

