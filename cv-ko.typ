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

#let serif-fonts = (
  "Libertinus Serif",
  "KoPubWorldBatang_Pro"
)

#let sans-fonts = (
  "Libertinus Sans",
  "KoPubWorldDotum_Pro"
)

#set text(
  size: 10pt,
  font: serif-fonts
)

#show raw: set text(
  size: 9pt,
  font: "JetBrainsMono NF"
)

#show link: set text(
  size: 8pt,
  font: "JetBrainsMono NF",
  fill: rgb(85, 12, 90)
)

#let icon(it) = text(
  size: 12pt,
  font: "JetBrainsMono NF",
  it
)

#let github(repo) = link("https://github.com/" + repo)[#repo]
#let github-icon(repo) = link("https://github.com/" + repo)[
  #text(11pt, baseline: 0.5pt)[]
]

#grid(
  columns: (1fr, 2fr),
  align: horizon,

  align(left)[
    #text(20pt, font: "KoPubWorldBatang_Pro")[
      /박준영/
    ]
    #v(-10pt)  
    #text(10pt)[
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
      #github("iamparkj")
    ]
  )
)

#linebreak()
#linebreak()

#set par(
  leading: 1.1em,
)

#set grid(
  columns: (0.8in, auto),
  align: (right, left),
  column-gutter: 0.2in,
)

#set list(
  spacing: 1.2em,
)

#let sans(it) = text(
  size: 10pt,
  font: sans-fonts,
)[#it]

#let sans1(it) = text(
  size: 10pt,
  font: sans-fonts,
  weight: "bold",
)[#it]

#let timeline(it) = text(
  size: 8.29pt,
  font: sans-fonts,
)[#it]

#let doi(code, author, year) = link(
  "https://doi.org/" + code
)[
  #text(10pt, font: "Libertinus Serif")[
    #show "et al.": set text(style: "italic")
    #author (#year) #h(-1pt)
  ]
]

#let header(title) = grid(
  v(1.5em),

  grid(
    columns: (auto, auto),
    align: horizon,
    column-gutter: 10pt,
    
    text(12pt)[#title],
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

#let gpa(it) = {
  show "4.0/4.3": set text(size: 11pt)
  text(it)
}

#let timeline-entry(
  date: "",
  title: "",
  position: "",
  body: none,
  end: false
) = grid(
  timeline[#date],
  [
    #sans1(title)
    #sans(position)

    #body
  ],

  if end [ #v(2em) ] else [ #v(.5em) ]
)

#header[관심 분야]
#bullet-content(
  "자연 언어와 프로그래밍 언어",
  "언어 모델과 언어 능력",
  "인간-컴퓨터 상호작용",
)

#header[학력]
#timeline-entry(
  date: "2023. 3.~",
  title: "서울대학교 언어학과",
  position: "학사과정",
  body: [
    평점평균: #gpa[4.0/4.3]
  ],
  end: true,
)

#header[주요 경력]
#timeline-entry(
  date: "2024. 8.~2025. 8.",
  title: "서울대학교 컴퓨터공학부 프로그래밍 연구실(ROPAS)",
  position: "인턴",
  body: [
    - 정적 분석 기반 인공지능 파이썬 튜터 #github-icon("joongwon/AITA-Colab") \
      #text(9pt)[ 프론트엔드 개발에 참여함. ]
    - M언어 서버 및 VS Code 확장 프로그램 #github-icon("iamparkj/mlang") \
      #text(9pt)[ '프로그래밍언어' 강좌 수강생의 과제 수행을 돕기 위해 개발, 배포함. ]
  ]
)

// #timeline-entry(
//   date: "2023. 2.~2023. 8.",
//   title: "한국교원대학교 인문사회과학교육연구소",
//   position: "보조원",
//   body: [
//     - 동아시아 한자어 정보 데이터베이스 구축 \
//       #text(9pt)[ "조선말대사전"에 실린 일부 한자어의 정보를 전산화함. ]
//   ]
// )

#timeline-entry(
  date: "2022. 5.~2022. 10.",
  title: "고려대학교 언어정보연구소",
  position: "보조원",
  body: [
    - 이야기 완성 평가 말뭉치 연구 분석 \
      #text(9pt)[ 이야기 생성 작업자로 참여함. ]
  ],
  end: true,
)

