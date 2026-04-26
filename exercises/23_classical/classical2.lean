/- # Classical Logic 2: Contrapositive

  The contrapositive of `P → Q` is `¬Q → ¬P`.
  Proving the contrapositive is often easier.

  Constructively: `(P → Q) → (¬Q → ¬P)` is always provable.
    (Given P, apply h to get Q, then ¬Q gives a contradiction.)

  Classically: `(¬Q → ¬P) → (P → Q)` needs `Classical.em`.
    (Given P, we need Q — but we can't compute Q from P.
     We must case-split: either Q holds, or ¬Q holds and
     then h gives ¬P, contradicting our P.)

  TODO: Prove both directions.
-/

-- Constructive direction (doesn't need classical logic)
theorem contrapositive (P Q : Prop) (h : P → Q) : ¬Q → ¬P := by
  intro hnq
  intro hp
  let hq := by apply h hp
  nomatch And.intro hq hnq

-- Classical direction (needs excluded middle)
theorem contrapositive_reverse (P Q : Prop) (h : ¬Q → ¬P) : P → Q := by
  intro hp
  cases Classical.em Q with
  | inl hq => exact hq
  | inr hnq =>
    let hnp : ¬P := by apply h hnq
    nomatch And.intro hnp hp

-- Apply contrapositive reasoning
theorem not_or_of_imp (P Q : Prop) (h : P → Q) : ¬P ∨ Q := by
  cases Classical.em P with
  | inl hp =>
    let hq := by apply h hp
    exact Or.inr hq
  | inr hnp =>
    exact Or.inl hnp
