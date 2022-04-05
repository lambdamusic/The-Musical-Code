---
template: blog.html
author: Michele Pasin
title: "Learning resources about Scheme"
date: 2010-08-10
categories: 
  - "computermusic"
tags: 
  - "books"
  - "impromptu"
  - "learning"
  - "scheme"
---

[![3eangz5w.jpg](/img/3eangz5w.jpg)](http://www.michelepasin.org/blog/wp-content/uploads/2010/08/3eangz5w.jpg) ...

So you've decided to know everything about scheme and rock the world using fast-paced programming environments like [Impromptu](http://impromptu.moso.com.au/). Well, I confess I did think that on several occasions, but still I haven't made it even half way through the _schemer pilgmim's path_. But I've collected quite a few useful resources in the process, and those I can certainly share!

So in what follows I've put together a list of learning resources about Scheme that I found useful.. First off, two links that might be useful in all situations:

- [Little Scheme](http://www.crockford.com/javascript/scheme.html), an online interpreter that you can use for testing things out while you're on holidays

- [Schemers.org](http://www.schemers.org/), semi-official website containing news and lots of links to other resources

Now, why don't we start with the definition offered by the self-regulating [wikipedia](http://en.wikipedia.org/wiki/Scheme_programming_language) collective intelligence? Here we go:

> Scheme is one of the two main **dialects** of the programming language **Lisp**. Unlike Common Lisp, the other main dialect, Scheme follows a **minimalist design philosophy** specifying a small standard core with powerful tools for language extension. Its compactness and elegance have made it **popular with educators, language designers, programmers, implementors, and hobbyists**, and this diverse appeal is seen as both a strength and, because of the diversity of its constituencies and the wide divergence between implementations, one of its weaknesses

If this blurb hasn't made you proud of learning such a slick language, you'll surely find more interesting ideas in what follows. I divided up the list in two sections, generic learning materials about scheme, and tutorials about specific topics (for now, only macros are included). ----------------------------------

### 1\. Learning Resources About Scheme:

- [Scheme for Common Lispers](http://www.accesscom.com/~darius/writings/scheme-for-lispers.html), article
    
    > The Scheme dialect of Lisp was created in 1975 by Guy Steele and Gerry Sussman to explore ideas in programming-language semantics. They showed that a powerful language can be made \`\`not by piling feature on top of feature, but by removing the weaknesses and restrictions that make additional features appear necessary''. Scheme pioneered lexical scope in Lisp, first-class continuations, and tail recursion, and more recently added an advanced macro system. It's the best-known Lisp dialect after Common Lisp (which it influenced). **This note summarizes the differences from CL that might slow down a CL programmer trying to read a Scheme program**; people without a CL background, or wanting to write programs of their own, should see the references.
    

- [the Schematics Scheme Cookbook](http://schemecookbook.org/)
    
    > The Schematics Scheme Cookbook is a **collaborative effort to produce documentation and recipes for using Scheme for common tasks**. See the BookIntroduction for more information on the Cookbook's goals, and the important ContributorAgreement statement.
    

- Harvey, Wright, [Simply Scheme: Introducing Computer Science](http://www.cs.berkeley.edu/~bh/ss-toc2.html), 1999 MIT press \[_a classic_\]
    
    > **Symbolic programming** is one aspect of the reason why we like to teach computer science using Scheme instead of a more traditional language. More generally, Lisp (and therefore Scheme) was designed to support what we've called the radical view of computer science. In this view, **computer science is about tools for expressing ideas**. Symbolic programming allows the computer to express ideas; other aspects of Lisp's design help the programmer express ideas conveniently. Sometimes that goal comes in conflict with the conservative computer scientist's goal of protection against errors.
    

- Felleisen, Findler, Flatt, Krishnamurthi, [How to Design Programs An Introduction to Computing and Programming](http://www.htdp.org/), MIT 2001
    
    > \[..\] programming is more than just a vocational skill. Indeed, **good programming is a fun activity, a creative outlet, and a way to express abstract ideas in a tangible form.** And designing programs teaches a variety of skills that are important in all kinds of professions: critical reading, analytical thinking, creative synthesis, and attention to detail. We therefore believe that the study of program design deserves the same central role in general education as mathematics and English. Or, put more succinctly, **everyone should learn how to design programs**. On one hand, program design teaches the same analytical skills as mathematics. But, unlike mathematics, **working with programs is an active approach to learning**. Interacting with software provides immediate feedback and thus leads to exploration, experimentation, and self-evaluation. Furthermore, designing programs produces useful and fun things, which vastly increases the sense of accomplishment when compared to drill exercises in mathematics. On the other hand, program design teaches the same analytical reading and writing skills as English. Even the smallest programming tasks are formulated as word problems. Without critical reading skills, a student cannot design programs that match the specification. Conversely, good program design methods force a student to articulate thoughts about programs in proper English.
    

- Dybvig, [The Scheme Programming Language](http://www.scheme.com/tspl3/), 2003MIT press
    
    > This book is intended to provide an **introduction to the Scheme programming language but not an introduction to programming in general**. The reader is expected to have had some experience programming and to be familiar with terms commonly associated with computers and programming languages. The author recommends that readers unfamiliar with Scheme or Lisp also read The Little Schemer \[_see below_\]to become familiar with the concepts of list processing and recursion. Readers new to programming should begin with an introductory text on programming.
    

- Nils M Holm, "[Sketchy LISP](http://www.amazon.com/Sketchy-LISP-Nils-M-Holm/dp/1411674480)" \[you can download the book here Update 08/12: this book has become 'Sketchy Scheme' and is now [for-sale here](http://www.lulu.com/shop/nils-m-holm/sketchy-scheme/paperback/product-15591311.html)\]
    
    > Sketchy LISP is a **step-by-step introduction to functional programming** in Scheme. It covers various aspects of the language including data types, conditional evaluation, list processing, lexical scoping, closures, recursion, dynamic typing, etc. By means of numerous examples of varying complexity, it takes the reader on an entertaining and informative tour through the language. The Scheme language achieves what only few languages have managed before: to **bring fun back to programming**. Its simple syntax, clean semantics, and powerful functions open the door to a fresh perspective on program design. Programming in Scheme is fun, and this book is an attempt to share some of that fun.
    

- Friedman and Felleisen, [The Little Schemer](http://www.ccs.neu.edu/home/matthias/BTLS/), 1996 MIT press
    
    > The goal of this book is to **teach the reader to think recursively**. Our first task, therefore, is to decide which language to use to communicate this concept. There are three obvious choices: a natural language, such as English; formal mathematics; or a programming language. Natural languages are ambiguous, imprecise, and sometimes awkwardly verbose. These are all virtues for general communication, but something of a drawback for communicating concisely as precise a concept as the power of recursion. The language of mathematics is the opposite of natural language: it can express powerful formal ideas with only a few symbols. We could, for example, describe the entire technical content of this book in less than a page of mathematics, but the reader who understands that page has little need for this book. For most people, formal mathematics is not very intuitive. **The marriage of technology and mathematics presents us with a third, almost ideal choice: a programming language.** Programming languages are perhaps the best way to convey the concept of recursion. They share with mathematics the ability to give a formal meaning to a set of symbols. But unlike mathematics, programming languages can be directly experienced---you can take the programs in this book and try them, observe their behavior, modify them, and experience the effect of your modifications.
    

- [The Weiner Lectures Archives](http://wla.berkeley.edu/) \[various videos, but not complete lectures unfortunately\]
    
    > The goal of this project is to make knowledge of computer science easily available not only to the students at Berkeley, but also to the entire community. For several years, faculty members have been videotaping lectures in CS large lower division courses, mainly as an aid to students with time conflicts that prevent them from attending lectures. By **hosting an archive storing all CS lectures that were recorded**, we hope the computing knowledge that has been gathered can be easily shared. As a teaching aid, a 'greatest hits' lecture will also be compiled for each course covering all major topics addressed in the corresponding class. The best parts of many different past lectures will be linked together and presented along with slides to make this greatest hits lecture. This lecture should represent the best teaching abilities in the lower division CS lectures and should be a valuable resource in the computer community for basic CS knowledge. Thanks to the generous donation of Larry Weiner this online site should become a permanent resource.
    

\----------------------

### 2\. Specific topics:

#### On Macros and metaprogramming:

- [The art of metaprogramming, Part 1: Introduction to metaprogramming](http://www.ibm.com/developerworks/linux/library/l-metaprog1.html), IBM developer works
    
    > Summary: One of the most under-used programming techniques is **writing programs that generate programs or program parts**. Learn why metaprogramming is necessary and look at some of the components of metaprogramming (textual macro languages, specialized code generators). See how to build a code generator and get a closer look at language-sensitive macro programming in Scheme.
    

- [Lisp Macros -- How to Define Entirely New Languages in Lisp](http://nostoc.stanford.edu/Docs/livetutorials/macros.html)
    
    > This is a very interesting lesson if you want to deeply understand Lisp, and some very deep things about programming, but it's also entirely optional; We suggest that you do through it, but not worry too much about understanding it in detail. If you get very deeply into programming, you'll find that Lisp macros are an amazing tool, but they are also somewhat **mind-bending**, and used rather rarely in simple programming. So, feel free to skip this lesson, or at least, if you do study it, let it flow over you, and maybe come back to it later on if you find yourself wanting to know more about some of the deep and subtle reaches of Lisp programming.
    

- [Scheme FAQ Macros](http://community.schemewiki.org/?scheme-faq-macros), on schemewiki.org

- [Sources for learning about Scheme Macros: define-syntax and syntax-rules](http://stackoverflow.com/questions/131433/sources-for-learning-about-scheme-macros-define-syntax-and-syntax-rules), a thread on StackOverflow

- [A scheme syntax rules primer](http://blog.willdonnelly.net/2008/09/04/a-scheme-syntax-rules-primer/), an interesting blog post

\----------------------

That's all for now... I'll be adding more stuff as I run into it!
