/- # Cases and Have 1: Destructuring Hypotheses

  `cases h` destructs a hypothesis by its constructors:

  For `h : A ∧ B`:
    cases h with
    | intro left right => ...   -- gives left : A, right : B

  For `h : A ∨ B`:
    cases h with
    | inl ha => ...   -- case where A holds
    | inr hb => ...   -- case where B holds

  For `h : ∃ x, P x`:
    cases h with
    | intro w hw => ...  -- gives witness w and proof hw

  TODO: Prove using `cases`.
-/

-- And is commutative
theorem and_comm' (P Q : Prop) (h : P ∧ Q) : Q ∧ P := by
  cases h with
  | intro p q => exact And.intro q p

-- Or is commutative
theorem or_comm' (P Q : Prop) (h : P ∨ Q) : Q ∨ P := by
  cases h with
  | inl p => exact Or.inr p
  | inr q => exact Or.inl q

-- And distributes over Or (left)
theorem and_or_left' (P Q R : Prop) (h : P ∧ (Q ∨ R)) : (P ∧ Q) ∨ (P ∧ R) := by
  cases h with
  | intro p qr =>
    cases qr with
    | inl q => exact Or.inl ⟨p, q⟩
    | inr r => exact Or.inr ⟨p, r⟩
