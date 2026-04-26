/- # Classical Logic 1: Excluded Middle

  Lean supports classical reasoning via:
  • `Classical.em (P : Prop) : P ∨ ¬P` — excluded middle
  • `Classical.byContradiction : (¬P → False) → P`
  • `Decidable.decide` for decidable props

  Not all propositions are decidable constructively,
  but classically, every proposition is either true or false.

  TODO: Prove using classical reasoning.
-/

-- Every proposition is either true or false
theorem em_example (P : Prop) : P ∨ ¬P :=
  Classical.em P

-- Double negation elimination (needs classical logic)
theorem dne (P : Prop) (h : ¬¬P) : P := by
  let f := fun (hnp : ¬P) => by exact h hnp
  exact Classical.byContradiction f

-- Proof by contradiction
theorem by_contradiction_example (P Q : Prop) (h : ¬P → Q) (hnq : ¬Q) : P := by
  let f : ¬P → False := fun (hnp : ¬P) => by
    have hq : Q := by apply h hnp
    let x := And.intro hq hnq
    nomatch x
  exact Classical.byContradiction f
