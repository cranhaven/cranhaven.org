SHELL=bash

all: preview

install:
	Rscript -e "install.packages(c('ciw', 'DT'))"

assert_quarto:
	@command -v quarto || { >&2 echo "Cannot find 'quarto' (https://quarto.org/docs/get-started/)"; exit 1; }

preview: assert_quarto
	quarto preview

spelling: WORDLIST
	Rscript -e "spelling::spell_check_files(path = dir(pattern = '[.]qmd$$'), ignore = readLines('$<'))"
