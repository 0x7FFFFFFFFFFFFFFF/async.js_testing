a = require "async"

stack = [
    f1 = (cb) -> 
        cb(null, "Function result for f1")
    f2 = (cb) -> 
        cb(null, "Function result for f2")
    f3 = (cb) -> 
        cb(null, "Function result for f3")
]

console.log stack

a.parallel stack, (err, result) ->
    console.log result