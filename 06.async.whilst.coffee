a = require "async"

counter = 0

a.whilst () ->
    counter < 5
, (cb) -> 
    counter++
    console.log "counter = #{counter}"
    setTimeout cb, 1000
, (err) ->
    return console.log err if err
    console.log "Job complete"
