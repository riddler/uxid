


const { createToken: buildToken, Lexer } = require('chevrotain')

//-----------------------------------------------------------------------------
// Utils
//-----------------------------------------------------------------------------

const allTokens = []
const tokensDictionary = {}

function addToken (token) {
  allTokens.push(token)
  tokensDictionary[token.name] = token
}

const createToken = function() {
  const newToken = buildToken.apply(null, arguments)
  addToken(newToken)
  return newToken
}


//-----------------------------------------------------------------------------
// Tokens
//-----------------------------------------------------------------------------

const IBoolean = createToken({ name: 'IBoolean', pattern: Lexer.NA })
const IDataType = createToken({ name: 'IDataType', pattern: Lexer.NA })
const IUnaryOperator = createToken({ name: 'IUnaryOperator', pattern: Lexer.NA })
const IBinaryOperator = createToken({ name: 'IBinaryOperator', pattern: Lexer.NA })
const ILogicalOperator = createToken({ name: 'ILogicalOperator', pattern: Lexer.NA })
const ISetOperator = createToken({ name: 'ISetOperator', pattern: Lexer.NA })
const IRelationalOperator = createToken({ name: 'IRelationalOperator', pattern: Lexer.NA })
const IMatchesOperator = createToken({ name: 'IMatchesOperator', pattern: Lexer.NA })

const IInteger = createToken({ name: 'IInteger', pattern: Lexer.NA })
createToken({ name: 'DecimalInt', pattern: /-?(0|[1-9]\d*)/, categories: [IInteger] })

