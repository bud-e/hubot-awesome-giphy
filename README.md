# hubot-awesome-giphy

A hubot script that gives the gifs/stickers from GIPHY

See [`src/awesome-giphy.coffee`](src/awesome-giphy.coffee) for source code.

## Installation

In hubot project repo, run:

`npm install hubot-awesome-giphy --save`

Then add **hubot-awesome-giphy** to your `external-scripts.json`:

```json
[
  "hubot-awesome-giphy"
]
```

## Configuration:
HUBOT_GIPHY_API_KEY

#### Add environment variable:
**`export HUBOT_GIPHY_API_KEY=<your-api-key>`**

## Commands:
**>> hubot giphy {type} {query} {limit}**

Possible Values:
  * **type**   -  2 types
    * GIF - `g | gif | gifs`
    * STICKER - `s | sticker | stickers`
  * **query**  -  `string (for ex. cat, superman+batman)`
  * **limit**  -  `number`

## Sample Interaction

```
>> hubot giphy g batman 1
>> hubot giphy gif superman 2
>> hubot giphy gifs mr+bean 4

>> hubot giphy s batman+superman 1
>> hubot giphy sticker cat 3
>> hubot giphy stickers minions 2
```

## NPM Module

https://www.npmjs.com/package/hubot-awesome-giphy
