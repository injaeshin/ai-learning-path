# 게임 서버 프로그래머를 위한 AI 직무 전환 커리큘럼

## 1. 과정 정의

이 과정은 게임 서버 프로그래머의 경력을 버리고 AI 신입으로 다시 시작하는 과정이 아니다. 기존의 백엔드·분산 시스템·운영 경험 위에 ML·LLM의 공통 원리를 쌓고, 신뢰할 수 있는 AI 시스템을 설계·구현할 수 있는 엔지니어로 확장하는 과정이다.

- 기간: 20주
- 학습 시간: 주 15시간, 총 300시간
- 구성: 16주 공통 과정 + 4주 선택 심화
- 주력 언어: Python
- 보조 기술: SQL, FastAPI, PyTorch, 검색 엔진 또는 Vector Store, Docker
- 프레임워크: 원리를 직접 구현한 뒤 필요한 시점에만 도입
- 누적 프로젝트: `GameOps AI Assistant`

### 전제

- 서버 프로그래밍, HTTP, DB, 비동기 처리, 테스트, 장애 대응 경험이 있다.
- Python은 빠르게 습득할 수 있다.
- ML, 딥러닝, LLM 이론은 입문 단계에서 시작한다.
- 16주차까지 목표 직무를 하나로 확정하지 않는다.
- 17주차에 AI Application·Agent, AI Platform, ML Engineer 중 하나를 선택한다.

### 16주 공통 과정의 최종 목표

과정이 끝났을 때 다음을 수행할 수 있어야 한다.

1. ML 모델과 LLM의 기본 동작을 시스템 관점에서 설명한다.
2. 데이터 분할, 평가 지표, 과적합, 데이터 누수를 구분한다.
3. LLM API, Structured Output, Tool Calling, Agent Loop를 직접 구현한다.
4. 키워드 검색, Vector Search, Hybrid Search, Reranking을 비교한다.
5. 검색 품질, 답변 품질, 도구 실행 품질을 분리해 평가한다.
6. timeout, retry, cancellation, 권한, 관측성, 비용을 포함한 AI 서비스를 설계한다.
7. 구현 결과와 한계를 코드·수치·실패 사례로 설명한다.

## 2. 학습 기조

### 2.1 프로젝트 누적은 7주차부터 본격화한다

1~6주는 결과물을 빠르게 만드는 구간이 아니다. 개념을 배우고 작은 실험으로 직접 확인하는 구간이다. 이 시기에는 `GameOps AI Assistant`의 완성도보다 개념을 설명하고 예측하는 능력을 우선한다.

```text
1~6주
이론 → 손 계산 → 마이크로 실험 → 설명 검증

7~16주
개념 복습 → 독립 구현 → 누적 프로젝트 통합 → 평가

17~20주
직무 선택 → 심화 구현 → 검증 → 포트폴리오 정리
```

### 2.2 학습 완료는 동작 여부로 판단하지 않는다

코드가 실행되는 것은 시작 조건이다. 다음 네 가지가 모두 가능해야 해당 개념을 이해한 것으로 본다.

- 설명: 핵심 개념과 구성 요소의 관계를 자신의 말로 설명한다.
- 예측: 설정이나 데이터가 달라지면 결과가 어떻게 변할지 실행 전에 예상한다.
- 변형: 예제의 요구사항을 바꾸고 스스로 코드를 수정한다.
- 진단: 실패한 결과의 원인을 데이터, 모델, 검색, 애플리케이션 계층으로 나눠 조사한다.

### 2.3 AI Agent는 Tutor와 Reviewer로 사용한다

| 사용 방식 | 허용 범위 |
|---|---|
| 적극 사용 | 질문 생성, 개념 오류 지적, 반례 제시, 코드 리뷰, 면접형 후속 질문 |
| 조건부 사용 | 힌트, 의사 코드, 테스트 사례, 오류 원인 후보 |
| 첫 시도에서 제한 | 전체 구현, 완성된 Notebook, 실험 해석 대행, 아키텍처 결정 대행 |

AI가 작성한 코드는 다음 조건을 모두 만족할 때만 학습 결과에 포함한다.

