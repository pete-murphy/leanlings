/- # Tactics 2: apply and constructor

  • `apply f` — if the goal is `B` and `f : A → B`,
    changes the goal to `A` (working backwards).

  • `constructor` — splits a goal `A ∧ B` into two subgoals.
    Also works for other multi-constructor types.

  TODO: Complete the proofs.
-/

-- Use `apply` to work backwards
theorem apply_example (P Q : Prop) (hp : P) (f : P → Q) : Q := by
  apply f hp

-- Use `constructor` to split ∧, then prove each part
theorem and_intro (P Q : Prop) (hp : P) (hq : Q) : P ∧ Q := by
  constructor
  exact hp
  exact hq

-- For the next theorem, you can access parts of `h : P ∧ Q`
-- using `h.left` (or `h.1`) and `h.right` (or `h.2`).

-- Combine constructor and apply
theorem and_swap (P Q : Prop) (h : P ∧ Q) : Q ∧ P := by
  constructor
  apply h.2
  exact h.1

-- theorem and_swap_2 (P Q R : Prop) (h : P ∧ Q) (f : Q ∧ P → R) : R := by
--   apply f
--   constructor
--   exact h.2
--   exact h.1
