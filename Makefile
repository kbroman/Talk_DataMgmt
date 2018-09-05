STEM = datamgmt

$(STEM).pdf: $(STEM).tex header.tex Figs/activity1_ugly.pdf
	xelatex $<

Figs/activity1_ugly.pdf: R/make_activity1_figs.R ../Activity1/Activity1.csv ../Activity1/Activity1_tidy.csv
	Rscript R/make_activity1_figs.R

web: $(STEM).pdf $(STEM)_withnotes.pdf
	scp $(STEM).pdf adhara.biostat.wisc.edu:Website/presentations/$(STEM).pdf