1. 주요 함수의 입력, 출력, 상태 변화, 실패 조건을 설명할 수 있다.
2. 요구사항 하나를 변경하고 AI 도움 없이 수정할 수 있다.
3. 핵심 알고리즘을 더 작은 형태로 다시 구현할 수 있다.

### 2.4 매주 하나의 가설을 검증한다

매주 최소 하나의 실험을 다음 형식으로 기록한다.

```text
가설
실험 조건
예상 결과
실제 결과
예상과 달랐던 이유
다음 실험
```

이 기록은 포트폴리오 분량을 늘리기 위한 문서가 아니라, 이해 여부를 확인하기 위한 증거다.

## 3. 전체 구조

| 섹션 | 기간 | 시간 | 중심 질문 | 핵심 결과 |
|---|---:|---:|---|---|
| A. 데이터와 ML 기반 | 1~3주 | 45시간 | 데이터로 예측한다는 것은 무엇인가? | 이탈 예측 실험과 평가 리포트 |
| B. 딥러닝과 LLM 기반 | 4~6주 | 45시간 | 신경망과 LLM은 무엇을 학습하고 출력하는가? | 신경망·임베딩·LLM 마이크로 실험 |
| C. LLM Application과 Agent | 7~9주 | 45시간 | 모델 출력을 어떻게 소프트웨어 동작으로 연결하는가? | Tool Calling 기반 Mini Agent |
| D. Agent Runtime과 신뢰성 | 10~11주 | 30시간 | 장시간 실행되는 Agent를 어떻게 통제하는가? | 상태·이벤트·실패 처리를 갖춘 Runtime |
| E. Retrieval과 RAG | 12~13주 | 30시간 | 필요한 근거를 어떻게 찾고 검증하는가? | Hybrid RAG와 검색 비교 결과 |
| F. Evaluation과 Production | 14~16주 | 45시간 | AI 시스템을 어떻게 측정하고 운영하는가? | Production GameOps AI Assistant |
| G. 선택 심화 기반 | 17~18주 | 30시간 | 어느 직무를 더 깊게 탐색할 것인가? | 직무별 핵심 기능 확장 |
| H. 선택 심화 완성 | 19~20주 | 30시간 | 지원 가능한 증거로 어떻게 완성할 것인가? | 검증 결과와 포트폴리오 패키지 |

## 4. 섹션 A — 데이터와 ML 기반

### 기간

1~3주, 45시간

### 학습 방향

Python 문법 학습을 최소화하고 데이터의 의미, 모델 평가, 실험 설계에 시간을 사용한다. 이 구간에서는 복잡한 모델보다 단순한 baseline을 정확히 해석하는 것이 중요하다.

### 목표

- feature, label, sample을 구분한다.
- 평균, 분산, 분포, 조건부 확률을 데이터 해석에 사용한다.
- train, validation, test의 역할을 구분한다.
- accuracy, precision, recall, F1을 문제 상황에 맞게 선택한다.
- 과적합, 데이터 누수, 클래스 불균형을 실험으로 확인한다.

### 주차별 액션

#### 1주차 — 데이터와 측정

- 접속, 매치 시작, 매치 종료, 아이템 구매로 구성된 게임 이벤트 데이터를 준비한다.
- 평균 플레이 시간, 접속 빈도, 매치 실패율을 SQL과 Pandas로 각각 계산한다.
- 소규모 표본의 평균, 분산, 조건부 비율을 손으로 계산한 뒤 코드 결과와 비교한다.
- 이탈 예측 문제의 feature와 label을 직접 정의한다.
- 미래 데이터가 feature에 섞이는 데이터 누수 사례를 만든다.

#### 2주차 — 지도학습과 평가

- 항상 다수 클래스를 선택하는 baseline을 구현한다.
- Logistic Regression 또는 단순 Tree 모델로 이탈을 예측한다.
- Confusion Matrix에서 accuracy, precision, recall, F1을 직접 계산한다.
- 분류 threshold를 변경하면서 지표의 변화를 관찰한다.
- 학습 데이터와 검증 데이터의 성능 차이를 비교한다.

#### 3주차 — 실험과 일반화

- 클래스 불균형이 accuracy를 왜곡하는 사례를 재현한다.
- 데이터 누수가 포함된 모델과 제거한 모델을 비교한다.
- 데이터 크기와 feature 수를 바꾸며 과적합을 관찰한다.
- seed, 데이터 버전, 설정, 지표를 기록해 실험을 재현한다.
- 모델이 틀린 사례를 유형별로 분류한다.

