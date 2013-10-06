{formatParserError} = require './helpers'
Nodes = require './nodes'
{Preprocessor} = require './preprocessor'
Parser = require './parser'
{Optimiser} = require './optimiser'
{Compiler} = require './compiler'
cscodegen = try require 'cscodegen'
escodegen = try require 'escodegen'


pkg = require './../package.json'

escodegenFormat =
  indent:
    style: '  '
    base: 0
  renumber: yes
  hexadecimal: yes
  quotes: 'auto'
  parentheses: no


guess_expr_type = (expr) ->
  if (typeof expr.data) is 'number'
    'number'
  else if (typeof expr.data) is 'string'
    'string'
  else
    'any'

scope = {}
typecheck = (cs_ast) ->
  console.log cs_ast.body.statements
  for {assignee, expression} in cs_ast.body.statements when assignee? and expression?
    # 型識別子が存在せず、既にそのスコープで宣言済みの型である場合、再度型推論する
    if scope[assignee.data]?
      infered_type = guess_expr_type expression
      registered_type = scope[assignee.data].toLowerCase()
      unless registered_type is infered_type
        throw new Error "'#{assignee.data}' is expected to #{registered_type} indeed #{infered_type}"

    # 型識別子が存在する場合スコープに追加する
    assigned_type = assignee.annotation?.type
    if assigned_type
      infered_type = guess_expr_type expression
      if assigned_type.toLowerCase() is infered_type
        scope[assignee.data] = assignee.annotation.type
      else
        throw new Error "'#{assignee.data}' is expected to #{assignee.annotation.type} indeed #{infered_type}"
  console.log scope



CoffeeScript =

  CoffeeScript: CoffeeScript
  Compiler: Compiler
  Optimiser: Optimiser
  Parser: Parser
  Preprocessor: Preprocessor
  Nodes: Nodes

  VERSION: pkg.version

  parse: (coffee, options = {}) ->
    try
      preprocessed = Preprocessor.process coffee, literate: options.literate
      parsed = Parser.parse preprocessed,
        raw: options.raw
        inputSource: options.inputSource
      typecheck parsed
      if options.optimise then Optimiser.optimise parsed else parsed
    catch e
      throw e unless e instanceof Parser.SyntaxError
      throw new Error formatParserError preprocessed, e

  compile: (csAst, options) ->
    (Compiler.compile csAst, options).toBasicObject()

  # TODO
  cs: (csAst, options) ->
    # TODO: opt: format (default: nice defaults)

  jsWithSourceMap: (jsAst, name = 'unknown', options = {}) ->
    # TODO: opt: minify (default: no)
    throw new Error 'escodegen not found: run `npm install escodegen`' unless escodegen?
    unless {}.hasOwnProperty.call jsAst, 'type'
      jsAst = jsAst.toBasicObject()
    targetName = options.sourceMapFile or (options.sourceMap and (options.output.match /^.*[\\\/]([^\\\/]+)$/)[1])
    escodegen.generate jsAst,
      comment: not options.compact
      sourceMapWithCode: yes
      sourceMap: name
      file: targetName or 'unknown'
      format: if options.compact then escodegen.FORMAT_MINIFY else options.format ? escodegenFormat

  js: (jsAst, options) -> (@jsWithSourceMap jsAst, null, options).code
  sourceMap: (jsAst, name, options) -> (@jsWithSourceMap jsAst, name, options).map

  # Equivalent to original CS compile
  cs2js: (input, options = {}) ->
    options.optimise ?= on
    csAST = CoffeeScript.parse input, options
    jsAST = CoffeeScript.compile csAST, bare: options.bare
    CoffeeScript.js jsAST, compact: options.compact or options.minify


module.exports = CoffeeScript

if require.extensions?['.node']?
  CoffeeScript.register = -> require './register'
