OCAMLC=ocamlfind ocamlc
OCAMLOPT=ocamlfind ocamlopt
OCAMLDEP=ocamldep

LIBS=curl 

P=briefing

SOURCES=web.cmo collect.cmo analyse.cmo briefing.cmo

PREDICATES=

all: $(P)

install: $(P)
	cp $(P) ~/bin


.SECONDEXPANSION:

$(P): $(SOURCES) $$@.cmo
	$(OCAMLC) -o $@ -package "$(LIBS)" -linkpkg -predicates "$(PREDICATES)" $(SOURCES) $@.cmo


#Common rules
.SUFFIXES: .mli .ml .cmo .cmi .cmx

.ml.cmo: .mli.cmi
	$(OCAMLC) -package "$(LIBS)" -predicates "$(PREDICATES)" -c $<

.mli.cmi:
	$(OCAMLC) -package "$(LIBS)" -predicates "$(PREDICATES)" -c $<

.ml.cmx:
	$(OCAMLOPT) -package "$(LIBS)" -predicates "$(PREDICATES)" -c $<

clean:
	rm -f *.cm[iox]
	rm -f $(P)

depend: *.ml *.mli
	$(OCAMLDEP) *.mli *.ml > .depend

include .depend
