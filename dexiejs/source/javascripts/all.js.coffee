#= require_tree .

$ ->
  db = new Dexie 'todolist'
  db.version(1).stores
    todos: '++id,description,completed,createdAt,completedAt'

  db.open()
  todolist = $('#todolist')

  addTodo = (description) ->
    createdAt = (new Date()).getTime()
    db.todos.add
      description: description
      createdAt: createdAt
    .then (id) ->
      db.todos.get id
    .then (todo) ->
      insertTodo todo

  insertTodo = (todo) ->
    li = $('<li>')
    li.attr 'id', "todo_#{todo.id}"

    input = $('<input>')
    input.attr 'type', 'checkbox'
    input.attr 'id', "todo_complete_#{todo.id}"
    li.append input

    span = $('<span>')
    span.text "#{todo.description} #{todo.createdAt}"
    li.append span

    todolist.append li

  listTodo = ->
    db.todos.each (todo) ->
      insertTodo todo

  completeTodo = (e) ->
    console.log e.target

  $('#add').click (e) ->
    addTodo $('input:first').val()

  $('input').change (e) ->
    console.log 1

  listTodo()
