#lang racket

2.14 -
Lem is right in saying that 2 different ways to compute interval arithmetic would lead to different answers.
this happens majorly because when we divide same quantity with itself instead of giving answer as 1,
it introduces the uncertainity associated with interval divisions to the answer.
but when we solve expressions with cases where same terms are not involved with each other this problem does not
arise and we get a different answer than before.


2.15 -
Same as 2.14 if we do not have terms having uncertainity repeated in our expression. we will not get uncertain results for
same term arithmetic , which in turn will produce tighter error bounds.
therefore of the 2 parts given to calculate parallel resistances part2 is better because it has no repetition of
interva terms.


2.16 -
It is not entirely possible to to devise an interval arithmetic package that does not have shortcomings like the once descibed above.
the best we can do is to simplify each expression so as to reduce it to a form that uses each interval term only once.
but practically it is not possible to do so every time for each expression.