# Description:
#   Demonstrates how to use the hubot-slack v4.1.0 ReactionMessage

{Listener} = require.main.require 'hubot'
ReactionMessage = require.main.require 'hubot-slack/src/reaction-message'

class ReactionAddedListener extends Listener
  constructor: (@robot, @options, @callback) ->
    @matcher = (message) =>
      message instanceof ReactionMessage && message.type is 'added'
    super @robot, @matcher, @options, @callback

module.exports = (robot) ->
  listener = new ReactionAddedListener robot, {}, (res) ->
    message = res.message
    user = "#{message.user.real_name} (@#{message.user.name})"
    reaction = message.reaction
    item = message.item

    switch item.type
      when 'message'
        desc = "the message from channel #{item.channel} at time #{item.ts}"

      when 'file'
        desc = "the file with ID #{item.file}"

      when 'file_comment'
        desc = "the comment with ID #{item.file_comment} for file #{item.file}"

      else
        desc "an item of type #{item.type} that I don't recognize"

    res.reply "#{user} added a *#{reaction}* reaction to #{desc}."

  robot.listeners.push listener
  robot.logger.info 'Listening for reaction_added messages'
