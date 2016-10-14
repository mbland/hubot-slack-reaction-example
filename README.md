# hubot-slack-reaction-example

Source: https://github.com/mbland/hubot-slack-reaction-example

[![npm](https://img.shields.io/npm/v/hubot-slack-reaction-example.svg?maxAge=2592000)](https://www.npmjs.com/package/hubot-slack-reaction-example)

This is a chat bot built on the [Hubot][hubot] framework that demonstrates how
to use the `Robot.react` method introduced in [hubot-slack][hubot-slack] v4.2.0
and the `ReactionMessage` type introduced in hubot-slack v4.1.0.

All of the example code is in `scripts/handle-reaction.coffee`.

[hubot]: http://hubot.github.com
[hubot-slack]: https://www.npmjs.com/package/hubot-slack

## Running the bot

1. Clone this repo:
   ```sh
   $ git clone https://github.com/mbland/hubot-slack-reaction-example
   $ cd hubot-slack-reaction-example
   $ npm install
   ```

1. You must have administrator access for your Slack domain. Alternatively, you
   can [create your own personal slack domain][slack-create] for testing.

1. Create a new [Slack bot user][slack-bot-user] for your team. Name it
   anything you like, such as `reaction-example-bot`. Take note of the
   API token, which should start with `xoxb-`.

1. Invite the bot to a channel by `@`-mentioning it in the channel, e.g.
   `@reaction-example-bot`.

1. Run the bot:
   ```sh
   $ HUBOT_SLACK_TOKEN=<bot-test-token> ./bin/hubot --adapter slack
   ```
   you should see output like:
   ```
   [Sun Oct 09 2016 12:22:12 GMT-0400 (EDT)] INFO Logged in as reaction-example-bot of mbland
   [Sun Oct 09 2016 12:22:12 GMT-0400 (EDT)] INFO Slack client now connected
   [Sun Oct 09 2016 12:22:12 GMT-0400 (EDT)] INFO Listening for reaction_added, reaction_removed events
   ```

1. Post a message in your Slack domain and add an emoji reaction to it.

Now you should see something like:

<figure>
<img src='./example.png' alt='Usage example' title='Usage example' /><br/>
<figcaption>After the message received the <em>+1</em> emoji reaction, the
example bot posted a response to the channel reporting the details of the
event.</figcaption>
</figure>

[slack-create]: https://slack.com/create
[slack-bot-user]: https://api.slack.com/bot-users]

## Copyright

This software is made available as [Open Source software][oss] under the [ISC
License][isc]. For the text of the license, see the [LICENSE](LICENSE.md) file.

That said, this is example code. Feel free to do with it what you like even
without retaining the copyright. However, since publishing code as public domain
still seems more complicated than it needs to be, the license is there if you
need legal coverage.

[oss]: https://opensource.org/osd-annotated
[isc]: https://www.isc.org/downloads/software-support-policy/isc-license/
