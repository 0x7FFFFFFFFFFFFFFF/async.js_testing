a = require "async"
github_api = require "github"
g = new github_api
    # If you want to get verbose info, change this to true
    debug: false

a.waterfall [
    get_user_avatar = (cb) ->
        g.search.users {q: 'jquery'}, (err, res) ->
            return cb(err, null) if err
            cb(null, res.items[0].avatar_url)

    # avatar_url is the first function's result
    wrap_avatar_in_html = (avatar_url, cb) ->
        cb(null, "<img src=\"#{avatar_url}\" />")
], (err, result) ->
    return console.log err if err
    console.log result