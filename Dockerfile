FROM brainpower/ocaml-cubicle:code-1.939-share-1.0.125 

RUN mkdir -p /exercism/ocaml
ADD ocaml-exercism.opam /exercism/ocaml/ocaml-exercism.opam
WORKDIR /exercism/ocaml

RUN opam install --deps-only -y .

# RUN curl -L https://github.com/exercism/cli/releases/download/v3.0.11/exercism-linux-64bit.tgz -o exercism-linux-64bit.tgz
ADD . /exercism/ocaml
# RUN tar -xzvf exercism-linux-64bit.tgz -C .bins
RUN cp -r .bins/. /usr/bin/

RUN dune runtest
