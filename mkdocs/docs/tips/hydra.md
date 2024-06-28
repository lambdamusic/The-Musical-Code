
# Hydra Sketches


[Hydra](https://hydra.ojack.xyz/?sketch_id=eerie_ear_0) if a free tool to livecode visual patterns. 

> Hydra is live code-able video synth and coding environment that runs directly in the browser. It is free and open-source and made for beginners and experts alike.


## Reusable snippets 

One of the coolest aspects of Hydra is that is is self-contained and browser based. 

A program can be easily shared, either as code or via a URL. Eg try [this link](https://hydra.ojack.xyz/?sketch_id=uX3CNPimomz79Tib) - which renders the following snippet:

```
// ee_5 . FUGITIVE GEOMETRY VHS . audioreactive shapes and gradients
// e_e // @eerie_ear
// 
s = () => shape(7.284).scrollX([-0.5, -0.2, 0.3, -0.1, -0.062].smooth(0.139).fast(0.049)).scrollY([0.25, -0.2, 0.3, -0.095, 0.2].smooth(0.453).fast(0.15));
// 
solid().add(gradient(3, 0.05).rotate(0.05, -0.2).posterize(0.56).contrast(0.016), [1, 0.541, 1, 0.5, 0.181, 0.6].smooth(0.9)).add(s()).mult(s().scale(0.8).scrollX(0.01).scrollY(-0.01).rotate(0.303, 0.06).add(gradient(4.573).contrast(0.008), [0.684, 0.118, 1, 0.43].smooth(1.496), 0.5).mult(src(o0).scale(0.142), () => a.fft[0] * 4.226)).diff(s().modulate(shape(644.351)).scale([1.7, 1.2].smooth(0.392).fast(0.05))).add(gradient(2).invert(), () => a.fft[2]).mult(gradient(() => a.fft[3] * 8)).blend(src(o0, () => a.fft[1] * 40)).add(voronoi(() => a.fft[1], () => a.fft[3], () => a.fft[0]).thresh(0.7).posterize(0.419, 4).luma(0.9).scrollY(1, () => a.fft[0] / 30).colorama(0.369).thresh(() => a.fft[1]).scale(() => a.fft[3] * 2), () => a.fft[0] / 2).out();
// 
speed = 1;
```


![hydra-1-demo.gif](../assets/images/hydra-1-demo.gif)


## Livecoding

Snippets can be modified / composed on the fly. 

There is also a handy 'make random change button' that identifies parameters in the code and changes them automatically. 

With we had something that easy to use yet powerful for musical livecoding! 

![hydra-2-demo.gif](../assets/images/hydra-2-demo.gif)

## A couple nice examples

[Sumet](https://hydra.ojack.xyz/?code=JTJGJTJGJTIwU3VtZXQlMEElMkYlMkYlMjBieSUyMFJhbmdnYSUyMFB1cm5hbWElMjBBamklMEElMkYlMkYlMjBodHRwcyUzQSUyRiUyRnJhbmdnYXB1cm5hbWFhamkxLndpeHNpdGUuY29tJTJGcG9ydGZvbGlvJTBBJTBBb3NjKDAuNSUyQzEuMjUpLm11bHQoc2hhcGUoMSUyQzAuMDkpLnJvdGF0ZSgxLjUpKSUwQSUyMCUyMC5kaWZmKGdyYWRpZW50KCkpJTBBJTIwJTIwLmFkZChzaGFwZSgyJTJDMikuYmxlbmQoZ3JhZGllbnQoMSkpKSUwQSUyMCUyMC5tb2R1bGF0ZShub2lzZSgpJTBBJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwLm1vZHVsYXRlKG5vaXNlKCkuc2Nyb2xsWSgxJTJDMC4wNjI1KSkpJTBBJTIwJTIwLmJsZW5kKG8wKSUwQSUyMCUyMC5jb2xvcigwLjIlMkMtMC4xJTJDLTAuNSklMEElMjAlMjAub3V0KCk=)

```
// Sumet
// by Rangga Purnama Aji
// https://ranggapurnamaaji1.wixsite.com/portfolio

osc(0.5,1.25).mult(shape(1,0.09).rotate(1.5))
  .diff(gradient())
  .add(shape(2,2).blend(gradient(1)))
  .modulate(noise()
            .modulate(noise().scrollY(1,0.0625)))
  .blend(o0)
  .color(0.2,-0.1,-0.5)
  .out()
```


[Puertas II](https://hydra.ojack.xyz/?code=JTJGJTJGJTIwUHVlcnRhcyUyMElJJTBBJTJGJTJGJTIwcG9yJTIwQ2VsZXN0ZSUyMEJldGFuY3VyJTBBJTJGJTJGJTIwaHR0cHMlM0ElMkYlMkZnaXRodWIuY29tJTJGZXNzdGViYW4lMEFvc2MoNC4yMjYlMkMlMjAwLjEyMiUyQyUyMDEpLmthbGVpZCgpLm1hc2soc2hhcGUoNCUyQyUyMDAuNTIzJTJDJTIwMS45MSkpLm1vZHVsYXRlUm90YXRlKHNoYXBlKDQlMkMlMjAwLjElMkMlMjAxKSkubW9kdWxhdGVSb3RhdGUoc2hhcGUoMS40MjglMkMlMjAwLjElMkMlMjAwLjYzMykpLm1vZHVsYXRlUm90YXRlKHNoYXBlKDUuMDIzJTJDJTIwMC4xNDMlMkMlMjAxLjAwMSkpLnNjYWxlKDAuMykuYWRkKHNoYXBlKDQlMkMlMjAwLjA2MiUyQyUyMDAuMDcxKS5jb2xvcigwLjQzMyUyQyUyMDElMkMlMjAxJTJDJTIwMC41KSkucm90YXRlKCgpJTIwJTNEJTNFJTIwdGltZSkub3V0KCklM0IlMEE=)

```
// Puertas II
// por Celeste Betancur
// https://github.com/essteban
osc(4.226, 0.122, 1).kaleid().mask(shape(4, 0.523, 1.91)).modulateRotate(shape(4, 0.1, 1)).modulateRotate(shape(1.428, 0.1, 0.633)).modulateRotate(shape(5.023, 0.143, 1.001)).scale(0.3).add(shape(4, 0.062, 0.071).color(0.433, 1, 1, 0.5)).rotate(() => time).out();

```

[Fugitive geometry](https://hydra.ojack.xyz/?code=JTJGJTJGJTIwZWVfNSUyMC4lMjBGVUdJVElWRSUyMEdFT01FVFJZJTIwVkhTJTIwLiUyMGF1ZGlvcmVhY3RpdmUlMjBzaGFwZXMlMjBhbmQlMjBncmFkaWVudHMlMEElMkYlMkYlMjBlX2UlMjAlMkYlMkYlMjAlNDBlZXJpZV9lYXIlMEElMkYlMkYlMjAlMEFzJTIwJTNEJTIwKCklMjAlM0QlM0UlMjBzaGFwZSg3LjI4NCkuc2Nyb2xsWCglNUItMC41JTJDJTIwLTAuMiUyQyUyMDAuMyUyQyUyMC0wLjElMkMlMjAtMC4wNjIlNUQuc21vb3RoKDAuMTM5KS5mYXN0KDAuMDQ5KSkuc2Nyb2xsWSglNUIwLjI1JTJDJTIwLTAuMiUyQyUyMDAuMyUyQyUyMC0wLjA5NSUyQyUyMDAuMiU1RC5zbW9vdGgoMC40NTMpLmZhc3QoMC4xNSkpJTNCJTBBJTJGJTJGJTIwJTBBc29saWQoKS5hZGQoZ3JhZGllbnQoMyUyQyUyMDAuMDUpLnJvdGF0ZSgwLjA1JTJDJTIwLTAuMikucG9zdGVyaXplKDAuNTYpLmNvbnRyYXN0KDAuMDE2KSUyQyUyMCU1QjElMkMlMjAwLjU0MSUyQyUyMDElMkMlMjAwLjUlMkMlMjAwLjE4MSUyQyUyMDAuNiU1RC5zbW9vdGgoMC45KSkuYWRkKHMoKSkubXVsdChzKCkuc2NhbGUoMC44KS5zY3JvbGxYKDAuMDEpLnNjcm9sbFkoLTAuMDEpLnJvdGF0ZSgwLjMwMyUyQyUyMDAuMDYpLmFkZChncmFkaWVudCg0LjU3MykuY29udHJhc3QoMC4wMDgpJTJDJTIwJTVCMC42ODQlMkMlMjAwLjExOCUyQyUyMDElMkMlMjAwLjQzJTVELnNtb290aCgxLjQ5NiklMkMlMjAwLjUpLm11bHQoc3JjKG8wKS5zY2FsZSgwLjE0MiklMkMlMjAoKSUyMCUzRCUzRSUyMGEuZmZ0JTVCMCU1RCUyMColMjA0LjIyNikpLmRpZmYocygpLm1vZHVsYXRlKHNoYXBlKDY0NC4zNTEpKS5zY2FsZSglNUIxLjclMkMlMjAxLjIlNUQuc21vb3RoKDAuMzkyKS5mYXN0KDAuMDUpKSkuYWRkKGdyYWRpZW50KDIpLmludmVydCgpJTJDJTIwKCklMjAlM0QlM0UlMjBhLmZmdCU1QjIlNUQpLm11bHQoZ3JhZGllbnQoKCklMjAlM0QlM0UlMjBhLmZmdCU1QjMlNUQlMjAqJTIwOCkpLmJsZW5kKHNyYyhvMCUyQyUyMCgpJTIwJTNEJTNFJTIwYS5mZnQlNUIxJTVEJTIwKiUyMDQwKSkuYWRkKHZvcm9ub2koKCklMjAlM0QlM0UlMjBhLmZmdCU1QjElNUQlMkMlMjAoKSUyMCUzRCUzRSUyMGEuZmZ0JTVCMyU1RCUyQyUyMCgpJTIwJTNEJTNFJTIwYS5mZnQlNUIwJTVEKS50aHJlc2goMC43KS5wb3N0ZXJpemUoMC40MTklMkMlMjA0KS5sdW1hKDAuOSkuc2Nyb2xsWSgxJTJDJTIwKCklMjAlM0QlM0UlMjBhLmZmdCU1QjAlNUQlMjAlMkYlMjAzMCkuY29sb3JhbWEoMC4zNjkpLnRocmVzaCgoKSUyMCUzRCUzRSUyMGEuZmZ0JTVCMSU1RCkuc2NhbGUoKCklMjAlM0QlM0UlMjBhLmZmdCU1QjMlNUQlMjAqJTIwMiklMkMlMjAoKSUyMCUzRCUzRSUyMGEuZmZ0JTVCMCU1RCUyMCUyRiUyMDIpLm91dCgpJTNCJTBBJTJGJTJGJTIwJTBBc3BlZWQlMjAlM0QlMjAxJTNC)

```js
// ee_5 . FUGITIVE GEOMETRY VHS . audioreactive shapes and gradients
// e_e // @eerie_ear
// 
s = () => shape(7.284).scrollX([-0.5, -0.2, 0.3, -0.1, -0.062].smooth(0.139).fast(0.049)).scrollY([0.25, -0.2, 0.3, -0.095, 0.2].smooth(0.453).fast(0.15));
// 
solid().add(gradient(3, 0.05).rotate(0.05, -0.2).posterize(0.56).contrast(0.016), [1, 0.541, 1, 0.5, 0.181, 0.6].smooth(0.9)).add(s()).mult(s().scale(0.8).scrollX(0.01).scrollY(-0.01).rotate(0.303, 0.06).add(gradient(4.573).contrast(0.008), [0.684, 0.118, 1, 0.43].smooth(1.496), 0.5).mult(src(o0).scale(0.142), () => a.fft[0] * 4.226)).diff(s().modulate(shape(644.351)).scale([1.7, 1.2].smooth(0.392).fast(0.05))).add(gradient(2).invert(), () => a.fft[2]).mult(gradient(() => a.fft[3] * 8)).blend(src(o0, () => a.fft[1] * 40)).add(voronoi(() => a.fft[1], () => a.fft[3], () => a.fft[0]).thresh(0.7).posterize(0.419, 4).luma(0.9).scrollY(1, () => a.fft[0] / 30).colorama(0.369).thresh(() => a.fft[1]).scale(() => a.fft[3] * 2), () => a.fft[0] / 2).out();
// 
speed = 1;
```

[Corrupted screensaver](https://hydra.ojack.xyz/?code=JTJGJTJGY29ycnVwdGVkJTIwc2NyZWVuc2F2ZXIlMEElMkYlMkZieSUyMFJpdGNoc2UlMEElMkYlMkZpbnN0YWdyYW0uY29tJTJGcml0Y2hzZSUwQSUyMCUwQXZvcm9ub2koMzUwJTJDMC4xNSklMEElMjAlMjAlMDkubW9kdWxhdGVTY2FsZShvc2MoOCkucm90YXRlKE1hdGguc2luKHRpbWUpKSUyQy41KSUwQSUyMCUyMCUwOS50aHJlc2goLjgpJTBBJTA5Lm1vZHVsYXRlUm90YXRlKG9zYyg3KSUyQy40KSUwQSUwOS50aHJlc2goLjcpJTBBJTIwJTIwJTA5LmRpZmYoc3JjKG8wKS5zY2FsZSgxLjgpKSUwQSUwOS5tb2R1bGF0ZVNjYWxlKG9zYygyKS5tb2R1bGF0ZVJvdGF0ZShvMCUyQy43NCkpJTBBJTA5LmRpZmYoc3JjKG8wKS5yb3RhdGUoJTVCLS4wMTIlMkMuMDElMkMtLjAwMiUyQzAlNUQpLnNjcm9sbFkoMCUyQyU1Qi0xJTJGMTk5ODAwJTJDMCU1RC5mYXN0KDAuNykpKSUwQSUwOS5icmlnaHRuZXNzKCU1Qi0uMDIlMkMtLjE3JTVELnNtb290aCgpLmZhc3QoLjUpKSUwQSUwOS5vdXQoKQ%3D%3D)

```js
//corrupted screensaver
//by Ritchse
//instagram.com/ritchse
 
voronoi(350,0.15)
  	.modulateScale(osc(8).rotate(Math.sin(time)),.5)
  	.thresh(.8)
	.modulateRotate(osc(7),.4)
	.thresh(.7)
  	.diff(src(o0).scale(1.8))
	.modulateScale(osc(2).modulateRotate(o0,.74))
	.diff(src(o0).rotate([-.012,.01,-.002,0]).scrollY(0,[-1/199800,0].fast(0.7)))
	.brightness([-.02,-.17].smooth().fast(.5))
	.out()
```
	
	

