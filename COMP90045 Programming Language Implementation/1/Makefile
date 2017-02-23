TARGETS = sprout
TARGETS_BYTE=$(TARGETS:%=%.byte)

MODULES = sprout_ast sprout_lex sprout_parse sprout_pprint
MLFILES = $(addsuffix .ml, $(MODULES))
CMOFILES = $(addsuffix .cmo, $(MODULES))
CMXFILES = $(addsuffix .cmx, $(MODULES))

ALLMODULES = $(MODULES) sprout

OCAMLLEX = ocamllex
OCAMLYACC = ocamlyacc
OCAMLDEP = ocamldep

OCAMLFLAGS =

all : opt byte
byte: $(TARGETS_BYTE)
opt: $(TARGETS)

%.cmi: %.mli
	ocamlc $(OCAMLFLAGS) -c $<

%.cmo: %.ml
	ocamlc $(OCAMLFLAGS) -g -c $<

%.cmx: %.ml
	ocamlopt $(OCAMLOPTFLAGS) -g -c $<

%.ml: %.mll
	$(OCAMLLEX) $^

%.ml %.mli: %.mly
	$(OCAMLYACC) $^

sprout.byte : $(CMOFILES) sprout.cmo
	ocamlc -g -o $@ $^

sprout : $(CMXFILES) sprout.cmx
	ocamlopt -g -o $@ $^

clean :
	rm -f *.cmo *.cmi *.cmx *.o
	rm -f sprout_lex.ml sprout_parse.ml sprout_parse.mli

clobber : clean
	rm -f $(TARGETS) $(TARGETS_BYTE)

.PHONY : clean clobber depend

# include depend
depend: sprout_lex.ml sprout_parse.ml
	$(OCAMLDEP) sprout.ml sprout.mli $(ALLMODULES:%=%.mli) $(ALLMODULES:%=%.ml) >Makefile.depend

-include Makefile.depend
