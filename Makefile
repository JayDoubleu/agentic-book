# Makefile for The Human Algorithm book

# Default target
.PHONY: all
all: html pdf-digital pdf-print epub

# Build HTML version
.PHONY: html
html:
	@echo "Building HTML version..."
	@bash build/scripts/build.sh html

# Build PDF digital version
.PHONY: pdf-digital
pdf-digital:
	@echo "Building PDF digital version..."
	@bash build/scripts/build.sh pdf-digital

# Build PDF print version
.PHONY: pdf-print
pdf-print:
	@echo "Building PDF print version..."
	@bash build/scripts/build.sh pdf-print

# Build EPUB version
.PHONY: epub
epub:
	@echo "Building EPUB version..."
	@bash build/scripts/build.sh epub

# Build all PDF versions
.PHONY: pdf
pdf: pdf-digital pdf-print

# Clean book directory
.PHONY: clean
clean:
	@echo "Cleaning book directory..."
	@bash build/scripts/build.sh clean

# Watch for changes and rebuild (requires inotify-tools)
.PHONY: watch
watch:
	@echo "Watching for changes in manuscript directory..."
	@while true; do \
		inotifywait -r -e modify,create,delete manuscript/; \
		make all; \
	done

# Create a distribution archive
.PHONY: dist
dist: all
	@echo "Creating distribution archive..."
	@mkdir -p dist
	@tar -czf dist/the-human-algorithm-$(shell date +%Y%m%d).tar.gz book/

# Help target
.PHONY: help
help:
	@echo "The Human Algorithm - Build System"
	@echo ""
	@echo "Available targets:"
	@echo "  make all         - Build all formats (HTML, PDF digital, PDF print, EPUB)"
	@echo "  make html        - Build HTML version only"
	@echo "  make pdf-digital - Build PDF digital version only"
	@echo "  make pdf-print   - Build PDF print version only"
	@echo "  make pdf         - Build both PDF versions"
	@echo "  make epub        - Build EPUB version only"
	@echo "  make clean       - Clean book directory"
	@echo "  make watch       - Watch for changes and rebuild automatically"
	@echo "  make dist        - Create distribution archive"
	@echo "  make help        - Show this help message"
	@echo ""
	@echo "Book files will be created in the book/ directory"