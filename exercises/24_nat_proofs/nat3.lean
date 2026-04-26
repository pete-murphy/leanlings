/- # Nat Proofs 3: Induction (Advanced)

  Building on the induction section, let's prove more
  substantial properties.

  For custom functions, you often need:
  1. `induction` to recurse on the structure
  2. `simp [function_name]` to unfold definitions
  3. The induction hypothesis `ih`
  4. `rw [lemma]` to rewrite with library lemmas

  Useful lemmas:
  - `Nat.mul_add` : a * (b + c) = a * b + a * c
  - `Nat.add_mul` : (a + b) * c = a * c + b * c
  - `Nat.mul_comm` : a * b = b * a

  TODO: Prove these properties using induction.
-/

-- Sum of first n natural numbers
def sumTo : Nat → Nat
  | 0 => 0
  | n + 1 => sumTo n + (n + 1)

-- Gauss's formula: sumTo n = n * (n + 1) / 2
-- Since we're using Nat (no fractions), prove the doubled version:
theorem sumTo_formula (n : Nat) : 2 * sumTo n = n * (n + 1) := by
  induction n with
  | zero => simp [sumTo]
  | succ _ ih =>
    -- TODO: this is so messy lol
    rw [sumTo]
    rw [Nat.mul_add]
    rw [ih]
    rw [Nat.mul_comm, Nat.add_mul, Nat.add_mul]
    simp
    rw [Nat.two_mul, Nat.add_add_add_comm, Nat.mul_add]
    simp
    rw [Nat.mul_add]
    omega

-- Sum is monotone
theorem sumTo_mono (n : Nat) : sumTo n ≤ sumTo (n + 1) := by
  induction n with
  | zero => simp [sumTo]
  | succ _ ih =>
    rw [sumTo, sumTo]
    omega
