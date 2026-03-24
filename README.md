# Leanlings

Learn Lean 4 by fixing 69 small exercises, one at a time.

## Getting started

Install [elan](https://github.com/leanprover/elan) (the Lean version manager), then:

```
git clone https://github.com/samuelschlesinger/leanlings.git
cd leanlings
lake build
lake exe leanlings watch
```

Open the exercise file shown in your editor, fix the code, and save.
The watcher will check your solution automatically and move to the next exercise.

## Commands

```
lake exe leanlings           # show current exercise
lake exe leanlings run       # check current exercise
lake exe leanlings watch     # auto-check on save
lake exe leanlings hint      # show a hint
lake exe leanlings solution  # show the solution
lake exe leanlings list      # list all exercises
lake exe leanlings next      # skip to next exercise
lake exe leanlings reset     # reset current exercise
lake exe leanlings verify    # check all exercises
```

## License

MIT
