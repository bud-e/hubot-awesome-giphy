# Description:
# ============
#   A hubot script that gives the gifs/stickers from GIPHY
#
#   GIPHY API - SEARCH ENDPOINT
#   https://developers.giphy.com/docs/api/endpoint#search
#
#   GIPHY Search gives you instant access to our library of millions of GIFs
#   and Stickers by entering a word or phrase. With our unparalleled
#   search algorithm, users can easily express themselves and animate
#   their conversations.
#
#   Ex.
#     GIF URL:
#     https://api.giphy.com/v1/gifs/search?api_key=<YOUR_API_KEY>&q=mr+bean&limit=10&offset=0&rating=G&lang=en
#
#     STICKER URL:
#     https://api.giphy.com/v1/stickers/search?api_key=<YOUR_API_KEY>&q=mr+bean&limit=25&offset=0&rating=G&lang=en
#
#
# Author:
# =======
#   * Siddharth Bhalgami <siddharth.bhalgami@gmail.com>

API_KEY = process.env.HUBOT_GIPHY_API_KEY
GIPHY_BASE_URL = "http://api.giphy.com/v1/"

module.exports = (robot) ->
  robot.respond /giphy (.*) (.*) ([0-9]+)/i, (res) ->
    send_giphy res, false

send_giphy = (res) ->
  return res.send "Please, Configure API KEY for GIPHY." if not API_KEY
  url = false
  limit = 1
  limit = parseInt(res.match[3], 10) if res.match[3]

  type = false
  type = 'gifs/' if res.match[1] in ['gifs', 'gif', 'g'] and res.match[2]
  type = 'stickers/' if res.match[1] in ['stickers', 'sticker', 's'] and res.match[2]

  return res.send "Invalid, please try again!" if not type

  url = GIPHY_BASE_URL + type +
  "search?&api_key=#{API_KEY}&q=#{res.match[2]}&limit=#{limit}&" +
  "offset=0&rating=G&lang=en"

  res.http(url).get() (err, response, body) ->
    return res.send "Encountered an error :( #{err}" if err
    return res.send "Something is wrong with this URL : #{url}" if response.statusCode != 200
    datas = JSON.parse body
    if datas and datas.data and datas.data.length > 0
      for data in datas.data
        res.send data.title + " : " + data.images.original.url
      return
    else
      res.send "Sorry, no gif/sticker was found for query: #{res.match[2]}"
      return
