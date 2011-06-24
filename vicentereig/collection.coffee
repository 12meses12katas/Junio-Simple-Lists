class Node
  constructor:(@value) -> [@next, @prev] = [null,null]
  toString: -> "<#{@value}>"

class LinkedList

  constructor: -> [@head, @_size] = [null, 0]

  add: (values...) ->
    @_size += values.length
    values.forEach (value) =>
      node = new Node(value)
      if @head?
        @end().next = node
      else
        @head = node

  delete: (value) ->
    @reject (node) -> node.value != value

  reject: (callback) ->
    current = @head
    prev    = null
    while current?.next? and callback.call @, current
      prev    = current
      current = current.next

    deleted = current
    prev.next = current.next
    @_size--
    return deleted

  find: (value) -> @select (item) -> item.value == value

  values: -> @collect (node) -> node.value

  size: -> @_size

  clear: -> @head = null; @_size = 0

  end: ->
    current = @head
    current = current.next while current.next?
    current

  each: (callback) ->
      item = @head
      while item?
        callback.call @, item
        item = item.next

  collect: (callback) ->
    item = @head
    values = []
    while item?
      values.push callback.call @, item
      item = item.next
    values

  select: (callback) ->
    item = @head
    notFound = true
    while item? and notFound
      notFound = !callback.call @, item
      item = item.next if notFound
    return item

  each: (callback) ->
    item = @head
    while item?
      callback.call @, item
      item = item.next

  join: (delimeter=" ") ->
    buffer = ""
    @each (item) ->
      buffer += "#{item.value}"
      buffer += delimeter if item.next?

    "<#{buffer}>"

  toString: -> @join ", "

class DoublyLinkedList extends LinkedList
  add: (values...) ->
    @_size += values.length
    values.forEach (value) =>
      node = new Node(value)
      if @head?
        last = @end()
        last.next = node
        node.prev = last
      else
        @head = node
  delete: (value) ->
    if @head?.value == value
      @head = @head.next
      @head.prev = null
      @_size--
    else
      current = @head
      current = current.next while current.next? and current.value != value
      [next, prev] = [current.next, current.prev]
      prev.next = next if prev?
      next.prev = prev if next?
      @_size--

class List
  constructor: -> @storage = []
  add: (values...) -> values.forEach (value) => @storage.push value
  find: (value) -> @storage[@storage.indexOf(value)]
  values: -> @storage
  delete: (value) -> @storage.splice @storage.indexOf(value), 1
  toString: -> "<#{@join ", "}>"
  join: (delimeter) -> @storage.join delimeter
  size: -> @storage.length
  clear: -> @storage = []

@LinkedList       = LinkedList
@DoublyLinkedList = DoublyLinkedList
@List             = List