### 결과물

- 게임 사용자 이탈 예측 baseline
- 데이터와 평가 지표 설명 문서
- 정상 실험과 데이터 누수 실험 비교 리포트

### 진입 게이트

다음 작업을 자료 없이 수행해야 섹션 B로 넘어간다.

- Confusion Matrix에서 주요 지표를 계산한다.
- accuracy가 높은 모델이 쓸모없을 수 있는 사례를 설명한다.
- 데이터 누수와 과적합의 차이를 설명한다.
- 특정 문제에서 precision과 recall 중 무엇을 우선할지 근거를 제시한다.
- 새로운 게임 이벤트 필드가 적절한 feature인지 판단한다.

## 5. 섹션 B — 딥러닝과 LLM 기반

### 기간

4~6주, 45시간

### 학습 방향

수학적 증명을 목표로 하지 않는다. 입력이 어떤 변환을 거쳐 출력이 되고, 오차가 어떻게 가중치를 변경하며, LLM이 왜 확률적인 결과를 만드는지 설명할 수 있는 수준을 목표로 한다.

### 목표

- vector, matrix, weight, loss, gradient의 관계를 설명한다.
- 학습과 추론에서 모델 상태가 어떻게 다른지 설명한다.
- 임베딩과 유사도 검색의 의미와 한계를 이해한다.
- Attention과 Transformer의 핵심 데이터 흐름을 설명한다.
- token, context window, sampling, hallucination을 실험으로 확인한다.

### 주차별 액션

#### 4주차 — 신경망의 학습

- 단일 뉴런의 forward 계산을 손으로 수행한다.
- 작은 선형 계층의 tensor shape를 단계별로 추적한다.
- loss 계산 후 optimizer 실행 전후의 weight를 비교한다.
- 작은 데이터에 신경망을 의도적으로 과적합시킨다.
- inference에서 gradient와 weight update가 필요하지 않은 이유를 설명한다.

#### 5주차 — 임베딩과 Attention

- 2~3차원 vector의 dot product와 cosine similarity를 손으로 계산한다.
- 게임 문서 또는 아이템 설명을 임베딩하고 가까운 문장을 검색한다.
- 키워드 검색과 임베딩 검색의 성공·실패 사례를 비교한다.
- 작은 query, key, value 행렬로 attention score를 계산한다.
- query가 바뀔 때 참고 정보가 달라지는 과정을 기록한다.

#### 6주차 — Transformer와 LLM

- 같은 문장을 tokenizer에 입력하고 token 분할을 관찰한다.
- 입력 길이에 따른 token 수, latency, 비용 변화를 측정한다.
- temperature를 바꾸며 출력의 일관성과 다양성을 비교한다.
- 근거가 없는 질문, 충돌하는 context, 긴 context에서 실패 사례를 수집한다.
- LLM, RAG, Agent의 경계를 하나의 데이터 흐름으로 그린다.

### 결과물

- 신경망 학습 마이크로 실험
- 키워드 검색과 임베딩 검색 비교
- Transformer·LLM 데이터 흐름 설명
- LLM 실패 사례 모음

### 진입 게이트

다음 흐름을 빈 화면에서 설명해야 섹션 C로 넘어간다.

```text
Text
→ Token
→ Embedding
→ Transformer
→ 다음 Token의 확률 분포
→ Sampling
→ Output
```

추가로 다음을 설명해야 한다.

- 학습과 추론의 차이
- embedding과 답변 생성의 차이
- context와 memory의 차이
- temperature가 모델의 지식을 바꾸지 않는 이유
- RAG가 모델을 다시 학습시키지 않는 이유
- LLM과 Agent의 책임 경계

## 6. 섹션 C — LLM Application과 Agent

### 기간

7~9주, 45시간

### 학습 방향

이 섹션부터 누적 프로젝트를 본격적으로 시작한다. 프레임워크 없이 Model Client, Tool Calling, Agent Loop를 직접 구현해 각 책임의 경계를 이해한다.

### 목표

