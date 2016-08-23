{ Rnd } = require "../randomGenerators.coffee"
rnd = new Rnd()

{ re } = require "../RegExs.coffee"

nerdamer = require "/imports/modules/nerdamer/nerdamer.core.js"
require "/imports/modules/nerdamer/Solve.js"

exports.linearEquationGenerator =

  linGl1 : (level = 1) ->
    switch level
      when 1
        x = "x"
        maxN = 9
      else
        x = rnd.letter()
        maxN = 20
    a = rnd.intPlus maxN
    b = rnd.int maxN
    op = rnd.opStrich()
    problem = "#{x}#{op}#{a}=#{b}"
    #return
    problem : problem
    solution : "#{x}=" + nerdamer.solveEquations(problem, x).toString()
    description : "Löse die Gleichung für #{x}:"

  linGl2 : (level = 1) ->
    switch level
      when 1
        x = "x"
        maxN = 9
      else
        x = rnd.letter()
        maxN = 20
    a = rnd.int2Plus maxN
    b = rnd.int maxN
    problem = "#{a}#{x}=#{b}"
    #return
    problem : problem
    solution : "#{x}=" + nerdamer.solveEquations(problem, x).toString()
    description : "Löse die Gleichung für #{x}:"

  linGl3 : (level = 1) ->
    switch level
      when 1
        x = "x"
        maxN = 9
      else
        x = rnd.letter()
        maxN = 20
    a = rnd.intPlus maxN
    b = rnd.int2Plus maxN
    c = rnd.int maxN
    op1 = rnd.opMinus()
    op2 = rnd.opStrich()
    op3 = rnd.opMinus()
    problem = "#{op1}#{a}#{op2}#{b}#{x}=#{op3}#{c}"
    #return
    problem : problem
    solution : "#{x}=" + nerdamer.solveEquations(problem, x).toString()
    description : "Löse die Gleichung für #{x}:"

  linGl4 : (level = 1) ->
    switch level
      when 1
        x = "x"
        maxN = 9
      else
        x = rnd.letter()
        maxN = 20
    op1 = rnd.opMinus()
    op2 = rnd.opStrich()
    op3 = rnd.opMinus()
    op4 = rnd.opStrich()
    [a, c] = rnd.intsPlus maxN
    [b, d] = rnd.uniqueInts2Plus maxN
    problem = "#{op1}#{a}#{op2}#{b}#{x}=#{op3}#{c}#{op4}#{d}#{x}"
    #return
    problem : problem
    solution : "#{x}=" + nerdamer.solveEquations(problem, x).toString()
    description : "Löse die Gleichung für #{x}:"

  linGl5 : (level = 1) ->
    switch level
      when 1
        x = "x"
        maxN = 9
      else
        x = rnd.letter()
        maxN = 20
    op1 = rnd.opMinus()
    op2 = rnd.opStrich()
    op3 = rnd.opMinus()
    op4 = rnd.opStrich()
    [a, c] = rnd.uniqueInts2Plus maxN
    [b, d] = rnd.intsPlus maxN
    problem = "#{op1}#{a}*(#{x}#{op2}#{b})=#{op3}#{c}*(#{x}#{op4}#{d})"
    #return
    problem : problem
    problemTeX :"#{op1}#{a}(#{x}#{op2}#{b})=#{op3}#{c}(#{x}#{op4}#{d})"
    solution : "#{x}=" + nerdamer.solveEquations(problem, x).toString()
    description : "Löse die Gleichung für #{x}:"

  linGl6 : (level = 1) ->
    switch level
      when 1
        x = "x"
        maxN = 9
      else
        x = rnd.letter()
        maxN = 20
    [op1, op2, op3, op4] = (rnd.opStrich() for i in [1..4])
    [c, e] = rnd.uniqueInts2Plus maxN
    [a, b, d, f] = rnd.intsPlus maxN
    problem = "#{a}#{op1}(#{b}#{op2}#{c}#{x})=#{d}#{op3}(#{e}#{x}#{op4}#{f})"
    #return
    problem : problem
    problemTeX : problem #keep brackets
    solution : "#{x}=" + nerdamer.solveEquations(problem, x).toString()
    description : "Löse die Gleichung für #{x}:"

  linGl7 : (level = 1) ->
    switch level
      when 1
        x = "x"
        maxN = 9
      when 2
        x = rnd.letter()
        maxN = 15
      else
        x = rnd.letter()
        maxN = 20
    [a, c, e] = rnd.uniqueInts2Plus maxN
    [b, d] = rnd.intsPlus maxN
    op1 = rnd.opStrich()
    op2 = rnd.opStrich()
    head = rnd.bool()
    leftSide = "#{a}*(#{x}#{op1}#{b})"
    leftSideTeX = "#{a}(#{x}#{op1}#{b})"
    rightSide = "(#{c}#{x}#{op2}#{d})/#{e}"
    rightSideTeX ="\\frac{#{c}#{x}#{op2}#{d}}{#{e}}"
    if head then [leftSideTeX, rightSideTeX] = [rightSideTeX, leftSideTeX]
    problem = "#{leftSide}=#{rightSide}"
    #return
    problem : problem
    problemTeX : "#{leftSideTeX}=#{rightSideTeX}"
    solution : "#{x}=" + nerdamer.solveEquations(problem, x).toString()
    description : "Löse die Gleichung für #{x}:"
