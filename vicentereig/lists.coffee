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
        last = @first
        last = last.next while last.next?
        last.next = node
      else
        @first = node
      @size++
  toString: -> @join ", "
  join: (delimiter=" ") ->
    buffer = ""
    item   = @first
    while item?
      buffer += "#{item.value}"
      buffer += delimiter if item.next?
      item = item.next
    "<#{buffer}>"

exports.LinkedList = LinkedList


