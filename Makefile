OUTPUT ?= $(shell basename "$(shell dirname "$(INPUT)")")
OUTPUT_DIRECTORY = $(shell pwd)/build
LATEXMK_ARGS ?= -f -file-line-error -shell-escape -logfilewarninglist -interaction=nonstopmode -halt-on-error -norc -pdflatex="lualatex %O %S" -pdflua
TEXINPUTS = ""
TEXLIVE_RUN = TEXINPUTS=$(TEXINPUTS)
LATEXMK_COMMAND = $(TEXLIVE_RUN) latexmk $(LATEXMK_ARGS)

# Make does not offer a recursive wildcard function, so here's one:
rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

ctfp:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp ctfp-reader.tex

ctfp-ja:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-ja ctfp-reader-ja.tex

ctfp-ocaml:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-ocaml ctfp-reader-ocaml.tex

ctfp-ocaml-ja:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-ocaml-ja ctfp-reader-ocaml-ja.tex

ctfp-scala:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-scala ctfp-reader-scala.tex

ctfp-scala-ja:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-scala-ja ctfp-reader-scala-ja.tex

ctfp-reason:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-reason ctfp-reader-reason.tex

ctfp-reason-ja:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-reason-ja ctfp-reader-reason-ja.tex

ctfp-print:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-print ctfp-print.tex

ctfp-print-ja:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-print-ja ctfp-print-ja.tex

ctfp-print-ocaml:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-print-ocaml ctfp-print-ocaml.tex

ctfp-print-ocaml-ja:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-print-ocaml-ja ctfp-print-ocaml-ja.tex

ctfp-print-scala:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-print-scala ctfp-print-scala.tex

ctfp-print-scala-ja:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-print-scala-ja ctfp-print-scala-ja.tex

ctfp-print-reason:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-print-reason ctfp-print-reason.tex

ctfp-print-reason-ja:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-print-reason-ja ctfp-print-reason-ja.tex

lint:
	$(foreach file, $(call rwildcard,$(shell dirname "$(INPUT)"),*.tex), latexindent -l -w $(file);)