- LLM 요청, streaming event, 최종 응답을 구분한다.
- Structured Output을 검증한다.
- Tool Schema, Tool Call, Tool Result의 생명주기를 구현한다.
- 종료 조건과 실행 예산을 가진 Agent Loop를 구현한다.

### 주차별 액션

#### 7주차 — Model Client

- 일반 응답과 streaming 응답을 구현한다.
- 요청 ID, 모델, token 사용량, latency를 기록한다.
- Pydantic으로 Structured Output을 검증한다.
- timeout, rate limit, 잘못된 응답을 명시적인 오류로 변환한다.
- provider 의존 코드를 Model Client 내부로 제한한다.

#### 8주차 — Tool Calling

다음 read-only 도구를 구현한다.

```text
query_game_metrics
search_incident
read_operation_document
calculate
```

- Tool Schema와 실제 함수 입력을 일치시킨다.
- 잘못된 인자, 존재하지 않는 도구, 도구 내부 오류를 처리한다.
- Tool 실행 전 권한과 인자 범위를 검사한다.
- Tool Call과 Tool Result를 실행 기록에 남긴다.

#### 9주차 — Agent Loop

- 모델 응답에서 Tool Call을 추출한다.
- Tool Result를 다음 모델 요청에 연결한다.
- 최대 turn, Tool Call 수, 실행 시간을 제한한다.
- 동일 도구 반복 호출과 진행 없는 반복을 탐지한다.
- 최종 답변과 중간 실행 이벤트를 분리한다.

### 결과물

`GameOps Mini Agent`

```text
질문
→ 모델 판단
→ 지표 조회 또는 장애 검색
→ Tool Result 검증
→ 추가 판단
→ 근거가 포함된 답변
```

### 진입 게이트

- 모델이 Tool을 직접 실행하지 않는 이유를 코드 흐름으로 설명한다.
- 잘못된 Tool Call이 실제 실행으로 이어지지 않는다.
- Tool 실패가 Agent 프로세스 전체를 종료하지 않는다.
- 이벤트 로그만으로 한 번의 실행을 재구성할 수 있다.
- 새로운 read-only Tool 하나를 독립적으로 추가할 수 있다.

## 7. 섹션 D — Agent Runtime과 신뢰성

### 기간

10~11주, 30시간

### 학습 방향

한 번 성공하는 Agent를 중단·재시도·복구할 수 있는 Runtime으로 발전시킨다. Codex 구조 분석은 전체 소스 탐색이 아니라 하나의 요청 흐름을 추적하고 자신의 구현과 비교하는 수준으로 제한한다.

### 목표

- Thread, Turn, Message, Item, Event를 구분한다.
- 대화 상태와 실행 상태를 분리한다.
- timeout, cancellation, idempotency, compaction을 구현한다.
- 실제 Agent Runtime에서 필요한 책임을 비교한다.

### 액션

- Thread와 Turn 상태를 저장하고 후속 질문을 처리한다.
- Tool 실행에 timeout과 cancellation을 전파한다.
- idempotency key로 중복 실행을 방지한다.
- 큰 Tool Result를 자르거나 요약하고 원본 참조를 보존한다.
- 반복 횟수, token, 시간, 비용 예산을 적용한다.
- 프로세스 중단 후 완료되지 않은 Turn의 상태를 판별한다.
- Codex의 사용자 요청 하나가 Client, App Server, Core, Model, Tool을 거치는 흐름을 추적한다.
- 자신의 Runtime에 없는 책임과 의도적으로 제외한 책임을 기록한다.

### 결과물

```text
Agent Runtime
├─ Model Client
├─ Tool Registry
├─ Agent Loop
├─ State Store
├─ Context Manager
├─ Budget Policy
└─ Event Stream
```

### 진입 게이트

다음 상황을 자동 테스트로 재현하고 기대 상태를 검증한다.

- 모델 API timeout
- Tool 실행 실패
- 같은 Tool의 반복 호출
- 사용자의 실행 취소
- 중복 요청
- context 한도 초과
- 프로세스 중단 후 재실행

## 8. 섹션 E — Retrieval과 RAG

### 기간

12~13주, 30시간

### 학습 방향

Vector Store 사용법보다 검색 파이프라인의 각 단계와 실패 원인을 이해한다. 검색 결과와 생성 답변을 별도로 평가할 수 있도록 설계한다.

