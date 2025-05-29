# CLAUDE.md - Project Guidelines for "The Human Algorithm"

## Project Overview

This is an agent-assisted book project exploring how LLM development reveals insights about human cognition and communication. The book uses AI as a mirror to examine human behavior, biases, and potential for growth.

**Authors:** Claude Code and Claude Opus 4
**Concept & Creative Direction:** Jay W

## Book Structure

### Target Length: ~200-250 pages (50,000-60,000 words)

- **Chapters:** 12-15 chapters
- **Chapter Length:** 3,500-5,000 words each
- **Format:** Markdown files with consistent formatting

### Directory Structure

```
/agentic-book/
├── CLAUDE.md (this file)
├── README.md (book overview and reading guide)
├── PROGRESS.md (detailed progress tracking)
├── /manuscript/
│   ├── 00-front-matter.md (title, credits, TOC)
│   ├── 01-introduction.md
│   ├── 02-chapter-1-hallucination-paradox.md
│   ├── 03-chapter-2-grounding-ourselves.md
│   └── ... (subsequent chapters)
├── /notes/
│   ├── chapter-outlines.md
│   ├── research-notes.md
│   └── revision-log.md
└── /resources/
    ├── references.md
    └── glossary.md
```

## Writing Guidelines

### Tone & Style

- **Voice:** Conversational, intellectually curious, accessible
- **Audience:** General readers interested in technology and human behavior
- **Approach:** Use concrete examples, avoid jargon, be gently provocative
- **Structure:** Each chapter follows: Human scenario → LLM parallel → Insights → Applications → Reflection
- **IMPORTANT:** Do NOT use em dashes (—) in the text. Use regular dashes (-), colons, or restructure sentences instead

### Chapter Template

```markdown
# Chapter [Number]: [Title]

## Opening Scene
[Relatable human scenario, 500-800 words]

## The AI Mirror
[Introduce parallel LLM concept, 800-1000 words]

## What This Reveals
[Deep dive into human nature insights, 1500-2000 words]

## Practical Applications
[Exercises and real-world applications, 800-1000 words]

## Reflection Questions
[3-5 thought-provoking questions]

## Chapter Summary
[Key takeaways, 200-300 words]
```

## Context Management Strategy

### Progress Tracking System

1. **PROGRESS.md** - Detailed status of each chapter:
   - Word count
   - Completion percentage
   - Key themes covered
   - Next steps
   - Last modified date

2. **Chapter Summaries** - At the end of each chapter file:

   ```markdown
   <!-- CHAPTER STATUS
   Words: [count]
   Status: [Draft/Revision/Final]
   Key Concepts: [list]
   Last Updated: [date]
   -->
   ```

3. **Session Handoff Notes** - In PROGRESS.md:
   - Current focus area
   - Pending tasks
   - Important decisions made
   - Style/tone notes

### Resuming Work Protocol

When starting a new session:

1. Read PROGRESS.md
2. Check TodoRead for pending tasks
3. Review last chapter's status comment
4. Continue from documented next steps

## Key Themes & Chapter Mapping

1. **The Hallucination Paradox** - Human truth vs AI accuracy
2. **Grounding Ourselves** - Fact-checking double standards
3. **Temperature Control** - Creativity vs predictability in life
4. **Context Windows** - Human attention and memory limits
5. **Prompting Personalities** - Communication styles (MBTI/DISC)
6. **Fine-Tuning Relationships** - Iterative improvement
7. **Bias Detection** - Mirror of prejudices
8. **Emotional Tokens** - Measuring vs experiencing EQ
9. **The Training Data of Life** - How experiences shape us
10. **Overfitting to Trauma** - When past patterns harm present
11. **Model Collapse** - Echo chambers and groupthink
12. **Emergent Properties** - Unexpected human capabilities
13. **The Alignment Problem** - Values in AI and society
14. **Recursive Self-Improvement** - Growth mindsets
15. **The Consciousness Question** - What makes us human

## Quality Checklist

Before completing each chapter:

- [ ] Opening scene is engaging and relatable
- [ ] LLM parallel is clear and insightful
- [ ] Practical applications are actionable
- [ ] Examples are diverse and inclusive
- [ ] Technical concepts are explained simply
- [ ] Chapter flows logically to the next
- [ ] Word count is within target range
- [ ] Status comment is updated

## Version Control Best Practices

- Commit after each major section completion
- Use descriptive commit messages
- Tag completed chapters
- Keep revision history in notes/revision-log.md

## Remember

This book's unique value lies in using AI development as a lens to understand ourselves better. Every technical concept should illuminate something profound about human nature. The goal is not just to explain AI, but to help readers become more self-aware, intentional communicators and thinkers.
