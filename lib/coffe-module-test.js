var myworld;

module.exports.hello = function(name) {
  var myName;
  myName = function(val) {
    return "Hello " + val;
  };
  return myName(name);
};

myworld = module.exports.world = function(val) {
  if (val === 'test') {
    return "Test";
  } else {
    if (val === 'Hallo') {
      return "Hallo";
    } else {
      if (val === 'Huhu') {
        return "Huhu";
      } else {
        return "Nichts";
      }
    }
  }
};

console.log(myworld());
