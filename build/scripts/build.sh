#!/bin/bash

# Build script for "The Human Algorithm"
# Generates HTML, PDF (digital), and PDF (print) versions from Markdown files

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Base directories
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"
MANUSCRIPT_DIR="$PROJECT_ROOT/manuscript"
BOOK_DIR="$PROJECT_ROOT/book"
TEMPLATE_DIR="$PROJECT_ROOT/build/templates"

# Book metadata
TITLE="The Human Algorithm"
SUBTITLE="How Artificial Intelligence Reveals Who We Really Are"
AUTHOR="Claude Code, Claude Opus 4, Claude Opus 4.1, Claude Opus 4.5, and Claude Opus 4.6"
# CREATIVE_DIRECTOR="Jay W" # Currently unused
DATE=$(date +%Y-%m-%d)

# Function to print colored output
print_status() {
    echo -e "${BLUE}[$(date +%H:%M:%S)]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[$(date +%H:%M:%S)]${NC} ✓ $1"
}

print_error() {
    echo -e "${RED}[$(date +%H:%M:%S)]${NC} ✗ $1"
}

# Function to build HTML version
build_html() {
    print_status "Building HTML version..."

    pandoc \
        --standalone \
        --toc \
        --toc-depth=3 \
        --metadata title="$TITLE" \
        --metadata subtitle="$SUBTITLE" \
        --metadata author="$AUTHOR" \
        --metadata date="$DATE" \
        --css="$TEMPLATE_DIR/book.css" \
        --template="$TEMPLATE_DIR/html-template.html" \
        --embed-resources \
        --output="$BOOK_DIR/html/the-human-algorithm.html" \
        "$MANUSCRIPT_DIR"/*.md

    print_success "HTML version built successfully"
}

# Function to build PDF digital version
build_pdf_digital() {
    print_status "Building PDF (digital) version..."

    pandoc \
        --pdf-engine=xelatex \
        --toc \
        --toc-depth=3 \
        --metadata title="$TITLE" \
        --metadata subtitle="$SUBTITLE" \
        --metadata author="$AUTHOR" \
        --metadata date="$DATE" \
        --template="$TEMPLATE_DIR/pdf-digital-template.tex" \
        --lua-filter="$SCRIPT_DIR/remove-emoji.lua" \
        --variable documentclass=book \
        --variable papersize=letter \
        --variable fontsize=11pt \
        --variable linestretch=1.5 \
        --variable urlcolor=blue \
        --variable linkcolor=blue \
        --output="$BOOK_DIR/pdf/the-human-algorithm-digital.pdf" \
        "$MANUSCRIPT_DIR"/*.md

    print_success "PDF (digital) version built successfully"
}

# Function to build PDF print version
build_pdf_print() {
    print_status "Building PDF (print) version..."

    pandoc \
        --pdf-engine=xelatex \
        --toc \
        --toc-depth=3 \
        --metadata title="$TITLE" \
        --metadata subtitle="$SUBTITLE" \
        --metadata author="$AUTHOR" \
        --metadata date="$DATE" \
        --template="$TEMPLATE_DIR/pdf-print-template.tex" \
        --lua-filter="$SCRIPT_DIR/remove-emoji.lua" \
        --variable documentclass=book \
        --variable papersize=letter \
        --variable fontsize=11pt \
        --variable linestretch=1.5 \
        --variable urlcolor=black \
        --variable linkcolor=black \
        --variable geometry="margin=1in" \
        --output="$BOOK_DIR/pdf/the-human-algorithm-print.pdf" \
        "$MANUSCRIPT_DIR"/*.md

    print_success "PDF (print) version built successfully"
}

# Function to build EPUB version
build_epub() {
    print_status "Building EPUB version..."

    pandoc \
        --toc \
        --toc-depth=3 \
        --metadata title="$TITLE" \
        --metadata subtitle="$SUBTITLE" \
        --metadata author="$AUTHOR" \
        --metadata date="$DATE" \
        --lua-filter="$SCRIPT_DIR/remove-emoji.lua" \
        --css="$TEMPLATE_DIR/epub.css" \
        --output="$BOOK_DIR/epub/the-human-algorithm.epub" \
        "$MANUSCRIPT_DIR"/*.md

    print_success "EPUB version built successfully"
}

# Function to clean book directory
clean() {
    print_status "Cleaning book directory..."
    rm -rf "${BOOK_DIR:?}"/*
    mkdir -p "$BOOK_DIR"/{html,pdf,epub}
    print_success "Book directory cleaned"
}

# Main execution
main() {
    print_status "Starting build process for '$TITLE'"
    echo "Book directory: $BOOK_DIR"
    echo ""

    # Create book directories if they don't exist
    mkdir -p "$BOOK_DIR"/{html,pdf,epub}

    # Parse command line arguments
    case "${1:-all}" in
        html)
            build_html
            ;;
        pdf-digital)
            build_pdf_digital
            ;;
        pdf-print)
            build_pdf_print
            ;;
        epub)
            build_epub
            ;;
        clean)
            clean
            ;;
        all)
            build_html
            build_pdf_digital
            build_pdf_print
            build_epub
            ;;
        *)
            echo "Usage: $0 {html|pdf-digital|pdf-print|epub|clean|all}"
            echo "  html        - Build HTML version only"
            echo "  pdf-digital - Build PDF digital version only"
            echo "  pdf-print   - Build PDF print version only"
            echo "  epub        - Build EPUB version only"
            echo "  clean       - Clean book directory"
            echo "  all         - Build all versions (default)"
            exit 1
            ;;
    esac

    echo ""
    print_success "Build process completed!"
}

# Run main function
main "$@"
