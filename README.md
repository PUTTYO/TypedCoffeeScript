TypedCoffeeScript
==================================

yet another altjs developed by mizchi

## Examples

```coffeescript
struct Point {
  x :: Number
  y :: Number
}

p :: Point = {x: 3, y: 3}

f :: Number -> Number = (n :: Number) :: Number ->  n * n
console.log f 4
```

See test/type.coffee as working codes.

## CONCEPT

* Subset of CoffeeScript (all tests passed)
* Type check target is CS AST, not compiler.
* Inspired by TypeScript, Roy and other altjs.

## CAUTION

* extremely incomplete yet.
* bad way to hacking CS

CoffeeScript II: The Wrath of Khan
==================================

```
          {
       }   }   {
      {   {  }  }
       }   }{  {
      {  }{  }  }             _____       __  __
     ( }{ }{  { )            / ____|     / _|/ _|
   .- { { }  { }} -.        | |     ___ | |_| |_ ___  ___
  (  ( } { } { } }  )       | |    / _ \|  _|  _/ _ \/ _ \
  |`-..________ ..-'|       | |___| (_) | | | ||  __/  __/
  |                 |        \_____\___/|_| |_| \___|\___|       .-''-.
  |                 ;--.                                       .' .-.  )
  |                (__  \     _____           _       _       / .'  / /
  |                 | )  )   / ____|         (_)     | |     (_/   / /
  |                 |/  /   | (___   ___ _ __ _ _ __ | |_         / /
  |                 (  /     \___ \ / __| '__| | '_ \| __|       / /
  |                 |/       ____) | (__| |  | | |_) | |_       . '
  |                 |       |_____/ \___|_|  |_| .__/ \__|     / /    _.-')
   `-.._________..-'                           | |           .' '  _.'.-''
                                               |_|          /  /.-'_.'
                                                           /    _.'
                                                          ( _.-'
```

### Status

Complete enough to use for nearly every project. See the [roadmap to 2.0](https://github.com/michaelficarra/CoffeeScriptRedux/wiki/Roadmap).

### Getting Started

    npm install -g coffee-script-redux
    coffee --help
    coffee --js <input.coffee >output.js

Before transitioning from Jeremy's compiler, see the
[intentional deviations from jashkenas/coffee-script](https://github.com/michaelficarra/CoffeeScriptRedux/wiki/Intentional-Deviations-From-jashkenas-coffee-script)
wiki page.

### Development

    git clone git://github.com/michaelficarra/CoffeeScriptRedux.git && cd CoffeeScriptRedux && npm install
    make clean && git checkout -- lib && make -j build && make test

### Notable Contributors

I'd like to thank the following financial contributors for their large
donations to [the Kickstarter project](http://www.kickstarter.com/projects/michaelficarra/make-a-better-coffeescript-compiler)
that funded the initial work on this compiler.
Together, you donated over $10,000. Without you, I wouldn't have been able to do this.

* [Groupon](http://groupon.com/), who is generously allowing me to work in their offices
* [Trevor Burnham](http://trevorburnham.com)
* [Shopify](http://www.shopify.com)
* [Abakas](http://abakas.com)
* [37signals](http://37signals.com)
* [Brightcove](http://www.brightcove.com)
* [Gaslight](http://gaslight.co)
* [Pantheon](https://www.getpantheon.com)
* Benbria
* Sam Stephenson
* Bevan Hunt
* Meryn Stol
* Rob Tsuk
* Dion Almaer
* Andrew Davey
* Thomas Burleson
* Michael Kedzierski
* Jeremy Kemper
* Kyle Cordes
* Jason R. Lauman
* Martin Drenovac (Envizion Systems - Aust)
* Julian Bilcke
* Michael Edmondson

And of course, thank you [Jeremy](https://github.com/jashkenas) (and all the other
[contributors](https://github.com/jashkenas/coffee-script/graphs/contributors))
for making [the original CoffeeScript compiler](https://github.com/jashkenas/coffee-script).
