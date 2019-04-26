FROM brainpower/ocaml-cubicle

USER root
RUN mkdir /repo
RUN chown -R opam:opam /repo
WORKDIR /repo

USER opam
ADD --chown=opam:opam . ./
RUN . /home/opam/.opam/opam-init/init.sh
RUN opam install --deps-only -y .
RUN eval $(opam env)

ADD code-server.sh /