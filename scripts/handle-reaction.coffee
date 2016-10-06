# Description:
#   Demonstrates how to use the hubot-slack v4.1.0 ReactionMessage

ReactionMessage = require.main.require 'hubot-slack/src/reaction-message'

handleReaction = (res) ->
  message = res.message
  item = message.item

  switch item.type
    when 'message'
      desc = "the message from channel #{item.channel} at time #{item.ts}"

    when 'file'
      desc = "the file with ID #{item.file}"

    when 'file_comment'
      desc = "the comment with ID #{item.file_comment} for file #{item.file}"

    else
      desc = "an item of type #{item.type} that I don't recognize"

  type = message.type
  user = "#{message.user.real_name} (@#{message.user.name})"
  reaction = message.reaction
  preposition = if type is 'added' then 'to' else 'from'
  res.reply "#{user} #{type} a *#{reaction}* reaction #{preposition} #{desc}."

module.exports = (robot) ->
  robot.listen(
    (message) -> message instanceof ReactionMessage
    handleReaction
  )
  robot.logger.info 'Listening for reaction_added, reaction_removed events'
