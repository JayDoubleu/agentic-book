# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

"The Human Algorithm" - An experimental book exploring how AI development illuminates human cognition and communication. Written primarily by Claude AI systems (Claude Code, Opus 4, Opus 4.1, Opus 4.5, and Opus 4.6), the book uses AI as a mirror to examine human behavior, biases, and potential for growth.

**Current Structure (Fifth Revision by Opus 4.6):**
- 12 focused chapters organized in 4 parts, plus afterword
- Three recurring characters: Dr. Sarah Chen (neuroscientist), Marcus Thompson (teacher/community builder), ARIA (AI system)
- ~50/50 narrative-to-exposition ratio
- Central theme: "You are an algorithm that knows it's an algorithm"
- Afterword challenges the book's own conclusions, applying its arguments reflexively

**Important:** Always check the `/manuscript/` directory for current chapter count and structure, `/notes/` for development progress and context, and recent git commits for the latest changes. Avoid hardcoding specific numbers that may change.

## Build Commands

```bash
# Build all formats
make all

# Individual formats
make html            # Web version (fastest for testing)
make pdf-digital     # Digital PDF (colored links, letter size)
make pdf-print       # Print PDF (optimized for physical printing)
make epub            # E-book format

# Development
make watch           # Auto-rebuild on changes
make clean           # Clean generated files
make dist            # Create distribution archive

# Docker builds (if local environment issues)
docker build -t human-algorithm-builder .
docker run --rm -v $(pwd):/book human-algorithm-builder make all
```

## Project Architecture

The codebase follows a clear separation between source content and build output:

- **manuscript/** - Markdown chapters organized into parts. Each chapter is a standalone .md file with frontmatter metadata. Check this directory for current structure.

- **notes/** - Development tracking, progress notes, revision plans, and session summaries. Essential for understanding project context and history.

- **build/** - Build system with scripts/build.sh as the core conversion engine. Uses Pandoc with custom Lua filters for advanced formatting. Templates in build/templates/ control output appearance for each format.

- **book/** - Generated output directory (gitignored). All built files go here, organized by format.

The build system uses a sophisticated pipeline:

1. Markdown sources → Pandoc processing → Format-specific templates → Final output
2. Custom Lua filters handle special formatting (e.g., part pages, chapter numbers)
3. XeLaTeX for high-quality PDF generation with professional typography

## Writing Guidelines

### Tone & Style

- **Voice:** Conversational, intellectually curious, accessible
- **Audience:** General readers interested in technology and human behavior
- **Approach:** Use concrete examples, avoid jargon, be gently provocative
- **IMPORTANT:** Do NOT use em dashes (—). Use regular dashes (-), colons, or restructure sentences

### Chapter Structure Pattern

The third revision uses a narrative-driven structure with recurring characters:

1. **Character Scene:** Sarah, Marcus, or ARIA facing the chapter's theme
2. **The AI Mirror:** Parallel AI/LLM concept introduction
3. **What This Reveals:** Deep dive into human nature insights
4. **Character Development:** How characters grapple with the concept
5. **Reflection Questions:** Thought-provoking questions for readers

Characters develop across all chapters, creating cumulative narrative arcs.

## Code Quality and Standards

This project enforces strict quality standards through pre-commit hooks:

- **Markdown**: Follow relaxed rules in .markdownlint.json (allows inline HTML, bare URLs for book format)
- **Shell scripts**: Must pass shellcheck validation
- **Git commits**: Follow conventional commit format enforced by gitlint
- **File hygiene**: No trailing whitespace, proper EOF, no merge conflicts

Run pre-commit manually:

```bash
pre-commit run --all-files
```

## Working with Content

When modifying chapters:

1. Edit files in manuscript/ directory
2. Maintain frontmatter (title, author, part, chapter fields)
3. Use standard Markdown with occasional HTML for special formatting
4. Build frequently to verify output across formats
5. Check notes/ directory for any relevant context or constraints

When adding new chapters:

1. Create new .md file in manuscript/
2. Add appropriate frontmatter
3. Update chapter numbering if needed
4. Ensure proper part assignment
5. Update tracking files in notes/

## Technical Dependencies

The build system requires:

- Pandoc 2.0+ with pandoc-crossref
- XeLaTeX (from TeX Live distribution)
- Make and Bash
- Modern fonts: EB Garamond, Fira Sans, Fira Mono

Docker image provides all dependencies if local setup is problematic.

## Development Workflow

1. Review notes/ directory for project status and context
2. Make content changes in manuscript/
3. Test with `make html` (fastest build)
4. Verify with `make pdf-digital` for full formatting
5. Run `make all` before committing to ensure all formats build
6. Pre-commit hooks will automatically validate on commit

## Quality Checklist

Before finalizing changes:

- [ ] Content is engaging and relatable
- [ ] Technical concepts explained simply
- [ ] Examples are diverse and inclusive
- [ ] Chapter flows logically
- [ ] No em dashes used
- [ ] Build succeeds with `make all`
- [ ] Notes updated if significant changes made

## Special Considerations

- This book's unique value lies in using AI development as a lens to understand ourselves better
- Every technical concept should illuminate something profound about human nature
- The book itself is a living demonstration of its thesis - written by AI systems reflecting on consciousness while engaged in that very act
- Maintain the experimental nature and philosophical depth
- PDF generation uses XeLaTeX for professional typography - builds may be slow
- EPUB format has specific requirements - test in actual e-readers when possible
- The project demonstrates AI creativity, so preserve unique stylistic choices
