/-!
# Homework #3

Near final DRAFT. 

## Overview and Rules

The purpose of this homework is to strengthen your
understanding of function composition and of enumerated
and product data types. 

The collaboration rule for this homework is that
you may *not* collaborate. You can ask friends and
colleagues to help you understand material in the
class notes, but you may not discuss any aspect
of this homework itself with anyone other than one
of the instructors or TAs. Why? Because *you* need
to learn this material to pass the exam to come.
-/

/-!
## Problem #1

Define a function of the following polymorphic type:
{α β γ : Type} → (β → γ) → (α → β) → (α → γ). Call it
*funkom*. After the implicit type arguments it should
take two function arguments and return a function as
a result. 
-/

-- Answer below
def funkom {a β y : Type}
 (g : β → y) 
 (f : a → β ) :
  a → y :=
λ x, g (f x)

def funkom {α β γ : Type} 
a, β, y, g, f => fun (a: a) => ()
/-! 
## Problem #2

Define a function of the following polymorphic type:
{α β : Type} → (a : α) → (b : β) → α × β. Call it mkop.
-/

-- Answer below
def mkop {a β : Type} (a: a) (b : β) : prod a β
(a, b)


/-! 
## Problem #3

Define a function of the following polymorphic type:
{α β : Type} → α × β → α. Call it op_left.
-/

-- Answer below

def op_left {a β : Type} (pair : a × β) : a :=
pair.1

/-! 
## Problem #4

Define a function of the following polymorphic type:
{α β : Type} → α × β → β. Call it op_right.
-/

-- Answer below
def op_right {a β : Type} (pair : a × β) : β :=
pair.2


/-! 
## Problem #5

Define a data type called *Day*, the values of which
are the names of the seven days of the week: *sunday,
monday,* etc. 

Some days are work days and some days are play
days. Define a data type, *kind*, with two values,
*work* and *play*.

Now define a function, *day2kind*, that takes a *day*
as an argument and returns the *kind* of day it is as
a result. Specify *day2kind* so that weekdays (monday
through friday) are *work* days and weekend days are
*play* days.

Next, define a data type, *reward*, with two values,
*money* and *health*.

Now define a function, *kind2reward*, from *kind* to 
*reward* where *reward work* is *money* and *reward play* 
is *health*.

Finally, use your *funkom* function to produce a new
function that takes a day and returns the corresponding
reward. Call it *day2reward*.

Include test cases using #reduce to show that the reward
from each weekday is *money* and the reward from a weekend
day is *health*.
-/

inductive days: Type
| Monday
| Tuesday  
| Wednesday  
| Thursday
| Friday
| Saturday
| Sunday

inductive kind : Type
| work
| play


def day2kind (d : days) : kind :=
match d with 
| days.Monday => kind.work
| days.Tuesday => kind.work
| days.Wednesday => kind.work
| days.Thursday => kind.work
| days.Friday => kind.work
| days.Saturday => kind.play
| days.Sunday => kind.play

inductive reward : Type
| money
| health

def kind2reward (k : kind) : reward :=
match k with
| kind.work => reward.money
| kind.play => reward.health

def day2reward : days → reward :=
funkom kind2reward day2kind 

#reduce day2reward days.Monday

/-!

## Problem #6

### A. 
Consider the outputs of the following #check commands. 
-/

#check Nat × Nat × Nat
#check Nat × (Nat × Nat)
#check (Nat × Nat) × Nat

/-!
Is × left associative or right associative? Briefly explain
how you reached your answer.

Answer here: 
The × operator in Lean, representing the Cartesian product of types, is left associative.
 #check Nat × Nat × Nat is checking the type of the expression Nat × Nat × Nat. The output shows that it is 
 interpreted as (Nat × Nat) × Nat, meaning the first two Nat types are combined into a single function
 before being combined with the third Nat.
### B.
Define a function, *triple*, of the following type:
{ α β γ : Type } → α → β → γ → (α × β × γ)  
-/

-- Here:
def triple {α β γ : Type} (a : α) (b : β) (c : γ) : α × β × γ :=
  (a, b, c)
/-!
### C.
Define three functions, call them *first*, *second*, 
and *third*, each of which takes any such triple as
an argument and that returns, respectively, its first,
second, or third elements.
-/

-- Here:
def first {α β γ : Type} : α × β × γ → α
| (a, _, _) => a

def second {α β γ : Type} : α × β × γ → β
| (_, b, _) => b

def third {α β γ : Type} : α × β × γ → γ
| (_, _, c) => c
/-!
### D.
Write three test cases using #eval to show that when 
you apply each of these "elimination" functions to a
triple (that you can make up) it returns the correct
element of that triple.  
-/

-- Here:
def myTriple : ℕ × string × bool := (42, "Hello, World!", true)

-- Test cases
#eval first myTriple
#eval second myTriple
#eval third myTriple
/-!
### E.
Use #check to check the type of a term. that you make 
up, of type (Nat × String) × Bool. The challenge here
is to write a term of that type. 
-/

def myTerm : (ℕ × string) × bool := ((42, "Hello, World!"), true)

#check myTerm