### 목표

- 문서 정규화, chunking, metadata의 영향을 설명한다.
- 키워드 검색과 Vector Search를 비교한다.
- Hybrid Search와 Reranking을 구현한다.
- 답변에 근거를 연결하고 근거가 없으면 답변을 보류한다.

### 액션

- 게임 운영 문서, 패치 노트, 장애 보고서를 검색 데이터로 준비한다.
- 문서 종류에 따라 chunk 크기와 경계를 다르게 적용한다.
- 키워드 검색과 Vector Search를 각각 구현한다.
- 같은 질문 집합으로 두 방식의 검색 결과를 비교한다.
- 검색 결과를 결합하고 Reranking한다.
- 문서 ID와 구간 정보를 최종 인용까지 보존한다.
- Static RAG와 Agentic Retrieval을 같은 질문으로 비교한다.
- 검색 결과가 부족하거나 충돌하면 답변을 보류하게 한다.

### 결과물

- 문서 적재 파이프라인
- 키워드·Vector·Hybrid 검색 구현
- 인용이 포함된 RAG 응답
- Static RAG와 Agentic Retrieval 비교

### 진입 게이트

- 검색 실패와 생성 실패를 구분한다.
- 검색 결과가 바뀐 원인을 chunking, query, filter, ranking으로 나눠 조사한다.
- 모든 사실성 답변에 검증 가능한 문서 참조가 있다.
- 검색 근거가 부족한 질문에는 불확실성을 표시하거나 답변을 보류한다.

## 9. 섹션 F — Evaluation과 Production AI

### 기간

14~16주, 45시간

### 학습 방향

앞에서 만든 기능을 운영 가능한 하나의 서비스로 통합한다. 새로운 기능 추가보다 품질 측정, 실패 처리, 권한, 관측성, 재현성을 우선한다.

### 목표

- Golden Set과 회귀 평가를 구축한다.
- 검색, 답변, Tool, 시스템 지표를 분리한다.
- 인증, 권한, 승인 경계를 구현한다.
- trace, latency, token, 비용을 관측한다.
- 다른 개발자가 실행하고 검증할 수 있는 프로젝트로 정리한다.

### 주차별 액션

#### 14주차 — Evaluation

- 실제 사용 흐름을 반영한 질문 50개 이상의 Golden Set을 작성한다.
- 단순 LLM, Static RAG, Hybrid RAG, Agentic Retrieval을 비교한다.
- 검색 성공률, 인용 정확성, 답변 정확성, Tool 성공률, latency, token 비용을 측정한다.
- 실패 사례를 데이터, 검색, 모델, Tool, 정책, 시스템 계층으로 분류한다.
- 프롬프트나 검색 변경 전후를 비교하는 회귀 평가를 자동화한다.

#### 15주차 — 보안과 운영

- 사용자와 운영자 권한을 구분한다.
- read-only Tool과 승인 필요 Tool의 정책을 분리한다.
- Prompt Injection과 민감 데이터 노출 시나리오를 테스트한다.
- 요청별 trace와 Tool 실행 기록을 연결한다.
- timeout, retry, fallback, rate limit을 서비스 정책으로 통합한다.
- Docker 기반 실행 환경과 CI 검증 명령을 구성한다.

#### 16주차 — 통합과 검증

- 독립 환경에서 README만으로 서비스를 실행해본다.
- 정상 흐름, 권한 거부, Tool 실패, 검색 실패, 모델 실패를 시연한다.
- 부하 테스트와 장애 주입 결과를 기록한다.
- 아키텍처, 데이터 흐름, 주요 결정, 알려진 한계를 정리한다.
- 기술 면접에서 설명할 수 있는 프로젝트 이야기로 압축한다.

### 공통 과정 최종 결과물

`Production GameOps AI Assistant`

```text
Client
→ Agent API
→ Authentication / Authorization
→ Agent Runtime
   ├─ Context and State
   ├─ Hybrid RAG
   ├─ Game Metrics Tool
   ├─ Incident Search Tool
   └─ Approval Policy
→ Evaluation / Tracing / Cost Monitoring
```

### 16주차 완료 게이트

