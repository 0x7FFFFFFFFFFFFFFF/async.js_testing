a = require "async"

task_list = ("task_#{i}" for i in [1..10])

task_queue = a.queue ((task, cb) ->
    console.log "Performing task: #{task.name}"
    console.log "Waiting to be processed: #{task_queue.length()}"
    console.log "-----------------------------------------"

    # Simulate intensive processing
    setTimeout (->
        cb()
    ), 1000
), 3

# When all is processed, drain is invoked
task_queue.drain ->
    console.log "All items have been processed"

for t in task_list
    task_queue.push {name: t}, (err) ->
        console.log err if err

# Put a task in front of the queue
task_queue.unshift {name: "Most important task"}, (err) ->
    console.log err if err