subs = []

ps =
  publish : (nume, data) ->
    ps.call_ key, nume, data for key in subs
    false

  subscribe : (nume_, func_) ->
    subs.push
      nume: nume_
      func: func_
    false

  call_ : (obj, nume_, data_) ->
    if obj.nume == nume_
      obj.func.call null, data_
      false



handler = (value) ->
  console.log value
  false

ps.subscribe("add", handler)
ps.publish "add", "just a value"