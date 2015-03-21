noop = (val) -> val

decorate = (val) ->
  return val if val.__esperar
  return val: val, __esperar: true

eFn = (fn) -> (val) -> fn decorate val

eEvaluator = (fn) -> eFn (val) -> 
  val.evaluator = fn
  val

igual = eEvaluator (x, y) -> x == y 

que = eFn noop
es = eFn noop
a = eFn noop

esperoQue = (sbj) -> eFn (eObj) ->
  obj = eObj.val
  throw "Expectation failed" if not eObj.evaluator sbj, obj



esperoQue(2) es igual a 3

console.log("no fails!")