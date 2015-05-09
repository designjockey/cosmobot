# Description:
#   Retrieves random cat facts.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot catfact - Reply back with random cat fact.
#
# Author:
#   scottmeyer

module.exports = (robot) ->
  robot.respond /CATFACT$/i, (msg) ->
    msg.http('http://catfacts-api.appspot.com/api/facts?number=1')
    .get() (error, response, body) ->
      # passes back the complete reponse
      response = JSON.parse(body)
      if response.success == "true"
        msg.send response.facts[0]
      else
        msg.send "I'm busy getting pet by someone, try to convice me to cat fact later."