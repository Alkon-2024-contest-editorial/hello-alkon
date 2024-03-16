#import "colors.typ" : KUPC_GREEN, PALE_RED
#import "problems.typ" : contest_problems
#import "abstractions.typ" : pick_color

#let mono(s, color: black) = {text(font: "Inconsolata", fill: color)[#s]}
#let bf(s) = {text(weight: "bold")[#s]}

// 줄바꿈은 #linebreak()를 중간에 넣으면 됩니다.
// 페이지 넘김은 문제 내부에서 ()를 새로 만들어 주세요.
// monospace 문자열은 #mono("abc")와 같이 쓸 수 있습니다.
// 미리 정의되지 않은 operation의 경우에는 #math.op("MEX")와 같이 쓰면 됩니다. 대부분은 정의돼 있으니 그냥 $cos$ 와 같이 쓰면 됩니다.
// 시간복잡도는 $cal(O)(N log N)$ 와 같이 써주세요. log가 자체적으로 함수가 있습니다.
// 이모지는 그냥 넣으면 됩니다. 지원하지 않는 이모지는 깨집니다. 이모지는 https://github.com/polazarus/typst-svg-emoji 를 사용했습니다.
// 그래프도 작성 가능합니다. https://www.graphviz.org/docs/graph/ 를 참고해서 ```render <여기에 그래프를 작성하세요>```

#let cell(num, color: black, fill: none, stroke: none) = {
  rect(
    height: 50pt, width: 50pt,
    stroke: stroke,
    fill: fill,
  )[#align(center + horizon)[#text(fill: color)[#num]]];
}

