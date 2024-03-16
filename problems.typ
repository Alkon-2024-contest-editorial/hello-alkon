#let raw_problems = (
  // Div.2 Number, Div.1 Number, Title, Difficulty, 예상 티어 "bsgpdr" 중 하나
    ("A","", "수학은 체육과목 입니다", "B3", "b"),
    ("B","", "나머지", "B2", "b"),
    ("C","", "단어 공부", "B1", "b"),
    ("D","", "좋은 구간", "S4", "s"),
    ("E","A", "패션왕 신혜빈", "S3", "s"),
    ("","B", "숨바꼭질", "S1", "s"),
    ("","C", "하노이 탑 K", "G4", "g"),
    ("","D", "공장 컨설턴트 호석", "G3", "g"),
    ("","E", "색깔 통일하기", "G2", "g"),
)

#let contest_problems = raw_problems.map( problem => {
  (
    d2: problem.at(0),
    d1: problem.at(1),
    title: problem.at(2),
    difftext: problem.at(3),
    diff: problem.at(4)
  )
})
