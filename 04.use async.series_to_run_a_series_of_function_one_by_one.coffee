a = require "async"

a.series [
    f1 = (cb) ->
        cb null, "result of f1"
    f2 = (cb) ->
        cb null, "result of f2"
    f3 = (cb) ->
        cb null, "result of f3"
], (err, result) ->
    return console.log err if err
    console.log result