const IString = createToken({ name: 'IString', pattern: Lexer.NA })
createToken({
  name: 'String',
  pattern: /(["'])[^]*?\1/,
  categories: [IString]
})


//-----------------------------------------------------------------------------
// Public API
//-----------------------------------------------------------------------------

module.exports = {
  tokensArray: allTokens,
  tokensDictionary
}



//-----
//-----[ Lexical Tokens ]----------------------------------------
//-----

// Punctuation
createToken({ name: "LParen", pattern: "(" })
createToken({ name: "RParen", pattern: ")" })
createToken({ name: "LSquare", pattern: "[" })
createToken({ name: "RSquare", pattern: "]" })
createToken({ name: "Dot", pattern: "." })
createToken({ name: "ColonColon", pattern: /::/ })
createToken({ name: "Equal", pattern: "=", categories: [IRelationalOperator] })
createToken({ name: "NotEqual", pattern: "!=", categories: [IRelationalOperator] })
createToken({ name: "GTE", pattern: ">=", categories: [IRelationalOperator] })
createToken({ name: "GT", pattern: ">", categories: [IRelationalOperator] })
createToken({ name: "LTE", pattern: "<=", categories: [IRelationalOperator] })
createToken({ name: "LT", pattern: "<", categories: [IRelationalOperator] })
createToken({ name: "Exclamation", pattern: "!", categories: [IUnaryOperator] })

// Identifiers (Variables) and Keywords
// We need to create the Identifier, but can not add it to the Token list
// until all other Keywords have been added.
// This is why buildToken is used (not createToken which adds them to the list)

// const Identifier = buildToken({
//   name: 'Identifier',
//   pattern: /[a-z][_0-9A-Za-z]+/
// })

const Variable = buildToken({
  name: "Variable",
  pattern: /[a-z][_0-9A-Za-z]*(?:\.[a-z][_0-9A-Za-z]*)*/
})


// Constant Literals
createNamedToken({ name: "True", pattern: "true", categories: [IBoolean] })
createNamedToken({ name: "False", pattern: "false", categories: [IBoolean] })
createNamedToken({ name: "Null", pattern: "null" })
createNamedToken({ name: "Undefined", pattern: "undefined" })

// Keywords
createNamedToken({ name: 'Bool', pattern: /bool/, categories: [IDataType] })


// Operators and other special tokens
createNamedToken({ name: 'Or', pattern: /or/, categories: [IBinaryOperator, ILogicalOperator] })
createNamedToken({ name: 'And', pattern: /and/, categories: [IBinaryOperator, ILogicalOperator] })

const Contains = createNamedToken({ name: 'Contains', pattern: /contains/, categories: [IBinaryOperator, ISetOperator] })
Contains.INSTRUCTION = "contains"
const NotContains = createNamedToken({ name: 'NotContains', pattern: /not\s+contains/, categories: [IBinaryOperator, ISetOperator] })
NotContains.INSTRUCTION = "not_contains"

const In = createNamedToken({ name: 'In', pattern: /in/, categories: [IBinaryOperator, ISetOperator] })
In.INSTRUCTION = "in"
const NotIn = createNamedToken({ name: 'NotIn', pattern: /not\s+in/, categories: [IBinaryOperator, ISetOperator] })
NotIn.INSTRUCTION = "not_in"

const IsNot = createNamedToken({ name: 'IsNot', pattern: /is\s+not/, categories: [IBinaryOperator, IRelationalOperator] })
IsNot.COMPARISON = "!="
const Is = createNamedToken({ name: 'Is', pattern: /is/, categories: [IBinaryOperator, IRelationalOperator] })
Is.COMPARISON = "="

const Matches = createNamedToken({ name: 'Matches', pattern: /matches/, categories: [IMatchesOperator] })
Matches.INSTRUCTION = "matches"
const NotMatches = createNamedToken({ name: 'NotMatches', pattern: /not\s+matches/, categories: [IMatchesOperator] })
NotMatches.INSTRUCTION = "not_matches"

createNamedToken({ name: 'Not', pattern: /not/, categories: [IUnaryOperator] })

// EQ.INSTRUCTION = 'EQ'
// NEQ.INSTRUCTION = 'NEQ'
// GT.INSTRUCTION = 'GT'
// GTE.INSTRUCTION = 'GTE'
// LT.INSTRUCTION = 'LT'
// LTE.INSTRUCTION = 'LTE'



// Now that all the keywords have been defined, manually add the Variable
addToken(Variable)



// const Query = createNamedToken({ name: "Query", pattern: "query" })
// const Mutation = createNamedToken({
//   name: "Mutation",
//   pattern: "mutation"
// })
// const Subscription = createNamedToken({
//   name: "Subscription",
//   pattern: "subscription"
// })
// const Fragment = createNamedToken({
//   name: "Fragment",
//   pattern: "fragment"
// })
// const On = createNamedToken({ name: "On", pattern: "on" })
// const True = createNamedToken({ name: "True", pattern: "true" })
// const False = createNamedToken({ name: "False", pattern: "false" })
// const Null = createNamedToken({ name: "Null", pattern: "null" })
// const Schema = createNamedToken({ name: "Schema", pattern: "schema" })
// const Extend = createNamedToken({ name: "Extend", pattern: "extend" })
// const Scalar = createNamedToken({ name: "Scalar", pattern: "scalar" })
// const Implements = createNamedToken({
//   name: "Implements",
//   pattern: "implements"
// })
// const Interface = createNamedToken({
//   name: "Interface",
//   pattern: "interface"
// })
// const Union = createNamedToken({ name: "Union", pattern: "Union" })
// const Enum = createNamedToken({ name: "Enum", pattern: "enum" })
// const Input = createNamedToken({ name: "Input", pattern: "Input" })
// const DirectiveTok = createNamedToken({
//   name: "DirectiveTok",
//   pattern: "directive"
// })
// const TypeTok = createNamedToken({ name: "TypeTok", pattern: "type" })




// const Colon = createToken({ name: "Colon", pattern: ":" })
// const Equals = createToken({ name: "Equals", pattern: "=" })
// const At = createToken({ name: "At", pattern: "@" })
// const LCurly = createToken({ name: "LCurly", pattern: "{" })
// const VerticalLine = createToken({ name: "VerticalLine", pattern: "|" })
// const RCurly = createToken({ name: "RCurly", pattern: "}" })


// function createAndAddToken (options) {
//   const newTokenType = createToken(options)
//   addToken(newTokenType)
//   return newTokenType
// }


// createAndAddToken({ name: 'Dot', pattern: '.' })
// createAndAddToken({
//   name: 'Variable',
//   pattern: /[a-z]\w+(\.[a-z]\w+)*/,
//   categories: [IVariable]
// })



// // We need to create the Identifier early, but add it last
// // See https://github.com/SAP/chevrotain/blob/master/examples/lexer/keywords_vs_identifiers/keywords_vs_identifiers.js
// Identifier = createToken({
//   name: 'Identifier',
//   pattern: /[a-z]\w+/
// })





// createAndAddToken({ name: 'Dot', pattern: '.' })
// createAndAddToken({
//   name: 'Variable',
//   pattern: /[a-z]\w+(\.[a-z]\w+)*/,
//   categories: [IVariable]
// })



////
//// Constants
////
//const IBoolean = createAndAddToken({ name: 'IBoolean', pattern: Lexer.NA })
//const LitTrue = createAndAddToken({ name: 'True', pattern: /true/, categories: [IBoolean], longer_alt: Identifier })
//const LitFalse = createAndAddToken({ name: 'False', pattern: /false/, categories: [IBoolean], longer_alt: Identifier })
//LitUndefined = createAndAddToken({ name: 'Undefined', pattern: /undefined/, longer_alt: Identifier })
//LitNull = createAndAddToken({ name: 'Null', pattern: /null/, longer_alt: Identifier })




// const IRelationalOperator = createAndAddToken({ name: 'IRelationalOperator', pattern: Lexer.NA })
// const EQ = createAndAddToken({ name: 'EQ', pattern: /=/, categories: [IRelationalOperator] })
// const NEQ = createAndAddToken({ name: 'NEQ', pattern: /!=/, categories: [IRelationalOperator] })
// const GTE = createAndAddToken({ name: 'GTE', pattern: />=/, categories: [IRelationalOperator] })
// const GT = createAndAddToken({ name: 'GT', pattern: />/, categories: [IRelationalOperator] })
// const LTE = createAndAddToken({ name: 'LTE', pattern: /<=/, categories: [IRelationalOperator] })
// const LT = createAndAddToken({ name: 'LT', pattern: /</, categories: [IRelationalOperator] })


// createAndAddToken({ name: 'Or', pattern: /or/ })
// createAndAddToken({ name: 'And', pattern: /and/ })
// createAndAddToken({ name: 'Between', pattern: /between/ })
// const Bang = createAndAddToken({ name: 'Bang', pattern: /!/ })
// const LParen = createAndAddToken({ name: 'LParen', pattern: /\(/ })
// const RParen = createAndAddToken({ name: 'RParen', pattern: /\)/ })



// const IDate = createAndAddToken({ name: 'IDate', pattern: Lexer.NA })
// createAndAddToken({
//   name: 'Date',
//   pattern: /\d{4}[-/]\d{2}[-/]\d{2}/,
//   categories: [IDate]
// })

// const IInteger = createAndAddToken({ name: 'IInteger', pattern: Lexer.NA })
// createAndAddToken({
//   name: 'DecimalInt', pattern: /-?(0|[1-9]\d*)/, categories: [IInteger]
// })



// // Labels only affect error messages and Diagrams.
// Bang.LABEL = "'!'"
// LParen.LABEL = "'('"
// RParen.LABEL = "')'"

// EQ.LABEL = "'='"
// NEQ.LABEL = "'!='"
// GT.LABEL = "'>'"
// GTE.LABEL = "'>='"
// LT.LABEL = "'<'"
// LTE.LABEL = "'<='"

// // INSTRUCTION is used when generating instuctions
// True.INSTRUCTION = true
// False.INSTRUCTION = false

// EQ.INSTRUCTION = 'EQ'
// NEQ.INSTRUCTION = 'NEQ'
// GT.INSTRUCTION = 'GT'
// GTE.INSTRUCTION = 'GTE'
// LT.INSTRUCTION = 'LT'
// LTE.INSTRUCTION = 'LTE'




