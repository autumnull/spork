(use ../spork/test)
(import ../spork/misc)

(start-suite 1)

#misc/dedent
(assert (= (misc/dedent "  a\n    b\n   c\n     d") "a\n  b\n c\n   d") "dedent")

#misc/set*
(do
  (var x 2)
  (var y 3)
  (misc/set* [x y] [y (+ x y)])
  (assert (and (= x 3) (= y 5)) "set* 1"))

(do
  (def x @[2 3])
  (misc/set* [[x 0] [x 1]] [(in x 1) (+ (in x 0) (in x 1))])
  (assert (deep= x @[3 5])))

#misc/trim-prefix

(assert (= (misc/trim-prefix "someprefix" "someprefixsomeprefixandmore") "someprefixandmore"))
(assert (= (misc/trim-prefix "🗲" "🗲🗲this-is-a-unicode-test🗲") "🗲this-is-a-unicode-test🗲"))


#misc/trim-suffix

(assert (= (misc/trim-suffix "somesuffix" "someprefix-midpart-somesuffixsomesuffix") "someprefix-midpart-somesuffix"))

(assert (= (misc/trim-suffix "🗲" "🗲this-is-a-unicode-test🗲🗲") "🗲this-is-a-unicode-test🗲"))

(end-suite)
