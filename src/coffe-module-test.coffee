module.exports.hello = (name) ->
  myName = (val) ->
    return "Hello #{val}"

  return myName(name)

myworld = module.exports.world = (val) ->
  if (val == 'test')
    return "Test";
  else
    if (val == 'Hallo')
      return "Hallo"
    else
      if (val == 'Huhu')
        return "Huhu"
      else
        return "Nichts"

console.log myworld()