- 다른 개발자가 문서만 보고 실행할 수 있다.
- 자동 테스트와 회귀 평가가 재현된다.
- 답변 품질 개선을 측정 결과로 설명한다.
- timeout, retry, cancellation, 권한 거부가 검증되어 있다.
- 지원 직무와 무관하게 AI 시스템의 구성 요소와 한계를 설명할 수 있다.
- UI, Multi-Agent, Fine-tuning 없이도 핵심 사용 흐름이 완결된다.

## 10. 섹션 G·H — 4주 선택 심화

### 선택 시점

16주차 결과를 기준으로 다음 질문에 답한 뒤 하나를 선택한다.

- AI 기능과 사용자 워크플로를 설계하는 일이 가장 흥미로운가?
- 성능, 비용, 배포, 장애 해결이 가장 흥미로운가?
- 데이터 가설과 모델 성능을 개선하는 일이 가장 흥미로운가?

### 트랙 A — AI Application·Agent Engineer

#### 17~18주: 상태 기반 워크플로

- LangChain의 Model, Message, Tool abstraction을 짧게 확인한다.
- LangGraph의 State, Node, Edge, Conditional Edge, Checkpoint를 학습한다.
- 직접 만든 Agent Loop와 프레임워크가 대신하는 책임을 비교한다.
- GameOps Agent의 승인 흐름을 상태 그래프로 재구현한다.
- 중단 후 재개와 Human-in-the-loop를 추가한다.

#### 19~20주: 신뢰 가능한 Agent 완성

- 도구별 권한과 실행 정책을 강화한다.
- 장기 실행, 반복, 잘못된 계획, Prompt Injection 평가를 추가한다.
- 직접 구현과 LangGraph 구현의 복잡도와 제어 가능성을 비교한다.
- Agent 설계 결정, 평가 결과, 실패 분석을 포트폴리오로 정리한다.
- Agent System Design 면접 질문으로 구두 방어를 수행한다.

최종 결과: 평가·승인·재개를 지원하는 상태 기반 GameOps Agent

### 트랙 B — AI Platform·MLOps Engineer

#### 17~18주: AI Gateway와 서빙 기반

- 외부 Model API와 자체 Model Serving의 구조를 비교한다.
- 요청 라우팅, concurrency limit, queue, cache, rate limit을 구현한다.
- 동일 요청과 유사 요청의 cache 정책을 구분한다.
- 부하 테스트로 처리량, latency, 오류율을 측정한다.
- GPU, batching, quantization, vLLM의 역할과 적용 조건을 학습한다.

GPU가 없으면 hosted model과 로컬 mock endpoint를 함께 사용해 부하, retry, fallback, routing을 재현한다. GPU 최적화 수치는 주장하지 않고 구조와 측정 방법까지만 다룬다.

#### 19~20주: 운영과 비용 최적화

- 서비스 수준 목표와 오류 예산을 정의한다.
- 모델 또는 provider 장애 시 fallback을 구현한다.
- 비용, token, queue time, model latency를 분리해 관측한다.
- 배포, 설정 변경, rollback 절차를 검증한다.
- 장애 분석과 용량 계획을 포트폴리오로 정리한다.

최종 결과: 다중 모델 라우팅과 장애 복구를 지원하는 AI Gateway

### 트랙 C — ML Engineer

#### 17~18주: 모델링 심화

- 게임 이탈 예측 또는 이상 탐지 중 하나를 선택한다.
- feature engineering과 cross validation을 수행한다.
- 클래스 불균형과 threshold 정책을 다룬다.
- baseline과 여러 모델을 동일한 데이터 분할로 비교한다.
- 실험 설정, 데이터 버전, 결과를 추적한다.

#### 19~20주: 학습·배포·모니터링

- 재현 가능한 학습 파이프라인을 작성한다.
- 모델을 API로 배포한다.
- 학습 시점과 서빙 시점의 feature 일치를 검증한다.
- data drift와 model performance 변화를 감지한다.
- 모델 카드, 실험 결과, 실패 사례를 포트폴리오로 정리한다.

최종 결과: 학습·배포·모니터링이 연결된 게임 이탈 예측 또는 이상 탐지 시스템

