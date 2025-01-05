
# Random

Useful tips about the `random` function in Extempore. 

## Background

Apparently Standard Scheme does not provide a random number generator. But no worries, there are multiple ways to achieve that as discussed in this [SO thread](https://stackoverflow.com/questions/14674165/scheme-generate-random). 

Luckily Extempore comes with its own implementation of `random`. However, the [original Extempore version](https://extempore.michelepasin.org/def/random.html) always returns an integer when arguments are provided.  

That's not exactly what I wanted as in some situation I'd like to get a random float from any two numbers. 
So I made a version that does that:

```scheme linenums="1"
(define (random . args)
  (cond ((< (length args) 1)
         (random-real))
        ((list? (car args))
         (list-ref (car args) (random (length (car args)))))
        ((pair? (car args))
         (apply weighted-selection args))
        (else (let ((lower (if (> (length args) 1) (real->integer (car args)) 0))
                    (upper (if (> (length args) 1) (cadr args) (car args))))
                ;; if first arg is a float => return a float 
                (if (not (integer? (car args))) 
                    (+ (random-real) lower (random-int (- upper lower)))
                    (+ lower (random-int (- upper lower))))
                    ))))

```

I've updated it on lines 11-12, so that if the first argument it's a float, then it returns a float. 



## Random float

```scheme
(random) ; => 0.689383
```

Generates a float from 0 to 1. 


## Random from list

```scheme
(random (list 1 2 3 4)) ; => 2
```

Returns a random element from the list.

Heads up: symbols are evaluated before being returned!

```scheme
(let ((a 2) (b 3))
  (random (list a b))
    )
; => 2
```


## Random with boundaries

```scheme
(random 2 5) ; => 2
```

Returns a random integer from 2 to 5 (excluded). 

```scheme
(random 2.0 5) ; => 4.867424
```

Returns a random floating number from 2 to 5 (excluded). 


**Defaults** 

```scheme
(random 2) ; => 0 or 1
```

The second element is always 0, hence this returns a random integer from 0 to 2 (excluded). 

```scheme
(random 2.0) ; => 0.100261
```

The second element is always 0, hence this returns a random float from 0 to 2 (excluded). 


## Example 


<iframe width="560" height="315" src="https://www.youtube.com/embed/3tUL6t6_-zM?si=p3uvMNvUtY12Uoja" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>





