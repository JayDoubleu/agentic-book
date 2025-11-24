# Build System for The Human Algorithm

This directory contains the build scripts and templates for generating the book in multiple formats using Pandoc.

## Directory Structure

```
build/
├── scripts/
│   └── build.sh        # Main build script
├── templates/
│   ├── book.css        # CSS styles for HTML version
│   ├── html-template.html    # HTML template
│   ├── pdf-digital-template.tex  # LaTeX template for digital PDF
│   └── pdf-print-template.tex    # LaTeX template for print PDF
└── README.md          # This file
```

## Prerequisites

- **Pandoc** (version 2.0 or higher)
- **XeLaTeX** (for PDF generation)
- **Make** (optional, for using the Makefile)

### Installation

**Ubuntu/Debian:**

```bash
sudo apt-get install pandoc texlive-xetex texlive-fonts-recommended texlive-fonts-extra
```

**macOS (with Homebrew):**

```bash
brew install pandoc
brew install --cask mactex  # or basictex for a smaller installation
```

**Windows:**
Download and install from:

- Pandoc: <https://pandoc.org/installing.html>
- MiKTeX: <https://miktex.org/download>

## Usage

### Using Make (Recommended)

From the project root directory:

```bash
# Build all formats
make

# Build specific format
make html
make pdf-digital
make pdf-print
make epub

# Clean output directory
make clean

# Show all available commands
make help
```

### Using the Build Script Directly

```bash
# Build all formats
bash build/scripts/build.sh

# Build specific format
bash build/scripts/build.sh html
bash build/scripts/build.sh pdf-digital
bash build/scripts/build.sh pdf-print
bash build/scripts/build.sh epub

# Clean output directory
bash build/scripts/build.sh clean
```

## Output

All generated files are placed in the `book/` directory:

```
book/
├── epub/
│   └── the-human-algorithm.epub
├── html/
│   └── the-human-algorithm.html
└── pdf/
    ├── the-human-algorithm-digital.pdf
    └── the-human-algorithm-print.pdf
```

## Format Details

### HTML Version

- Single-file HTML with embedded CSS
- Responsive design for various screen sizes
- Interactive table of contents
- Optimized for web reading

### PDF Digital Version

- Standard letter-size format (8.5" x 11")
- Colored hyperlinks for digital reading
- 1.5 line spacing for screen readability
- Bookmarks and clickable TOC

### PDF Print Version

- Book-size format (6" x 9")
- Black hyperlinks for print
- Proper margins for binding
- Chapters start on odd pages
- Professional book layout

### EPUB Version

- Standard EPUB 3 format
- Compatible with all major e-readers
- Reflowable text for different screen sizes
- Embedded metadata (title, author, description)
- Structured table of contents
- Clean, readable formatting

## Customization

### Modifying Templates

- **HTML styling**: Edit `templates/book.css`
- **HTML structure**: Edit `templates/html-template.html`
- **PDF styling**: Edit the respective `.tex` template files

### Build Settings

Edit `scripts/build.sh` to modify:

- Book metadata (title, author, etc.)
- Pandoc options
- Output filenames

## Troubleshooting

### LaTeX Errors

If you encounter LaTeX compilation errors:

1. Ensure all required LaTeX packages are installed
2. Check for special characters in the markdown that might need escaping
3. Run with `--pdf-engine=pdflatex` instead of `xelatex` as a fallback

### Missing Fonts

For XeLaTeX, install additional fonts:

```bash
# Ubuntu/Debian
sudo apt-get install fonts-liberation fonts-cmu

# macOS
# Fonts are typically included with MacTeX
```

### Build Performance

For faster builds during development:

- Build only the format you're testing
- Use `make html` for quick preview (fastest)
- Consider using `--no-highlight` flag for faster PDF builds

## Docker Support

A Dockerfile is provided in the project root for building the book in a containerized environment with all dependencies pre-installed.

### Building the Docker Image

```bash
# From the project root
docker build -t human-algorithm-builder .
```

### Using Docker to Build the Book

```bash
# Build all formats
docker run --rm -v $(pwd):/book human-algorithm-builder make all

# Build specific format
docker run --rm -v $(pwd):/book human-algorithm-builder make html
docker run --rm -v $(pwd):/book human-algorithm-builder make pdf-digital
docker run --rm -v $(pwd):/book human-algorithm-builder make pdf-print
docker run --rm -v $(pwd):/book human-algorithm-builder make epub

# Clean output
docker run --rm -v $(pwd):/book human-algorithm-builder make clean

# Show help
docker run --rm -v $(pwd):/book human-algorithm-builder make help
```

### Docker Environment Details

The Docker image is based on Fedora 39 and includes:

- Pandoc
- XeLaTeX with all required packages
- Make and other build tools
- Runs as non-root user `bookbuilder`

This ensures consistent builds across different environments without needing to install dependencies locally.