#header[프로젝트]
#timeline-entry(
  date: "2025. 8.",
  title: "언어학학사 학위논문 양식 LaTeX 클래스",
  position: github-icon("iamparkj/snu-ling-ba-thesis"),
  body: text(9pt)[
    언어학학사 학위논문 양식을 LaTeX으로 조판함.
  ]
)

#timeline-entry(
  date: "2025. 3.~2025. 6.",
  title: "눈 감고도 쓰겠다!",
  position: github-icon("iamparkj/hapticky"),
  body: text(9pt)[
    저시력자를 위한 햅틱 키보드 프로토타입.
    iPhone 쿼티 키보드의 각 글쇠에 햅틱 피드백을 부여하여 입력 경험을 개선하고자 함.
    2025학년도 1학기 '인간컴퓨터상호작용' 강좌의 기말 프로젝트로 제작됨.
  ],
  end: true,
)

#header[교육 경력]
#timeline-entry(
  date: par(leading: .5em)[
    2025 2#text(7pt)[학기] \
    2024 1·2#text(7pt)[학기]
  ],
  title: "컴퓨팅 핵심: 컴퓨터로 생각하기",
  position: "튜터",
)

#timeline-entry(
  date: par(leading: .5em)[
    2025 1#text(7pt)[학기] \
    2023 #text(7pt)[여름학기]
  ],
  title: "컴퓨팅 기초: 처음 만나는 컴퓨팅",
  position: "튜터",
  body: text(9pt)[ 2025학년도 1학기 우수 튜터상 수상 ]
)

#timeline-entry(
  date: par(leading: .5em)[
    2025 1#text(7pt)[학기]
  ],
  title: "프로그래밍언어",
  position: "학부생 조교",
  end: true,
)

#pagebreak()

#header[장학 내역]
#timeline-entry(
  date: "2025. 9.~2026. 8.",
  title: "SK에코플랜트",
  position: "인문나눔장학생",
)

#timeline-entry(
  date: "2025. 2.",
  title: "제봉민병욱장학재단",
  position: "장학생",
  body: text(9pt)[ 등록금 전액 지원 ],
)

#timeline-entry(
  date: "2023. 9.~2024. 2.",
  title: "서울대학교 인문대학",
  position: "교수장학생",
)

#timeline-entry(
  date: "2023. 8.",
  title: "서울대학교발전재단",
  position: "구재서 장학기금",
  body: text(9pt)[ 등록금 반액 지원 ],
  end: true,
)

#header[기타 경력]
#timeline-entry(
  date: "2025. 1.~2026. 2.",
  title: "언어학과서포터즈",
  position: "작업반장",
  body: text(9pt)[
    언어학과 학우의 복지 향상을 위한 단체 '언어학과서포터즈'에서 대표직을 역임함.
  ],
)

#timeline-entry(
  date: "2024. 9.~2024. 12.",
  title: "대규모 언어 모델 스터디그룹",
  position: "회원",
  body: text(9pt)[
    '인문학 자유 주제 스터디그룹 지원 사업'의 지원을 받음.
    #doi("10.18653/v1/W19-4828", "Clark et al.", 2019),
    #doi("10.18653/v1/2023.findings-emnlp.476", "Starace et al.", 2023)
    등의 논문을 발제함.
  ], 
  end: true,
)

#header[보유 기술]

#let cp = text(10pt)[C] + h(-.8pt) + text(
  5.5pt, baseline: -0.2em, font: "JetBrainsMono NF"
)[+]
#let cpp = cp + h(-.2pt) + text(
  5.5pt, baseline: -0.2em, font: "JetBrainsMono NF"
)[+]

#timeline-entry(
  title: "프로그래밍 언어",
  body: [
    C (2016), Java (2018), *Python* (2019), *LaTeX* (2023), OCaml (2024), *Typst* (2024), JavaScript\/*TypeScript* (2024), Swift (2025), #cpp (2025), ReScript (2025), *React* (2025), Rust (2025)
  ], 
)

#timeline-entry(
  title: "기타",
  body: [
    Pandas (2019), PyTorch (2023), *React* (2023), GitHub Actions (2025)

    *굵은 글씨*는 자주 사용하는 것임.
  ], 
  end: true,
)


#place(bottom + right)[
  #show "작성일": set text(8pt)
  #text(9pt, font: sans-fonts)[작성일: \2025. 9. 21.]
]
