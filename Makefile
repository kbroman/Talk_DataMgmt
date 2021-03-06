STEM = datamgmt

$(STEM).pdf: $(STEM).tex header.tex Figs/spreadsheet_ugly.pdf Figs/il3.pdf Figs/data_dict.pdf
	xelatex $<

Figs/data_dict.pdf: R/make_data_dict.R
	cd $(<D);R -e "source('$(<F)')"

Figs/spreadsheet_ugly.pdf: R/make_spreadsheet_figs.R example_ugly.csv example_tidy.csv
	cd $(<D);R -e "source('$(<F)')"

Figs/il3.pdf: R/data_cleaning_figs.R R/il3.rds R/adipose_weight.rds
	cd $(<D);R -e "source('$(<F)')"

web: $(STEM).pdf
	scp $(STEM).pdf adhara.biostat.wisc.edu:Website/presentations/$(STEM)2019.pdf
