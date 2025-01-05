
# Rect

Rect produces a repetitive function that has the min value and the max value only. No intervals. 
The max value is the sum of base point and variation. Eg 1/4 + 3/4 (=1) in this example:

```scheme
(at (rectratio 1/4 3/4 1/16) 0 ;; cycle between two downbeat values
    (play piano3 
		(mkrel C3 (cosr (cosr 5 4 .02) (cosr 5 5 7/2)  1/39) 'm) ;; use intervals of C3
        (cosr 25 15 1) 1)
	)
```

This allows to produce cycled loops with two values only. 
Tip: operate the pitch cosr frequency to generate different notes eg. (cosr 5 5 1/2)

Make it more interesting by introducing a random offset to make it sounds more natural: 

```scheme
(at (rectratio 1/4 3/4 1/16) 0 
    (play (random '(1/4 1/8 0 0)) ;; random offset
		;; (cosratio 1/2 1/2 1/4) ;; cosr offset
		piano3 
		(mkrel C3 (cosr (cosr 5 4 .02) (cosr 5 5 7/2)  1/39) 'm) 
        (cosr 25 15 1) 1)
	)
```

