# Game of Life

A fun challenge I took while reading Corey Haines' "Understanding the Four Rules of Simple Design". While I couldn't follow all the possible examples he gave, I did try my best to extract and separate knowledge between classes and use TDD to drive the design.

(_Full Disclosure: there was a lot of `binding.pry` debugging going on, some even driving the testing. I'm not sure if that leads to bad habits, but for this project, it really helped to visualize changes to the Cell Grid within the REPL._)

**Some Issues:**

* I spent way too long on the idea of a Location class:
  - The location class will have _all_ knowledge of the x and y axis, while letting the cell (or board) know of neighboring cells.
  - At some point, it felt like I was extracting too much for the sake of extraction, so I scrapped it. I do plan on revisiting this idea in a separate working branch; it was just taking too much time.
  

## To Test:

1. Clone with `git clone https://github.com/mcshakes/game_of_life_ruby.git`.
2. CD into the directory.
3. Run `bundle install`
4. Run `rspec`

## Possible Next Steps:
1. Clean up that ugly World.live_neighbors method.
2. (*A more exciting prospect*) Implement visual representation, including a seeder(?) that spits out different cell variations: to be shown on either terminal CLI, or (even better) the browser.
