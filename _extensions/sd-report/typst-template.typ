// Reusable Quarto / Typst scientific report layout.
// Used with typst-show.typ via template-partials.
// Layout order: date, title, subtitle, authors (name / affiliation / email).

// Global font — change this one value to update all document typography.
#let document_font = "Libertinus Sans"

// Title-block spacing (easy to customize)
#let date_title_gap = 20pt
#let title_subtitle_gap = 8pt
#let subtitle_author_gap = 12pt
#let author_rule_gap = 14pt
#let rule_content_gap = 10pt

// Colors
#let navy = rgb("#182C42")
#let muted = rgb("#556779")
#let accent = rgb("#245A82")
#let email_color = rgb("#5147A2")
#let hairline = rgb("#BECAD3")

#let article(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: [Abstract],
  cols: 1,
  margin: (x: 1in, y: 0.9in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: document_font,
  codefont: none,
  fontsize: 11pt,
  sectionnumbering: none,
  pagenumbering: "1",
  toc: false,
  toc_title: [Contents],
  toc_depth: 3,
  toc_indent: 1.5em,
  doc,
) = {
  // Page and typography
  set page(paper: paper, margin: margin, numbering: pagenumbering)
  set text(font: font, size: fontsize, lang: lang, region: region)
  set par(justify: true, leading: 0.65em)
  set heading(numbering: sectionnumbering)

  show heading: it => {
    set text(font: font, fill: accent)
    it
  }

  // Honor codefont from QMD YAML, or use Typst's default monospace.
  // No custom code block backgrounds or borders.
  show raw: set text(font: if codefont == none { "Maple Mono NF" } else { codefont })

  // Date at the top, with space before the title.
  if date != none {
    block(below: date_title_gap)[
      #text(size: 10.5pt, weight: "bold", fill: navy)[#date]
    ]
  }

  // Title and subtitle, aligned to the left text margin.
  if title != none {
    block(below: title_subtitle_gap)[
      #text(size: 19pt, weight: "bold", fill: navy)[#title]
    ]
  }
  if subtitle != none {
    block(below: subtitle_author_gap)[
      #text(size: 12pt, fill: muted)[#subtitle]
    ]
  }

  // Author name, optional affiliations, and optional email.
  if authors != none {
    for author in authors {
      let affiliation = author.at("affiliation", default: none)
      let email = author.at("email", default: none)
      block(below: author_rule_gap)[
        #text(size: 11pt)[#author.name]
        #if affiliation != none and affiliation != [] {
          linebreak()
          text(size: 9pt, fill: muted)[#affiliation]
        }
        #if email != none and email != [] {
          linebreak()
          text(size: 9pt, fill: email_color)[#email]
        }
      ]
    }
  }

  // Divider between title block and report content.
  if title != none or subtitle != none or authors != none or date != none {
    line(length: 100%, stroke: 1pt + hairline)
    v(rule_content_gap)
  }

  if abstract != none {
    block(below: 1em)[
      #text(weight: "bold")[#abstract-title]
      #parbreak()
      #abstract
    ]
  }

  if toc {
    block(below: 1em)[
      #outline(title: toc_title, depth: toc_depth, indent: toc_indent)
    ]
  }

  if cols == 1 { doc } else { columns(cols, doc) }
}// Reusable Quarto / Typst scientific report layout.
// Used with typst-show.typ via template-partials.
// Layout order: date, title, subtitle, authors (name / affiliation / email).

// Global font — change this one value to update all document typography.
#let document_font = "Libertinus Sans"

// Title-block spacing (easy to customize)
#let date_title_gap = 20pt
#let title_subtitle_gap = 8pt
#let subtitle_author_gap = 12pt
#let author_rule_gap = 14pt
#let rule_content_gap = 10pt

// Colors
#let navy = rgb("#182C42")
#let muted = rgb("#556779")
#let accent = rgb("#245A82")
#let email_color = rgb("#5147A2")
#let hairline = rgb("#BECAD3")

#let article(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: [Abstract],
  cols: 1,
  margin: (x: 1in, y: 0.9in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: document_font,
  codefont: none,
  fontsize: 11pt,
  sectionnumbering: none,
  pagenumbering: "1",
  toc: false,
  toc_title: [Contents],
  toc_depth: 3,
  toc_indent: 1.5em,
  doc,
) = {
  // Page and typography
  set page(paper: paper, margin: margin, numbering: pagenumbering)
  set text(font: font, size: fontsize, lang: lang, region: region)
  set par(justify: true, leading: 0.65em)
  set heading(numbering: sectionnumbering)

  show heading: it => {
    set text(font: font, fill: accent)
    it
  }

  // Honor codefont from QMD YAML, or use Typst's default monospace.
  // No custom code block backgrounds or borders.
  show raw: set text(font: if codefont == none { "Maple Mono NF" } else { codefont })

  // Date at the top, with space before the title.
  if date != none {
    block(below: date_title_gap)[
      #text(size: 10.5pt, weight: "bold", fill: navy)[#date]
    ]
  }

  // Title and subtitle, aligned to the left text margin.
  if title != none {
    block(below: title_subtitle_gap)[
      #text(size: 19pt, weight: "bold", fill: navy)[#title]
    ]
  }
  if subtitle != none {
    block(below: subtitle_author_gap)[
      #text(size: 12pt, fill: muted)[#subtitle]
    ]
  }

  // Author name, optional affiliations, and optional email.
  if authors != none {
    for author in authors {
      let affiliation = author.at("affiliation", default: none)
      let email = author.at("email", default: none)
      block(below: author_rule_gap)[
        #text(size: 11pt)[#author.name]
        #if affiliation != none and affiliation != [] {
          linebreak()
          text(size: 9pt, fill: muted)[#affiliation]
        }
        #if email != none and email != [] {
          linebreak()
          text(size: 9pt, fill: email_color)[#email]
        }
      ]
    }
  }

  // Divider between title block and report content.
  if title != none or subtitle != none or authors != none or date != none {
    line(length: 100%, stroke: 1pt + hairline)
    v(rule_content_gap)
  }

  if abstract != none {
    block(below: 1em)[
      #text(weight: "bold")[#abstract-title]
      #parbreak()
      #abstract
    ]
  }

  if toc {
    block(below: 1em)[
      #outline(title: toc_title, depth: toc_depth, indent: toc_indent)
    ]
  }

  if cols == 1 { doc } else { columns(cols, doc) }
}
