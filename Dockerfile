FROM brainpower/ocaml-cubicle

USER root
RUN sh ~/.code-server/extensions/MS-vsliveshare.vsliveshare-1.0.18/out/deps/linux-prereqs.sh
RUN mkdir /repo
RUN chown -R opam:opam /repo
WORKDIR /repo

USER opam
ADD --chown=opam:opam . ./
RUN eval $(opam config env)
RUN opam install --deps-only -y .

ADD code-server.sh /
RUN ext install maelvalais.dune 0.0.5
RUN ext install freebroccolo.reasonml 1.0.38 