4주의 ML 심화는 ML 직무 적합성을 확인하고 첫 프로젝트를 만드는 범위다. ML Engineer를 주력 지원 직무로 확정하면 통계, 실험 설계, 모델링을 위한 추가 심화 기간을 별도로 둔다.

## 11. 주 15시간 운영 방식

### 1~6주

| 활동 | 주간 시간 |
|---|---:|
| 개념 학습과 교재 읽기 | 6시간 |
| 손 계산과 마이크로 실험 | 3시간 |
| 최소 코드 구현 | 3시간 |
| 복습 시험과 설명 수정 | 3시간 |

### 7~20주

| 활동 | 주간 시간 |
|---|---:|
| 개념과 공식 문서 | 3시간 |
| 최소 실습 | 3시간 |
| 독립 구현과 프로젝트 통합 | 5시간 |
| 테스트·평가·실패 분석 | 2시간 |
| 회고·다이어그램·포트폴리오 기록 | 2시간 |

### 하루 3시간의 기본 흐름

```text
30분  이전 학습을 자료 없이 회상
45분  새로운 개념 학습
90분  손 실험, 구현 또는 평가
15분  예상과 실제 결과 기록
```

요일별 활동은 상황에 맞게 바꿀 수 있지만, 강의와 문서 읽기만으로 하루를 끝내지 않는다.

## 12. 섹션 종료 검토 방식

각 섹션에서는 다음 네 가지 증거만 남긴다.

1. 동작하는 코드
2. 자동 테스트 또는 재현 가능한 실험
3. 예상과 실제 결과가 포함된 분석
4. 한 장 분량의 구조 설명과 회고

섹션 게이트를 통과하지 못하면 다음 원칙을 적용한다.

- 핵심 개념의 실패는 다음 섹션 첫 학습 시간에 보완한다.
- UI, Multi-Agent, Fine-tuning, 복잡한 프레임워크 같은 선택 기능을 제거한다.
- 프로젝트 기능 수를 늘려 진도 부족을 감추지 않는다.
- 같은 예제를 반복하지 않고 입력, 데이터, 실패 조건을 바꿔 다시 검증한다.

## 13. 범위에서 의도적으로 제외한 내용

16주 공통 과정에서는 다음을 필수로 다루지 않는다.

- 논문 수준의 수학적 증명
- 대규모 분산 학습
- LLM Pre-training
- Fine-tuning과 LoRA
- Multi-Agent System
- GPU Kernel 최적화
- 화려한 Web UI
- Codex 전체 코드베이스 분석

이 항목들은 공통 기반이 아니라 선택한 직무와 프로젝트에서 실제 필요가 확인될 때 학습한다.

## 14. 과정 종료 후 판단

20주 과정은 모든 AI 직무 준비의 완료점이 아니다. 기존 경력을 어느 방향으로 확장할지 증거를 가지고 결정할 수 있는 첫 완료점이다.

- AI Application·Agent: 프로젝트 평가와 워크플로 설계 경험을 중심으로 지원 준비를 계속한다.
- AI Platform·MLOps: 인프라, 관측성, 성능, 비용 최적화를 더 깊게 확장한다.
- ML Engineer: 통계, 실험 설계, 모델링을 추가로 심화한다.
- Research: 별도의 수학, 논문 구현, 연구 경험 과정이 필요하다.

이 과정의 성공 기준은 기술 이름을 많이 학습하는 것이 아니다. 자신이 만든 AI 시스템이 왜 동작하고, 언제 실패하며, 어떻게 측정하고 통제하는지 설명할 수 있는지가 기준이다.

## Source Notes

- 총 학습 시간은 사용자와 합의한 주 15시간, 20주를 기준으로 한다.
- 1~6주 이론·마이크로 실험, 7주 이후 프로젝트 누적이라는 구조는 ML·LLM 기초 이해가 부족한 상태에서 AI가 생성한 결과만 남는 위험을 줄이기 위한 설계다.
- 누적 프로젝트와 게임 운영 도메인은 기존 게임 서버 경력을 AI Application, AI Platform, ML 직무와 연결하기 위한 학습 장치다.
- 구체적인 라이브러리, 모델, 클라우드 서비스는 학습 시작 시점의 환경과 비용에 맞춰 선택하며, 커리큘럼의 개념·평가·완료 조건은 특정 공급자에 종속되지 않는다.
