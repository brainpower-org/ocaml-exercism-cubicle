# ocaml-exercism-cubicle 

Work on the OCaml track of exercism in a turn-key environment.

[![][ci-badge]][ci-url]
[![][docker-badge]][docker-url]

## Prerequesites

- docker
- docker-compose

## Getting started

```sh
docker-compose pull
docker-compose up
```

# Work on an exercise

```sh
exercism configure -t=[your-token] -w=/exercism
dl hello-world
cd hello-world
dune runtests --watch
```

## Exercises

- [x] hello-world  - 1
- [x] leap  - 1
- [x] hamming  - 2
- [x] raindrops  - 2
- [ ] difference-of-squares  - 2
- [ ] rna-transcription  - 2
- [ ] nucleotide-count  - 2
- [ ] etl  - 3
- [ ] grade-school  - 3
- [ ] bob  - 3
- [ ] allergies  - 3
- [ ] anagram  - 3
- [ ] space-age  - 3
- [ ] triangle  - 3
- [ ] pangram  - 3
- [ ] acronym  - 3
- [ ] all-your-base  - 4
- [ ] bracket-push  - 4
- [ ] luhn  - 4
- [ ] binary-search  - 4
- [ ] phone-number  - 4
- [ ] word-count  - 4
- [ ] beer-song  - 4
- [ ] run-length-encoding  - 5
- [ ] roman-numerals  - 5
- [ ] prime-factors  - 5
- [ ] say  - 5
- [ ] palindrome-products  - 6
- [ ] robot-name  - 6
- [ ] change  - 6
- [ ] rectangles  - 6
- [ ] list-ops  - 6
- [ ] atbash-cipher  - 7
- [ ] minesweeper  - 7
- [ ] bowling  - 7
- [ ] dominoes  - 7
- [ ] custom-set  - 8
- [ ] connect  - 8
- [ ] meetup  - 9
- [ ] forth  - 9
- [ ] zipper  - 10
- [ ] react  - 10
- [ ] hangman  - 10

[ci-badge]: https://img.shields.io/circleci/project/github/brainpower-org/ocaml-exercism-cubicle/master.svg?style=flat-square
[ci-url]: https://circleci.com/gh/brainpower-org/ocaml-exercism-cubicle

[docker-badge]: https://img.shields.io/docker/cloud/build/brainpower/ocaml-exercism-cubicle.svg?label=docker&style=flat-square
[docker-url]: https://cloud.docker.com/u/brainpower/repository/docker/brainpower/ocaml-exercism-cubicle
