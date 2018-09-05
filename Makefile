STEM = datamgmt

$(STEM).pdf: $(STEM).tex header.tex Figs/activity1_ugly.pdf
	xelatex $<

notes: $(STEM)_withnotes.pdf
all: $(STEM).pdf notes web

$(STEM)_withnotes.pdf: $(STEM)_withnotes.tex header.tex Figs/activity1_ugly.pdf
	xelatex $(STEM)_withnotes
	pdfnup $(STEM)_withnotes.pdf --nup 1x2 --no-landscape --paper letterpaper --frame true --scale 0.9
	mv $(STEM)_withnotes-nup.pdf $(STEM)_withnotes.pdf

$(STEM)_withnotes.tex: $(STEM).tex Ruby/createVersionWithNotes.rb
	Ruby/createVersionWithNotes.rb $(STEM).tex $(STEM)_withnotes.tex

Figs/activity1_ugly.pdf: R/make_activity1_figs.R ../Activity1/Activity1.csv ../Activity1/Activity1_tidy.csv
	Rscript R/make_activity1_figs.R

web: $(STEM).pdf $(STEM)_withnotes.pdf
	scp $(STEM).pdf adhara.biostat.wisc.edu:Website/presentations/$(STEM).pdf
	scp $(STEM)_withnotes.pdf adhara.biostat.wisc.edu:Website/presentations/$(STEM)_withnotes.pdf
