module.exports = exit =
  fail    : (args...) ->
    console.error args...
    process.exit 1
  success : (args...) ->
    console.log args...
    process.exit 0
