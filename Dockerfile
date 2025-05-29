# Dockerfile for building The Human Algorithm book
FROM fedora:39

# Set environment variables
ENV TZ=UTC

# Install system dependencies using dnf
RUN dnf install -y \
    # Basic utilities
    make \
    git \
    curl \
    ca-certificates \
    # Pandoc
    pandoc \
    # LaTeX packages for PDF generation
    texlive-xetex \
    texlive-collection-fontsrecommended \
    texlive-collection-latexextra \
    texlive-collection-latexrecommended \
    texlive-multirow \
    texlive-enumitem \
    texlive-fancyhdr \
    texlive-titlesec \
    texlive-fancyvrb \
    # Additional tools
    inotify-tools \
    && dnf clean all

# Create a non-root user for running builds
RUN useradd -m -s /bin/bash bookbuilder

# Set working directory
WORKDIR /book

# Copy the entire project
COPY --chown=bookbuilder:bookbuilder . .

# Switch to non-root user
USER bookbuilder

# Default command shows help
CMD ["make", "help"]