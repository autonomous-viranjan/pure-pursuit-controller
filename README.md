# Pure Pursuit Controller
- This repo containts a starter implementation of pure pursuit controller for lane changing
- Following is the derivation of the controller

  ![alt text](https://github.com/autonomous-viranjan/pure-pursuit-controller/blob/main/pure_pursuit_controller.jpg)

- Tuning parameters:
-   Speed dependent lookahead $`ld`$ params $`K_d`$, $`ld_min`$, $`ld_max`$
-   Vehicle wheelbase `L`
- Example abstract simulation
  ![alt text](https://github.com/autonomous-viranjan/pure-pursuit-controller/blob/main/example.png)
