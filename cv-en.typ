/////////////// Page Configuration ///////////////

#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
  footer: context [
    #set align(center)
    #set text(8pt, font: "Libertinus Sans")
    #counter(page).display(
      "1",
      both: false,
    )
  ]
)


/////////////// Text Style Configuration ///////////////

// Fonts
#let serif-fonts = (
  "Libertinus Serif",
  "KoPubWorldBatang_Pro"
)

#let sans-fonts = (
  "Libertinus Sans",
  // "KoPubWorldDotum_Pro"
)

// Default text style
#set text(
  size: 10pt,
  font: serif-fonts
)

// Sans-serif text styles
#let sans-bold(it) = text(
  size: 10pt,
  font: sans-fonts,
  weight: "bold",
)[#it]

#let sans-sm(it) = text(
  size: 8.29pt,
  font: sans-fonts,
)[#it]

// For Korean texts
#show regex("[\u3131-\u318E\uAC00-\uD7A3]"): it => context {
  set text(size: text.size / 1.11)
  it
}

// Hyperlink style
#show link: set text(
  size: 8pt,
  font: "JetBrainsMono NF",
  fill: rgb(85, 12, 90)
)

// Icon style
#let icon(it) = text(
  size: 12pt,
  font: "JetBrainsMono NF",
  it
)


/////////////// Paragraph Style Configuration ///////////////

#set par(
  leading: 0.8em,
)

#set grid(
  columns: (0.8in, auto),
  align: (right, left),
  column-gutter: 0.2in,
)

#set list(
  spacing: 1em,
)


/////////////// CV Components ///////////////

#let header(title) = grid(
  v(1.5em),

  grid(
    columns: (auto, auto),
    align: horizon,
    column-gutter: 10pt,
    
    text(12pt, font: sans-fonts, weight: "bold")[#title],
    line(length: 100%)
  ),
)

#let bullet-content(..entries) = grid(
  v(1.5em),

  for entry in entries.pos() [
    - #entry
  ],

  v(2em),
)

#let timeline-entry(
  date: "",
  title: "",
  position: "",
  body: none,
  end: false
) = grid(
  [
    #v(.1em)
    #sans-sm[#date]
  ],
  [
    #sans-bold(title)
    #text(style: "italic")[#position]

    #body
  ],

  if end [ #v(2em) ] else [ #v(.5em) ]
)


/////////////// Macros ///////////////

// GitHub hyperlinks
#let github(repo) = link("https://github.com/" + repo)[#repo]
#let github-icon(repo) = link("https://github.com/" + repo)[
  #text(11pt, baseline: 0.5pt, fill: black)[]
]

// DOI hyperlinks
#let doi(code, author, year) = link(
  "https://doi.org/" + code
)[
  #text(size: 10pt, font: "Libertinus Serif")[
    #show "et al.": set text(style: "italic")
    #author (#year) #h(-1pt)
  ]
]

// LaTeX
// © 2023 Ruben Felgenhauer
#let LaTeX = {
  let A = (
    offset: (
      x: -0.33em,
      y: -0.3em,
    ),
    size: 0.7em,
  )
  let T = (
    x_offset: -0.12em    
  )
  let E = (
    x_offset: -0.2em,
    y_offset: 0.23em,
    size: 1em
  )
  let X = (
    x_offset: -0.1em
  )
  [L#h(A.offset.x)#text(size: A.size, baseline: A.offset.y)[A]#h(T.x_offset)T#h(E.x_offset)#text(size: E.size, baseline: E.y_offset)[E]#h(X.x_offset)X]
}

// C++
#let cp = text(10pt)[C] + h(-.8pt) + text(
  5.5pt, baseline: -0.2em, font: "JetBrainsMono NF"
)[+]
#let cpp = cp + h(-.2pt) + text(
  5.5pt, baseline: -0.2em, font: "JetBrainsMono NF"
)[+]


////////////// Title ///////////////

#grid(
  columns: (1fr, 2fr),
  align: horizon,

  align(left)[
    #text(20pt)[
      *PARK* \
      JUNYOUNG
    ]
    #v(-10pt)  
    #text(10pt, font: "KoPubWorldBatang_Pro")[
      /박준영/ 
    ]
    #text(10pt, font: "Libertinus Serif")[
      [pɐk t͡ɕu.nʲʌ̹ŋ]
    ]
  ],

  grid(
    columns: (1fr, auto),
    gutter: 11pt,
    align: horizon,

    align(right)[
      #icon[]
    ], 

    align(left)[
      #link("bloomwayz@snu.ac.kr")
    ],

    align(right)[
      #icon[]
    ], 

    align(left)[
      #github("young-52")
    ]
  )
)

#linebreak()
#linebreak()


/////////////// Contents ///////////////

#header[Interests]
#bullet-content(
  "Natural languages and programming languages",
  "Human-computer/AI interaction",
  "Functional programming",
)

