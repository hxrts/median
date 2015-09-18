Q = require 'q'
_ = require 'underscore'
Backbone = require "backbone"
sd = require("sharify").data
Positions = require '../../collections/positions.coffee'

@index = (req, res, next) ->
  return unless req.user

  positions = new Positions req.user.get('open_positions')

  Q.allSettled(
    positions.map (position) -> position.fetch()
  ).then ->
    res.render 'index',
      positions: positions.models
  .catch (error) ->
    console.log 'error', error
    next()
  .done()