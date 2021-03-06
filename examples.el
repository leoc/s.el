;; -*- lexical-binding: t; eval: (font-lock-add-keywords nil '(("defexamples\\|def-example-group\\| => " (0 'font-lock-keyword-face)))); -*-

;; Only the first three examples per function are shown in the docs,
;; so make those good.

(require 's)

(def-example-group "Shorten string"
  (defexamples s-truncate
    (s-truncate 6 "This is too long") => "Thi..."
    (s-truncate 16 "This is also too long") => "This is also ..."
    (s-truncate 16 "But this is not!") => "But this is not!")

  (defexamples s-left
    (s-left 3 "lib/file.js") => "lib"
    (s-left 3 "li") => "li")

  (defexamples s-right
    (s-right 3 "lib/file.js") => ".js"
    (s-right 3 "li") => "li")

  (defexamples s-chop-suffix
    (s-chop-suffix "-test.js" "penguin-test.js") => "penguin"
    (s-chop-suffix "\n" "no newlines\n") => "no newlines"
    (s-chop-suffix "\n" "some newlines\n\n") => "some newlines\n")

  (defexamples s-chop-suffixes
    (s-chop-suffixes '("_test.js" "-test.js" "Test.js") "penguin-test.js") => "penguin"
    (s-chop-suffixes '("\r" "\n") "penguin\r\n") => "penguin\r"
    (s-chop-suffixes '("\n" "\r") "penguin\r\n") => "penguin")
  )

(def-example-group "Tweak whitespace"
  (defexamples s-chomp
    (s-chomp "no newlines\n") => "no newlines"
    (s-chomp "no newlines\r\n") => "no newlines"
    (s-chomp "some newlines\n\n") => "some newlines\n")

  (defexamples s-trim
    (s-trim "trim ") => "trim"
    (s-trim " this") => "this"
    (s-trim " only  trims beg and end  ") => "only  trims beg and end")

  (defexamples s-trim-left
    (s-trim-left "trim ") => "trim "
    (s-trim-left " this") => "this")

  (defexamples s-trim-right
    (s-trim-right "trim ") => "trim"
    (s-trim-right " this") => " this")

  (defexamples s-collapse-whitespace
    (s-collapse-whitespace "only   one space   please") => "only one space please"
    (s-collapse-whitespace "collapse \n all \t sorts of \r whitespace") => "collapse all sorts of whitespace")

  (defexamples s-word-wrap
    (s-word-wrap 10 "This is too long") => "This is\ntoo long"
    (s-word-wrap 10 "This is way way too long") => "This is\nway way\ntoo long"
    (s-word-wrap 10 "It-wraps-words-but-does-not-break-them") => "It-wraps-words-but-does-not-break-them"))

(def-example-group "To and from lists"
  (defexamples s-lines
    (s-lines "abc\ndef\nghi") => '("abc" "def" "ghi"))

  (defexamples s-join
    (s-join "+" '("abc" "def" "ghi")) => "abc+def+ghi"
    (s-join "\n" '("abc" "def" "ghi")) => "abc\ndef\nghi")

  (defexamples s-concat
    (s-concat "abc" "def" "ghi") => "abcdefghi"))

(def-example-group "Predicates"
  (defexamples s-equals?
    (s-equals? "abc" "ABC") => nil
    (s-equals? "abc" "abc") => t)

  (defexamples s-matches?
    (s-matches? "^[0-9]+$" "123") => t
    (s-matches? "^[0-9]+$" "a123") => nil)

  (defexamples s-blank?
    (s-blank? "") => t
    (s-blank? nil) => t
    (s-blank? " ") => nil)

  (defexamples s-ends-with?
    (s-ends-with? ".md" "readme.md") => t
    (s-ends-with? ".MD" "readme.md") => nil
    (s-ends-with? ".MD" "readme.md" t) => t
    (s-ends-with? ".md" "md") => nil
    (s-suffix? ".md" "readme.md") => t)

  (defexamples s-starts-with?
    (s-starts-with? "lib/" "lib/file.js") => t
    (s-starts-with? "LIB/" "lib/file.js") => nil
    (s-starts-with? "LIB/" "lib/file.js" t) => t
    (s-starts-with? "lib/" "lib") => nil
    (s-prefix? "lib/" "lib/file.js") => t)

  (defexamples s-contains?
    (s-contains? "file" "lib/file.js") => t
    (s-contains? "nope" "lib/file.js") => nil
    (s-contains? "^a" "it's not ^a regexp") => t
    (s-contains? "FILE" "lib/file.js") => nil
    (s-contains? "FILE" "lib/file.js" t) => t)

  (defexamples s-lowercase?
    (s-lowercase? "file") => t
    (s-lowercase? "File") => nil
    (s-lowercase? "123?") => t)

  (defexamples s-uppercase?
    (s-uppercase? "HULK SMASH") => t
    (s-uppercase? "Bruce no smash") => nil
    (s-uppercase? "123?") => t)

  (defexamples s-mixedcase?
    (s-mixedcase? "HULK SMASH") => nil
    (s-mixedcase? "Bruce no smash") => t
    (s-mixedcase? "123?") => nil))

(def-example-group "The misc bucket"
  (defexamples s-repeat
    (s-repeat 10 " ") => "          "
    (s-concat (s-repeat 8 "Na") " Batman!") => "NaNaNaNaNaNaNaNa Batman!")

  (defexamples s-replace
    (s-replace "file" "nope" "lib/file.js") => "lib/nope.js"
    (s-replace "^a" "\\1" "it's not ^a regexp") => "it's not \\1 regexp")

  (defexamples s-downcase
    (s-downcase "ABC") => "abc")

  (defexamples s-upcase
    (s-upcase "abc") => "ABC")

  (defexamples s-capitalize
    (s-capitalize "abc DEF") => "Abc Def")

  (defexamples s-index-of
    (s-index-of "abc" "abcdef") => 0
    (s-index-of "CDE" "abcdef" t) => 2
    (s-index-of "n.t" "not a regexp") => nil))

(def-example-group "Pertaining to words"
  (defexamples s-split-words
    (s-split-words "under_score") => '("under" "score")
    (s-split-words "some-dashed-words") => '("some" "dashed" "words")
    (s-split-words "evenCamelCase") => '("even" "Camel" "Case")
    (s-split-words "!map (fn list)") => '("map" "fn" "list"))

  (defexamples s-lower-camel-case
    (s-lower-camel-case "some words") => "someWords"
    (s-lower-camel-case "dashed-words") => "dashedWords"
    (s-lower-camel-case "under_scored_words") => "underScoredWords")

  (defexamples s-upper-camel-case
    (s-upper-camel-case "some words") => "SomeWords"
    (s-upper-camel-case "dashed-words") => "DashedWords"
    (s-upper-camel-case "under_scored_words") => "UnderScoredWords")

  (defexamples s-snake-case
    (s-snake-case "some words") => "some_words"
    (s-snake-case "dashed-words") => "dashed_words"
    (s-snake-case "camelCasedWords") => "camel_cased_words")

  (defexamples s-dashed-words
    (s-dashed-words "some words") => "some-words"
    (s-dashed-words "under_scored_words") => "under-scored-words"
    (s-dashed-words "camelCasedWords") => "camel-cased-words")

  (defexamples s-capitalized-words
    (s-capitalized-words "some words") => "Some Words"
    (s-capitalized-words "under_scored_words") => "Under Scored Words"
    (s-capitalized-words "camelCasedWords") => "Camel Cased Words"))
