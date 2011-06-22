class Node
  constructor:(@value) ->
    [@next, @prev] = [null,null]
  toString: -> "<#{@value}>"

class LinkedList
  constructor: ->
    @first = null
    @size  = 0
  add: (values...) ->
    values.forEach (value) =>
      node = new Node(value)
      if @first?
        current = @first
        current = current.next while current.next?
        current.next = node
      else
        @first = node
      @size++
  find: (value) -> @select (item) -> item.value == "#{value}"
  values: -> @collect (node) -> node.value
  each: (callback) ->
      item = @first
      while item?
        callback.call @, item
        item = item.next
  collect: (callback) ->
    item = @first
    values = []
    while item?
      values.push callback.call @, item
      item = item.next
    values

  select: (callback) ->
    item = @first
    notFound = true
    while item? and notFound
      notFound = !callback.call @, item
      item = item.next if notFound
    return item
  each: (callback) ->
    item = @first
    while item?
      callback.call @, item
      item = item.next

  toString: -> @join ", "
  join: (delimiter=" ") ->
    buffer = ""
    @each (item) ->
      buffer += "#{item.value}"
      buffer += delimiter if item.next?

    "<#{buffer}>"

exports.LinkedList = LinkedList