#header[Education]
#timeline-entry(
  date: "Mar 2023 -",
  title: "Seoul National University,",
  position: "B.A. in Linguistics & B.Sc. in Computer Science.",
  body: [
    - GPA: 4.0/4.3 \
    - Expected Graduation: February 2028
  ],
  end: true,
)

#header[Experiences]
#timeline-entry(
  date: "Oct 2025 -",
  title: "Natural Language Processing Laboratory,",
  position: "Research intern.",
  body: []
)

#timeline-entry(
  date: [Aug 2024 \ - Aug 2025],
  title: "Programming Language Laboratory (ROPAS),",
  position: "Research intern.",
  body: [
    - Static analysis augmented AI Python teaching assistant #github-icon("joongwon/AITA-Colab") \
      #text(9pt)[ _Contributed to the frontend._ ]
    - M language server and extension #github-icon("young-52/mlang") \
      #text(9pt)[ _Developed and distributed for an SNU course "Programming Languages"_. ]
  ]
)

#timeline-entry(
  date: [May 2022 \ - Oct 2022],
  title: "Computational Semantics Laboratory,",
  position: "Research assistant.",
  body: [
    - Korean story cloze datasets \
      #text(9pt)[ _Generated three-sentence stories._ ]
  ],
  end: true,
)

#header[Other Projects]
#timeline-entry(
  date: [Sep 2025 \ - Dec 2025],
  title: [Fieldwork for Beolgyo Korean],
  position: github-icon("young-52/fieldwork-questionnaire-2025"),
  body: text(9pt)[
    Contributed as a questionnaire editor and a main fieldworker.
    Created a #LaTeX class to typeset a fieldwork questionnaire.
    Ongoing project for an SNU undergraduate course _Field Linguistics_.
  ]
)

#timeline-entry(
  date: "Aug 2025",
  title: [SNU Linguistics B.A. Thesis #LaTeX Class],
  position: github-icon("young-52/snu-ling-ba-thesis"),
  body: text(9pt)[
    #LaTeX\ified a Bachelor's thesis form for Department of Linguistics, Seoul National University.
  ]
)

#timeline-entry(
  date: [Mar 2025 \ - Jun 2025],
  title: "Hapticky",
  position: github-icon("young-52/hapticky"),
  body: text(9pt)[
    An iOS haptic-augmented keyboard app for low vision users.
    Assigned distinct haptic patterns to keys to improve 
    iPhone texting experiences.
    Final project for an SNU undergraduate course _Human-Computer Interaction_.
  ],
  end: true,
)

#pagebreak()

#header[Teaching]
#timeline-entry(
  date: [
    Fall 2025 \
    Spring/Fall 2024
  ],
  title: "SNU F37.204 Core Computing,",
  position: "Tutor.",
)

#timeline-entry(
  date: [
    Spring 2025 \
    Summer 2023
  ],
  title: "SNU F37.101 Basic Computing,",
  position: "Tutor.",
  body: text(9pt)[ _Received Outstanding Tutor Award in Spring 2025._ ]
)

#timeline-entry(
  date: [
    Spring 2025
  ],
  title: "SNU 4190.310 Programming Languages,",
  position: "Teaching Assistant.",
  end: true,
)

#header[Honours]
#timeline-entry(
  date: [Sep 2025 \ - Aug 2026],
  title: "SK ecoplant,",
  position: "Humanities Scholarship.",
)

#timeline-entry(
  date: "Feb 2025",
  title: "Jebong Min Byeonguk Foundation,",
  position: "Scholarship.",
  body: text(9pt)[ _Full-tuition._ ],
)

#timeline-entry(
  date: [Sep 2023 \ - Feb 2024],
  title: "College of Humanities, SNU,",
  position: "Professor Fund Scholarship.",
)

#timeline-entry(
  date: "Aug 2023",
  title: "SNU Foundation,",
  position: "Ku Jaeseo Scholarship.",
  body: text(9pt)[ _Half-tuition._ ],
  end: true,
)

#header[Skills]
#timeline-entry(
  title: "Natural Languages",
  body: [
    - *Korean/한국어* (native, 2003)
    - *English* (fluent, 2009)
    - Spanish/Español (intermediate, 2020)
    - German/Deutsch (elementary, 2024)
  ], 
)

#timeline-entry(
  title: "Programming Languages",
  body: [
    C (2016), Java (2018), *Python* (2019), *#LaTeX* (2023), OCaml (2024), *Typst* (2024), \
    JavaScript\/*TypeScript* (2024), Swift (2025), #cpp (2025), ReScript (2025), Rust (2025)
  ], 
)

#timeline-entry(
  title: "Libraries & co.",
  body: [
    Pandas (2019), PyTorch (2023), *React* (2025), GitHub Actions (2025)

    I use the *bolded* things frequently.
  ], 
  end: true,
)


#place(bottom + right)[
  #text(9pt, style: "italic")[Last updated: 4 November 2025]
]