#let descriptions = (
  // 2A
  (
    (
      [- n은 가장 아랫부분 정사각형 개수이기도 하지만, 높이이기도 합니다. ],
      [- 양옆을 보면 높이 만큼 변이 있습니다. $2 dot n$],
      [- 밑변은 문제 정의에 따라 n만큼 변이 있습니다. $2 dot n + n$],
      [- 남은 윗부분도 결국 다 합치면 길이가 n일 것입니다. $2 dot n + n + n$]
    ),
  ),
  // 2B
  (
    (
      [- 나머지 연산자는 %입니다.],
      [- 거의 모든 언어에서 중복을 허용하지 않는 자료형인 set을 지원합니다.],
      [- set의 길이를 구해줍니다. c++의 경우 .size()]
    ),
    (
      [- set없이 길이 42 bool 배열로도 풀 수 있습니다.],
      [- 42로 나눈 나머지를 인덱스로 생각합니다. ],
      [- 해당 인덱스를 True로 바꿔줍니다. ],
      [- True인 것의 갯수를 구합니다.]
    ),
  ),
  // 2C
  (
    (
      [- 대소문자를 구별하지 않을 때 주어진 문자열을 모두 대문자(취향에 따라 소문자)로 바꾸면 편해집니다.],
      [- c++ map, python dict와 같은 자료형으로 각 문자가 몇개 나오는지 셉니다.],
      [- 26크기의 배열에서 계산해도 됩니다. 아스키코드를 통해 인덱스를 정합니다.(나중에 이런 문제를 만난다면, 이게 더 빠를 것입니다.)],
    ),
  ),
  // 2D
  (
    (
      [- 우린 $n$보다 큰 값 중 최솟값과 $n$보다 작은 값중 최댓값이 궁금합니다.],
      [- 따라서 $S$를 정렬하고 $S$에서 $n$이 어디 사이에 위치하는지 봅니다. 만약에 $S$의 최소보다 작다면 $0$과 $min(S)$ 사이에 있다고 생각하면 됩니다.],
      [- $n$이 $a$와 $b$ ($a,b in S, a < b$) 사이에 있는 상황입니다. ],
      [- $a+1, a+2, +...+b-2, b-1, b$ 각각을 기준점으로 잡고 구간의 개수를 계산해줍니다.],
      [- S의 원소는 1이상 1000이하이므로 $cal(O)((b-a+1)^2)$ 복잡도로 풀 수 있습니다.] 
    ),
  ),
  // 2E/1A
  (
    (
      [- 어떤 의상 종류를 아예 안입거나, 그 중 하나를 입는 경우의 수는  그 종류의 의상갯수 $+ 1$],
      [- 모든 종류에 대해 다 곱해줍니다.],
      [- 옷을 아무것도 안입는 것은 용납이 안되므로 1을 빼줍니다.]
    ),
  ),
  // 1B
  (
    (
      [- 우린 각 위치에 도달하는 최소 시간이 궁금하므로 BFS를 이용해 최단거리를 구할 수 있습니다.],
      [- $N = 50001, K = 100000$과 같은 인풋을 주의합시다. 과정 중간에 위치가 $100000$이 넘어갈 수 있습니다. 여유롭게 설정합시다.]
    ),
    (
      [- BFS],
      [1. 처음에 큐에 수빈이의 위치($N$)를 넣어줍시다.],
      [2. 큐에서 위치($p$)를 꺼냅니다. ],
      [3. $p+1, p-1, p dot 2$를 보면서 만약 방문하지 않았다면 방문 처리를 한 뒤 큐에 넣어줍니다.],
      [- 방문 처리는 배열을 만들고 위치를 인덱스로 해서  이동시간을 넣어줍니다.],
    ),
  ),
  // 1C
  (
    (
      [- 원판이 $x$개 있는 하노이탑은 다음 과정을 거칩니다.],
      [- 가장 작은 원판부터 1번이라고 합시다.],
      [1. $1~x-1$번 원판을 1번에서 2번 막대로 옮긴다.],
      [2. $x$번 원판을 1번에서 3번으로 옮긴다.],
      [3. $1~x-1$번 원판을 2번에서 3번으로 옮긴다.],
      [- $F(x)$를 원판이 x개인 하노이탑을 다른 막대로 옮기는데 필요한 이동 횟수라고 합시다.],
      [- 1,2,3번을 그대로 나타내면 $F(x) = F(x-1) + 1 + F(x-1)$ 이 성립합니다.]
      
    ),
    (
      [- $K$번째 이동이 1, 2, 3번 과정중 어떤 과정에 속하는지가 중요합니다. 과정에 속하지 않는 이동은 의미 없습니다.],
      [- $K$번째 이동이 속하는 과정에 대해 재귀적으로 수행합니다.],
      [- $cal(O)(log F(N))$ 의 복잡도로 해결 가능합니다.],
    ),
  ),
  // 1D
  (
    (
      [- 정답이 $A$라면, $A$이상의 공정라인을 가지고 있다면 $X$시간 내에 작업을 끝낼 수 있습니다.],[- $A$미만의 공정라인을 가지고 있다면 $X$시간 내에 작업을 끝낼 수 없습니다,],[- 공정라인이 정해져 있을때 $X$시간 내에 작업을 마칠 수 있는지 없는지 체크하는 것은 우선순위 큐를 이용해 풀 수 있습니다.],[- 따라서 매개변수탐색을 통해 $A$를 찾습니다.]
    ),
  ),
  // 1E
  (
    (
      [- 왼쪽 방향에 대해서만 생각해봅시다.],[- $0$번째부터 $i$번째 버튼의 색을 같게 만들 때 눌러야 하는 횟수$F(i)$는],
      [- $F(i) = F(i-1) + cases(X_(i-1) - X_i "if" X_(i-1) >= X_i, X_(i-1) + C - X_i "else")$],
      [- 누적합을 이용해 모든 인덱스에 대해 위 식의 값을 $cal(O)(N)$ 복잡도로 구할 수 있습니다.],
      [- 오른쪽 방향에 대해서도 구해준 뒤 최솟값을 구해줍니다. ]
    ),
  ),
)

#let isDiv1(problem) = {
  return problem.d1.trim().len() != 0
}

#let isDiv2(problem) = {
  return problem.d2.trim().len() != 0
}

#let constructTitle(problem, size: 2.5em) = {
  let title = "";
  if (isDiv2(problem)) {title += "2" + problem.d2}
  if (isDiv2(problem) and isDiv1(problem)) {title += "/"}
  if (isDiv1(problem)) {title += "1" + problem.d1}
  
  set text(size: size)
  text(title, weight: 600, fill:KUPC_GREEN)
  text(". " + problem.title, weight: 400, fill:KUPC_GREEN)
}

#let create_page(index) = {

  set list(marker: text(fill:KUPC_GREEN)[✓])

  for pg in descriptions.at(index) {
    [#constructTitle(contest_problems.at(index), size: 2em) #v(5em)]
    for desc in pg {
      set text(size: 2em)
      pad(left: -1.5em)[#desc]
      v(0em);
    }
    pagebreak(weak: true)
  }
}

