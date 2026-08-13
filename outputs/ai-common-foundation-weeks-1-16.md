# AI 공통 이해 과정 1~16주

## 과정 정의

- 기간: 16주
- 학습 시간: 주 15시간, 총 240시간
- 선행 과정: 별도 0주차 10시간
- 대상: 서버 개발 경험은 있지만 ML·딥러닝·LLM 이론은 처음 배우는 개발자
- 목적: AI 기능을 빠르게 조립하기보다 원리, 실패 조건, 평가 방법을 이해한다.
- 결과물: 포트폴리오용 통합 프로젝트가 아니라 파트별 독립 미니 과제와 이해 검증 기록

0주차까지 합치면 공통 이해 과정은 총 250시간이다. 1~16주에는 하나의 애플리케이션을 계속 확장하지 않는다. 각 미니 과제는 독립적으로 실행하고 검증할 수 있게 유지한다. 다만 GameOps라는 공통 사례와 하나의 시스템 지도를 공유해, 앞에서 배운 내용이 뒤의 개념과 어떻게 이어지는지는 계속 확인한다.

## 과정의 목표

16주가 끝났을 때 다음을 할 수 있어야 한다.

1. 데이터, ML 모델, LLM, Retrieval, Tool, Agent Runtime, Evaluation의 역할을 구분한다.
2. AI 시스템의 실패를 데이터, 모델, 검색, 애플리케이션, Runtime, 권한·운영 계층으로 나눠 조사한다.
3. 모델이나 프레임워크가 만든 결과를 그대로 받아들이지 않고 평가 기준과 반례를 제시한다.
4. 작은 ML·LLM·Agent·RAG 실험을 직접 재현하고 조건을 바꿔 결과를 비교한다.
5. AI가 작성한 코드의 입력, 출력, 상태 변화, 실패 조건을 검토한다.
6. 이후 포트폴리오 프로젝트를 시작할 때 필요한 구성 요소와 검증 계획을 스스로 정한다.

## 전체 구성

| 파트 | 기간 | 중심 질문 | 학습 성격 |
|---|---:|---|---|
| 1. 데이터·ML 판단 기초 | 1~3주 | 데이터 기반 판단은 왜 틀릴 수 있는가? | 이론, 손계산, 작은 데이터 실험 |
| 2. 딥러닝·LLM 작동 원리 | 4~6주 | LLM은 입력을 어떻게 처리하고 왜 실패하는가? | 원리 이해, 마이크로 실험 |
| 3. LLM Application 제어 흐름 | 7~9주 | 모델 출력을 어떻게 안전한 소프트웨어 동작으로 바꾸는가? | Model Client, Structured Output, Tool, Loop 미니 구현 |
| 4. Agent Runtime과 실패 제어 | 10~11주 | Agent 실행을 어떻게 상태화하고 중단·실패·반복을 통제하는가? | State, Event, Budget, Cancellation 미니 실습 |
| 5. Retrieval과 근거 기반 응답 | 12~13주 | 필요한 정보를 찾고 답변 근거를 어떻게 검증하는가? | 검색, RAG, 인용, 답변 보류 실험 |
| 6. 평가·안전·운영 판단 | 14~16주 | AI 시스템의 품질·위험·비용을 어떻게 측정하고 통제하는가? | Eval, 권한, Injection, Trace, 비용·장애 실험 |

## 나선형 학습 방식

각 주에는 주된 학습 주제가 있다. 그렇다고 해당 파트만 고립해서 공부하지는 않는다. 같은 개념을 여러 번 만나면서 요구하는 이해 수준을 조금씩 높인다.

```text
0주차       이름, 위치, 대표 실패를 처음 확인
첫 등장     핵심 개념을 직관적으로 이해
두 번째     손계산이나 작은 코드로 결과 확인
세 번째     다른 구성 요소와 연결
네 번째     실패 원인을 진단
마지막      시스템 수준에서 선택하고 평가
```

예를 들어 Precision과 Recall은 2주차에 분류 모델의 평가 지표로 배운다. 12주차에는 검색 결과를 평가할 때 다시 사용하고, 14주차에는 전체 AI 응답 평가에서 어떤 오류를 더 중요하게 볼지 결정하는 기준으로 확장한다.

## 주 15시간 운영 방식

| 활동 | 시간 | 역할 |
|---|---:|---|
| 현재 파트 핵심 이론 | 5시간 | 이번 주의 중심 개념 학습 |
| 손계산·마이크로 실험 | 3시간 | 원리를 작은 입력으로 직접 확인 |
| 독립 구현·실패 재현 | 3시간 | AI 도움 없이 첫 시도 후 조건 변경 |
| 누적 복습·미니 테스트 | 2시간 | 이전 파트와 현재 파트 회상 |
| 미래 연결·호기심 분기 | 1시간 | 뒤에 다시 등장할 내용 미리 관찰 |
| 시스템 지도·회고 갱신 | 1시간 | 전체 구조에서 이번 지식의 위치 기록 |

### 하루 3시간의 기본 흐름

```text
30분  이전 개념 회상 또는 누적 문제
45분  핵심 이론 학습
90분  손계산, 구현, 실험 또는 실패 분석
15분  예상과 실제 결과, 남은 질문 기록
```

요일별 사정에 따라 시간을 합쳐도 된다. 주간 합계에서 복습과 실패 분석이 사라지지 않는 것이 더 중요하다.

## 매주 공통 산출물

매주 결과물은 다음 다섯 가지로 제한한다.

```text
개념 설명 1개
작은 구현 또는 재현 실험 1개
실패 사례와 원인 분석 1개
자동 테스트 또는 재현 절차 1개
복습용 구조 다이어그램 1개
```

문서 분량이나 코드 크기는 평가하지 않는다. 다른 입력이나 조건에서도 설명과 실험을 다시 수행할 수 있는지가 중요하다.

## AI Agent 사용 규칙

AI는 Tutor와 Reviewer로 사용한다. 첫 구현과 첫 설명을 대신 맡기지 않는다.

### 권장 순서

```text
1. 실행 결과를 먼저 예상한다.
2. 자료와 AI 없이 첫 시도를 한다.
3. 실패 상태와 원인 가설을 적는다.
4. AI에게 힌트, 반례, 추가 질문을 요청한다.
5. 직접 수정한다.
6. AI에게 설명에서 틀린 부분만 검토하게 한다.
7. 자료를 닫고 핵심 흐름을 다시 만든다.
```

### 적극적으로 맡겨도 되는 일

- 개념 이해를 확인할 질문 생성
- 학습자가 작성한 설명의 사실 오류 지적
- 반례와 추가 실험 조건 제안
- 직접 작성한 코드의 리뷰
- 실패 원인 가설에 대한 반론 제시
- 면접관 역할과 후속 질문

### 첫 시도에서 맡기지 않는 일

- 전체 학습 코드 작성
- 완성된 Notebook 생성
- 실험 결과 해석 대행
- 평가 지표나 임계값 결정 대행
- 미니 과제의 구조 전체 설계

AI가 작성한 코드는 주요 함수의 입력·출력·상태 변화·실패 조건을 설명하고, 요구사항을 하나 바꿔 직접 수정할 수 있을 때만 학습 결과로 인정한다.

## 누적 테스트 운영

### 매주 미니 테스트

30~45분 동안 네 유형을 푼다.

| 유형 | 확인 내용 | 예시 |
|---|---|---|
| 회상 | 정의와 데이터 흐름 | Train과 Validation을 왜 나누는가? |
| 예측 | 조건 변경 결과 | Threshold를 낮추면 어떤 지표가 변하는가? |
| 진단 | 실패 원인과 조사 순서 | 검색 결과는 맞는데 답변이 틀린 경우 어디부터 볼 것인가? |
| 연결 | 과거·미래 개념 관계 | ML Test Set과 LLM Golden Set은 무엇이 다른가? |

문제 비중은 현재 파트 60%, 직전 파트 25%, 그 이전 전체 15%로 둔다.

### 파트 종료 테스트

60~90분 동안 다음을 수행한다.

- 빈 화면에서 핵심 구조 그리기
- 실험 실행 전에 결과 예측하기
- 실패 로그의 원인과 조사 순서 설명하기
- 조건이 바뀐 작은 코드 수정하기
- AI 면접관의 후속 질문에 구두로 답하기

### 유연한 통과 기준

파트 종료 테스트를 통과하지 못해도 일정 전체를 멈추지는 않는다. 다음 파트 첫 주의 3시간을 보완 학습에 사용하고, 선택 범위나 호기심 분기를 줄인다.

다음 조건을 모두 만족하면 통과로 본다.

- 핵심 질문의 80% 이상을 자료 없이 설명한다.
- 필수 데이터 흐름을 빈 화면에서 다시 그린다.
- 예제 조건 하나를 바꾸고 결과를 예상한다.
- 실패 사례 하나의 원인과 수정 방향을 설명한다.

# 파트 1. 데이터·ML 판단 기초

## 기간과 중심 질문

- 기간: 1~3주, 45시간
- 중심 질문: 데이터 기반 판단은 왜 틀릴 수 있는가?

복잡한 모델보다 문제 정의, 데이터 생성 과정, Baseline, 평가 지표를 먼저 배운다. 모델 점수가 높다는 사실만으로 실제 판단이 좋아졌다고 결론 내리지 않는 것이 이 파트의 목표다.

## 1주차. 데이터와 문제 정의

### 학습 목표

- Sample, Feature, Label을 구분한다.
- 평균, 분산, 분포, 조건부 비율을 작은 데이터에서 계산한다.
- 데이터가 어떤 사건과 수집 절차를 거쳐 만들어졌는지 확인한다.
- 예측 문제와 단순 집계 문제를 구분한다.

### 이론 범위

```text
관측값과 모집단
평균, 중앙값, 분산, 표준편차
확률과 조건부 확률
Sample, Feature, Label
분류와 회귀
상관관계와 인과관계
```

### 미니 실습

20~50명의 가상 게임 사용자 데이터를 준비한다.

```text
최근 접속 일수
평균 플레이 시간
매치 실패 횟수
결제 여부
이탈 여부
```

- 평균과 분산을 손으로 계산한 뒤 코드 결과와 비교한다.
- 이탈 사용자의 조건부 비율을 계산한다.
- 이탈 예측의 Feature와 Label을 직접 정한다.
- 미래 정보를 Feature에 포함한 잘못된 예시를 만든다.
- 데이터 한 행이 실제로 어떤 사용자를 의미하는지 설명한다.

### 이전 내용 회수

- 0주차 시스템 지도에서 데이터가 어디에 있었는지 다시 그린다.
- 모델 입력 전에 잘못된 데이터가 들어가면 이후 단계가 어떻게 영향을 받는지 추측한다.

### 미래 연결

- 2주차: Feature와 Label로 모델을 학습하고 평가한다.
- 4주차: Feature가 신경망의 숫자 입력으로 들어간다.
- 12주차: 문서와 Query도 검색을 위해 숫자 표현으로 변환된다.
- 14주차: 평가용 질문과 정답도 하나의 데이터셋이 된다.

### 호기심 분기

필수 범위가 아니다. 하나만 골라 30~60분 관찰한다.

- 게임 로그의 이벤트 스키마는 왜 시간이 지나며 바뀌는가?
- 상관관계가 높지만 원인이 아닐 수 있는 게임 사례 만들기
- 동일한 사용자를 Train과 Test에 함께 넣으면 어떤 문제가 생길까?

### 주간 미니 테스트

- 이탈 예측에서 Sample, Feature, Label을 구분한다.
- 평균만 보고 두 사용자 집단이 같다고 판단할 수 없는 사례를 만든다.
- 미래 정보를 Feature로 사용했을 때 왜 결과를 믿을 수 없는지 설명한다.

## 2주차. Baseline과 모델 평가

### 학습 목표

- Train, Validation, Test의 역할을 구분한다.
- 단순 Baseline과 학습 모델을 같은 조건에서 비교한다.
- Confusion Matrix에서 Accuracy, Precision, Recall, F1을 계산한다.
- 오류 비용에 따라 평가 지표가 달라진다는 것을 이해한다.

### 이론 범위

```text
Supervised Learning
Train / Validation / Test
Baseline
Confusion Matrix
Accuracy / Precision / Recall / F1
Threshold
False Positive / False Negative
```

### 미니 실습

- 항상 다수 클래스를 예측하는 Baseline을 만든다.
- Logistic Regression이나 작은 Decision Tree로 이탈을 예측한다.
- 작은 Confusion Matrix를 손으로 만들고 지표를 계산한다.
- Threshold를 바꿔 Precision과 Recall 변화를 기록한다.
- 잘못 예측한 사용자 사례를 직접 확인한다.

### 이전 내용 회수

- 1주차에 정의한 Label이 실제 업무 판단과 일치하는지 다시 확인한다.
- 평균과 분포가 다른 데이터에서 모델 결과가 어떻게 달라질지 예상한다.

### 미래 연결

- 6주차: LLM 출력도 하나의 점수로만 평가하기 어렵다.
- 8주차: Tool 선택과 인자 정확성을 별도로 측정한다.
- 12주차: 검색에서 Precision과 Recall을 다시 사용한다.
- 14주차: 단순 LLM을 Baseline으로 삼아 RAG나 Agent와 비교한다.

### 호기심 분기

- ROC Curve를 그려보기
- 클래스 불균형이 심한 데이터에서 Accuracy 관찰
- 이탈 방지와 부정행위 탐지에서 오류 비용 비교

### 주간 미니 테스트

- Accuracy가 95%여도 쓸모없는 모델 사례를 설명한다.
- 이탈 후보를 넓게 찾고 싶을 때 어떤 지표를 우선할지 말한다.
- Test Set을 반복해서 보며 모델을 수정하면 왜 문제가 되는지 설명한다.

## 3주차. 일반화와 잘못된 실험

### 학습 목표

- Overfitting, Underfitting, Data Leakage를 구분한다.
- 재현 가능한 실험에 필요한 기록을 안다.
- 높은 점수보다 실패 사례와 일반화 가능성을 먼저 확인한다.
- 불확실한 결과를 과도하게 해석하지 않는다.

### 이론 범위

```text
Generalization
Overfitting / Underfitting
Data Leakage
Class Imbalance
Cross Validation의 목적
Random Seed와 재현성
데이터 편향
```

### 미니 실습

- 미래 정보를 넣어 비정상적으로 높은 점수를 만든다.
- 누수 Feature를 제거한 뒤 점수 변화를 비교한다.
- 학습 데이터 크기를 바꿔 Train과 Validation 성능 차이를 관찰한다.
- 같은 설정과 Seed로 실험이 재현되는지 확인한다.
- 오류 사례를 데이터 문제, Feature 문제, 모델 한계로 분류한다.

### 이전 내용 회수

- Baseline과 학습 모델을 동일한 Test Set에서 다시 비교한다.
- Precision과 Recall을 업무상 오류 비용과 연결한다.

### 미래 연결

- 4주차: 큰 신경망도 학습 데이터를 외울 수 있다.
- 6주차: LLM의 유창함이 일반화나 사실성을 증명하지 않는다.
- 13주차: Retrieval 평가용 질문이 실제 사용 질의를 대표해야 한다.
- 14주차: LLM Eval에서도 평가 데이터 오염과 과적합을 조심해야 한다.

### 호기심 분기

- 시간 순서가 있는 데이터의 분할 방식 관찰
- 추천 시스템의 Offline 지표와 실제 사용자 반응 차이 조사
- 데이터 편향이 게임 사용자 집단에 미치는 영향 사례 찾기

## 파트 1 종료 테스트

### 수행 과제

새로운 작은 게임 데이터와 모델 결과를 받고 다음을 수행한다.

1. Feature, Label, 데이터 생성 과정을 설명한다.
2. Baseline을 정한다.
3. 적절한 평가 지표와 오류 비용을 설명한다.
4. Data Leakage 가능성을 찾는다.
5. 점수가 높아도 추가로 확인할 항목을 제시한다.

### 파트 산출물

- 데이터 기반 판단 설명서
- 정상 실험과 누수 실험 비교
- 실패 사례 분류표
- 재현 가능한 실행 절차
- `AI 시스템 지도 v2: 데이터와 평가` 갱신

# 파트 2. 딥러닝·LLM 작동 원리

## 기간과 중심 질문

- 기간: 4~6주, 45시간
- 중심 질문: LLM은 입력을 어떻게 처리하고 왜 실패하는가?

수학적 증명이나 Transformer 전체 구현이 목표는 아니다. 입력이 숫자로 변환되고, 가중치와 계산을 거쳐 출력 확률이 만들어지는 흐름을 설명할 수 있어야 한다.

## 4주차. 신경망이 학습하는 과정

### 학습 목표

- Vector, Matrix, Tensor의 역할을 구분한다.
- Weight, Bias, Activation, Loss의 관계를 설명한다.
- Forward, Backward, Optimizer의 순서를 이해한다.
- 학습과 추론에서 모델 상태가 어떻게 다른지 설명한다.

### 이론 범위

```text
Vector / Matrix / Tensor
Linear Transformation
Weight / Bias
Activation Function
Forward Pass
Loss Function
Gradient
Backpropagation의 직관
Optimizer
```

### 미니 실습

- 단일 뉴런의 출력을 손으로 계산한다.
- 작은 선형 계층에서 입력과 출력 Shape를 추적한다.
- Loss 계산 전후의 값을 기록한다.
- Optimizer Step 전후의 Weight를 비교한다.
- 작은 데이터에 간단한 신경망을 의도적으로 과적합시킨다.

### 이전 내용 회수

- Train과 Validation 성능이 벌어지는 이유를 3주차 개념으로 설명한다.
- Feature가 Tensor 입력으로 변환되는 과정을 그린다.

### 미래 연결

- 5주차: 단어와 문장도 Vector로 표현한다.
- 6주차: Transformer도 Weight를 학습하는 신경망이다.
- 12주차: 문서 Embedding을 검색에 사용한다.
- 14주차: 모델 출력뿐 아니라 전체 시스템을 평가한다.

### 호기심 분기

- Learning Rate를 크게 바꿨을 때 Loss 관찰
- Activation Function 두 가지 출력 비교
- Batch 크기에 따라 학습 과정이 어떻게 달라지는지 관찰

### 주간 미니 테스트

- Weight, Loss, Gradient를 서로 연결해 설명한다.
- Inference 중 Weight가 바뀌지 않는 이유를 말한다.
- Train Loss만 낮아질 때 무엇을 의심해야 하는지 답한다.

## 5주차. Embedding과 Attention

### 학습 목표

- One-hot 표현과 Embedding의 차이를 안다.
- Dot Product와 Cosine Similarity를 작은 Vector로 계산한다.
- 의미 유사도가 사실적 정답을 보장하지 않는 이유를 설명한다.
- Query, Key, Value와 Attention Score의 직관을 잡는다.

### 이론 범위

```text
One-hot Encoding
Embedding
Dot Product
Cosine Similarity
Query / Key / Value
Attention Score
Self-Attention의 직관
```

### 미니 실습

- 2~3차원 Vector의 Dot Product와 Cosine Similarity를 손으로 계산한다.
- 게임 문서 문장 몇 개를 Embedding해 가까운 문장을 찾는다.
- 같은 단어가 많은 문장과 의미가 가까운 문장의 검색 결과를 비교한다.
- 작은 Query, Key, Value 행렬로 Attention Score를 계산한다.
- Query를 바꿨을 때 참고하는 정보가 어떻게 달라지는지 관찰한다.

### 이전 내용 회수

- Embedding Vector도 신경망의 Weight가 될 수 있음을 4주차와 연결한다.
- Similarity Threshold를 2주차의 분류 Threshold와 비교한다.

### 미래 연결

- 6주차: Token Embedding이 Transformer 입력으로 들어간다.
- 12주차: 문서와 Query Embedding으로 Vector Search를 수행한다.
- 13주차: 유사도만으로 부족해 Reranking을 추가한다.
- 14주차: 검색 결과의 관련성을 별도로 평가한다.

### 호기심 분기

- 같은 단어의 문맥별 Embedding 차이 관찰
- Euclidean Distance와 Cosine Similarity 비교
- 다국어 문장의 유사도 검색 결과 관찰

### 주간 미니 테스트

- Embedding이 답변이 아니라 숫자 표현이라는 점을 설명한다.
- Similarity가 높은 문장이 정답이 아닐 수 있는 사례를 든다.
- Attention과 외부 문서 검색이 같은 기능이 아닌 이유를 말한다.

## 6주차. Transformer와 LLM 출력

### 학습 목표

- Text가 Token으로 나뉘고 다음 Token 확률로 이어지는 흐름을 설명한다.
- Context Window, Sampling, Temperature의 역할을 이해한다.
- LLM의 유창함과 사실성을 구분한다.
- Hallucination이 애플리케이션 계층에서 통제해야 할 문제임을 안다.

### 이론 범위

```text
Token / Tokenizer
Token Embedding
Positional Information
Transformer Block의 큰 흐름
Next-token Prediction
Context Window
Sampling / Temperature
Training / Inference
Hallucination
```

### 미니 실습

- 같은 문장을 Tokenizer로 나누고 예상과 다른 분할을 찾는다.
- 입력 길이에 따른 Token 수 변화를 측정한다.
- 같은 질문을 반복해 출력 변화를 비교한다.
- Temperature를 바꾸고 일관성과 다양성을 기록한다.
- 관련 문서, 관련 없는 문서, 충돌 문서를 Context에 넣어 답변을 비교한다.
- 근거가 없어도 자연스럽게 답하는 실패 사례를 수집한다.

### 이전 내용 회수

- LLM 학습의 Train과 Validation을 파트 1의 개념으로 설명한다.
- Token Embedding과 5주차 문장 Embedding의 역할 차이를 정리한다.
- 확률 분포와 Sampling을 1주차 확률 개념에 연결한다.

### 미래 연결

- 7주차: 확률적인 텍스트 출력을 애플리케이션이 검증한다.
- 9주차: LLM 응답을 반복 호출하는 Agent Loop를 만든다.
- 12주차: 외부 문서를 검색해 Context에 넣는다.
- 14주차: 동일 질문의 출력 변화를 고려해 평가 방식을 설계한다.
- 15주차: 신뢰할 수 없는 Context가 Prompt Injection 경로가 될 수 있다.

### 호기심 분기

- System Instruction과 User Input 충돌 관찰
- 긴 Context의 앞·중간·뒤 정보 회수 차이 확인
- 서로 다른 모델의 Tokenizer 결과 비교

## 파트 2 종료 테스트

### 수행 과제

다음 흐름을 자료 없이 그리고 각 단계의 역할을 설명한다.

```text
Text
→ Token
→ Embedding
→ Transformer
→ 다음 Token 확률 분포
→ Sampling
→ Output
```

추가 질문:

- 학습과 추론은 무엇이 다른가?
- Temperature는 모델 지식을 바꾸는가?
- Context와 Memory는 같은가?
- LLM이 사실이 아닌 내용을 자연스럽게 말할 수 있는 이유는 무엇인가?
- Embedding과 Retrieval은 어떻게 연결되는가?

### 파트 산출물

- 신경망 학습 흐름 설명
- Embedding·Attention 마이크로 실험
- LLM 조건별 출력 비교
- 실패 사례와 원인 가설
- `AI 시스템 지도 v3: 모델과 LLM` 갱신

# 파트 3. LLM Application 제어 흐름

## 기간과 중심 질문

- 기간: 7~9주, 45시간
- 중심 질문: 모델 출력을 어떻게 안전한 소프트웨어 동작으로 바꾸는가?

프레임워크 없이 Model Client, Structured Output 검증, Tool Calling, Agent Loop의 최소 구조를 구현한다. 웹 UI, 영속 저장소, 다중 사용자 기능은 포함하지 않는다.

## 7주차. Model Client와 Structured Output

### 학습 목표

- 요청, Streaming Event, 최종 응답을 구분한다.
- Provider SDK와 애플리케이션 코드의 경계를 정한다.
- Structured Output을 Schema로 검증한다.
- 형식 검증과 사실 검증이 다른 문제임을 이해한다.

### 이론 범위

```text
Request / Response
Streaming / Event
Async Iterator
Structured Output
JSON Schema 또는 Pydantic Validation
Timeout / Rate Limit
Token Usage / Latency
```

### 미니 실습

- 일반 응답과 Streaming 응답을 각각 호출한다.
- Event 순서를 로그로 남긴다.
- 게임 지표 분석 결과의 출력 Schema를 정의한다.
- 필드 누락, 잘못된 타입, 허용되지 않은 값을 거부한다.
- 요청 ID, Token 사용량, Latency를 기록한다.
- Timeout과 잘못된 응답을 애플리케이션 오류로 변환한다.

### 이전 내용 회수

- 6주차의 확률적 출력을 왜 검증해야 하는지 설명한다.
- ML Validation과 Schema Validation의 차이를 정리한다.

### 미래 연결

- 8주차: 검증된 구조를 Tool 인자로 사용한다.
- 9주차: 여러 Model Request와 Tool Result를 Loop로 연결한다.
- 10주차: Streaming Event를 실행 상태와 연결한다.
- 14주차: Schema 준수율과 응답 품질을 따로 측정한다.

### 호기심 분기

- Streaming 중 사용자가 취소하면 어떤 일이 생기는지 관찰
- 같은 Schema를 두 모델에 적용해 차이 비교
- Retry 전후 요청 ID와 비용 변화 확인

### 주간 미니 테스트

- JSON이 유효하면 내용도 정확한지 답한다.
- Streaming Event와 최종 State가 다른 이유를 설명한다.
- Timeout과 Retry를 어느 계층에서 처리할지 제안한다.

## 8주차. Tool Calling과 실행 경계

### 학습 목표

- Tool Schema, Tool Call, Tool Result를 구분한다.
- LLM과 실제 Tool 실행 주체를 분리한다.
- 실행 전에 이름, 인자, 권한을 검증한다.
- Tool 오류를 모델에 전달할 안전한 형식으로 바꾼다.

### 이론 범위

```text
Function / Tool Schema
Tool Selection
Argument Validation
Tool Registry / Router
Execution Boundary
Authorization
Tool Result / Error Mapping
```

### 미니 실습

다음 read-only Tool 중 두 개만 구현한다.

```text
query_game_metrics
search_incident
read_operation_document
calculate
```

- Tool 이름과 입력 Schema를 등록한다.
- 존재하지 않는 Tool을 거부한다.
- 기간, 파일 경로, Query 범위를 제한한다.
- Tool Timeout과 내부 오류를 구조화된 결과로 반환한다.
- Tool Call과 Tool Result를 별도 로그로 남긴다.

### 이전 내용 회수

- Structured Output 검증을 Tool 인자 검증에 적용한다.
- LLM이 잘못된 Tool 이름을 만들 수 있는 이유를 6주차 개념으로 설명한다.
- False Positive와 False Negative 관점에서 Tool 선택 오류를 생각한다.

### 미래 연결

- 9주차: Tool Result가 다음 모델 입력으로 들어간다.
- 11주차: Retry로 같은 Tool이 중복 실행될 수 있다.
- 13주차: Retrieval을 Tool로 제공하는 Agentic Retrieval을 관찰한다.
- 15주차: Tool 권한과 Prompt Injection을 함께 다룬다.

### 호기심 분기

- Read-only Tool과 변경 Tool의 승인 정책 비교
- Tool Description 변경에 따른 선택 결과 관찰
- 동일 기능을 가진 Tool이 여러 개일 때 모델 선택 비교

### 주간 미니 테스트

- LLM이 Tool을 직접 실행하지 않는 이유를 흐름으로 그린다.
- Schema가 유효하지만 실행하면 안 되는 인자 사례를 만든다.
- Tool 실패를 사용자 메시지와 모델 입력에 각각 어떻게 표현할지 정한다.

## 9주차. Agent Loop와 종료 조건

### 학습 목표

- Model 응답, Tool 실행, Tool Result를 Loop로 연결한다.
- 종료, 실패, 취소, 예산 초과를 서로 다른 상태로 구분한다.
- 무한 반복과 진행 없는 실행을 탐지한다.
- 중간 실행 과정과 최종 답변을 분리한다.

### 이론 범위

```text
Agent Loop
Turn
Tool Call Cycle
Termination Condition
Max Turns / Max Tool Calls
Progress Detection
Final Answer
```

### 미니 실습

- 하나의 Model Client와 두 개의 Tool로 최소 Agent Loop를 구현한다.
- Tool Result를 다음 Model Request에 연결한다.
- 최대 Turn, Tool Call 수, 실행 시간을 제한한다.
- 같은 Tool과 인자를 반복하는 상황을 탐지한다.
- 정상 완료, Tool 실패, 예산 초과를 다른 결과로 반환한다.
- 전체 실행을 Sequence Diagram으로 그린다.

### 이전 내용 회수

- LLM 출력의 확률성이 Loop 경로에 어떤 영향을 주는지 설명한다.
- Tool 인자 검증이 매 Loop마다 필요한 이유를 말한다.
- Overfitting과 Agent의 반복 실패는 서로 다른 문제임을 구분한다.

### 미래 연결

- 10주차: Turn과 Event를 상태로 저장한다.
- 11주차: Timeout, Cancellation, Idempotency를 실행 정책에 넣는다.
- 13주차: LLM이 검색 여부를 판단하는 Agentic Retrieval을 비교한다.
- 14주차: 완료율, Tool 성공률, 반복 횟수를 평가한다.

### 호기심 분기

- Tool 순서를 강제한 Workflow와 자유 Agent Loop 비교
- 같은 질문을 여러 번 실행해 Tool 경로 변화 관찰
- 한 번의 모델 호출로 끝내는 경우와 Loop 비용 비교

## 파트 3 종료 테스트

### 수행 과제

새로운 read-only Tool 하나를 추가하고 다음을 검증한다.

1. Schema와 실제 함수 입력이 일치한다.
2. 잘못된 이름과 인자를 거부한다.
3. Tool 실패가 전체 프로세스를 비정상 종료하지 않는다.
4. Loop가 지정한 예산 안에서 종료된다.
5. 실행 로그로 Model과 Tool의 상호작용을 재구성할 수 있다.

### 파트 산출물

- Model Client 미니 구현
- Structured Output 실패 실험
- Tool Calling과 Agent Loop
- 종료·반복 실패 분석
- `AI 시스템 지도 v4: 애플리케이션 제어 흐름` 갱신

# 파트 4. Agent Runtime과 실패 제어

## 기간과 중심 질문

- 기간: 10~11주, 30시간
- 중심 질문: Agent 실행을 어떻게 상태화하고 중단·실패·반복을 통제하는가?

분산 Workflow 엔진이나 완전한 Durable Execution은 만들지 않는다. 한 프로세스 안에서 상태, Event, 예산, 취소, 중복 실행을 관찰하고 제어하는 데 집중한다.

## 10주차. State, Thread, Turn, Event

### 학습 목표

- Conversation State와 Execution State를 구분한다.
- Thread, Turn, Message, Item, Event의 관계를 설명한다.
- Event Stream과 최종 State가 맡는 역할을 구분한다.
- Context에 포함할 정보와 저장만 할 정보를 나눈다.

### 이론 범위

```text
Thread / Turn
Message / Item
Conversation State
Execution State
Event / Event Stream
Persistence의 목적
Context Selection
Compaction의 개념
```

### 미니 실습

- 두 Turn으로 이어지는 대화를 상태로 표현한다.
- Turn 시작, Model 시작, Tool 시작·완료, Turn 완료 Event를 기록한다.
- Event를 재생해 최종 실행 상태를 복원한다.
- 전체 저장 기록과 다음 Model Context에 넣을 정보를 구분한다.
- 큰 Tool Result를 잘라내되 원본 참조를 보존한다.

### 이전 내용 회수

- 9주차 Agent Loop의 한 회전을 Turn과 Event로 표현한다.
- Streaming Text Event와 Tool Event의 차이를 설명한다.
- Context Window와 저장 공간이 같은 개념이 아닌 이유를 말한다.

### 미래 연결

- 11주차: 실행 상태를 기준으로 취소와 재시도를 처리한다.
- 14주차: Event Log가 평가와 Trace 데이터가 된다.
- 16주차: 장애 발생 시 실행 경로를 재구성한다.

### 호기심 분기

- Event Sourcing과 일반 상태 저장의 차이 읽어보기
- Codex의 Thread, Turn, Item 개념과 자신의 구조 비교
- 오래된 대화를 요약할 때 잃을 수 있는 정보 생각하기

### 주간 미니 테스트

- Thread와 Turn의 차이를 예시로 설명한다.
- Event와 State 중 하나만 저장할 때 생기는 문제를 비교한다.
- 대화 기록 전체를 항상 Context에 넣으면 안 되는 이유를 말한다.

## 11주차. Budget, Timeout, Cancellation, Idempotency

### 학습 목표

- 시간, Turn, Tool Call, Token, 비용 예산을 구분한다.
- Timeout과 Cancellation을 실행 계층에 전파한다.
- Retry가 중복 실행을 만들 수 있음을 이해한다.
- Idempotency와 재시도 가능성을 함께 판단한다.

### 이론 범위

```text
Execution Budget
Deadline / Timeout
Cancellation Propagation
Retry Policy
Idempotency
Partial Failure
Resume / Restart의 차이
```

### 미니 실습

- 느린 Tool에 Timeout을 적용한다.
- 사용자 취소 신호를 Model과 Tool 실행에 전달한다.
- Retry로 같은 Tool이 두 번 실행되는 사례를 재현한다.
- Idempotency Key로 중복 처리를 방지한다.
- 중단된 Turn을 완료, 실패, 취소, 미확정 상태로 분류한다.
- 예산 초과 시 추가 Model 호출을 막는다.

### 이전 내용 회수

- Event Log로 Timeout 전후 실행 상태를 추적한다.
- Agent Loop 종료 조건과 Runtime Budget의 차이를 설명한다.
- Tool의 Read-only 여부가 Retry 정책에 미치는 영향을 정리한다.

### 미래 연결

- 13주차: 반복 검색이 시간과 Token 예산을 소비한다.
- 14주차: 완료율, 평균 Tool 호출 수, 취소율을 평가한다.
- 15주차: 권한 검사와 승인이 실행 경로를 중단할 수 있다.
- 16주차: Retry와 Fallback의 비용·장애 영향을 분석한다.

### 호기심 분기

- At-least-once와 At-most-once 실행 의미 비교
- 외부 결제 Tool이 있다면 Retry 정책이 어떻게 달라지는지 생각하기
- 프로세스 재시작 후 상태 복원에 필요한 최소 정보 정리

## 파트 4 종료 테스트

### 수행 과제

다음 실패를 자동 테스트나 재현 절차로 확인한다.

- Model Timeout
- Tool Timeout
- 사용자 취소
- 동일 Tool 중복 실행
- 실행 예산 초과
- 중단된 Turn 재확인

각 실패에서 최종 상태, 기록할 Event, 사용자에게 보여줄 결과를 설명한다.

### 파트 산출물

- Runtime State 모델
- Event 재생 실험
- Timeout·Cancellation 전파 실험
- Retry·Idempotency 실패 분석
- `AI 시스템 지도 v5: 상태와 실패 제어` 갱신

# 파트 5. Retrieval과 근거 기반 응답

## 기간과 중심 질문

- 기간: 12~13주, 30시간
- 중심 질문: 필요한 정보를 찾고 답변 근거를 어떻게 검증하는가?

특정 Vector DB 사용법보다 문서 준비, 검색, 순위화, 인용, 답변 보류의 관계를 배운다. 검색 품질과 답변 품질은 따로 측정한다.

## 12주차. 문서 준비와 검색

### 학습 목표

- 문서 정규화, Chunking, Metadata가 검색 결과에 미치는 영향을 이해한다.
- Keyword Search와 Vector Search를 비교한다.
- 검색 평가에서 Precision과 Recall을 다시 사용한다.
- 정답 문서가 검색되지 않은 실패를 식별한다.

### 이론 범위

```text
Document Normalization
Chunk / Chunking
Metadata / Filter
Inverted Index와 Keyword Search의 직관
Embedding / Vector Search
Top-k
Retrieval Precision / Recall
```

### 미니 실습

- 게임 패치 노트와 장애 문서 10~20개를 준비한다.
- 고정 길이와 문단 단위 Chunking을 비교한다.
- Keyword Search와 Vector Search를 같은 질문으로 실행한다.
- 정답 문서가 Top-k에 포함됐는지 기록한다.
- Metadata Filter 적용 전후 결과를 비교한다.
- 검색 실패를 Query, Chunk, Index, Filter 문제로 분류한다.

### 이전 내용 회수

- 5주차 Embedding과 Cosine Similarity를 다시 설명한다.
- 2주차 Precision과 Recall을 검색 문제에 적용한다.
- Context Window가 Chunk 수와 크기를 제한하는 방식을 생각한다.

### 미래 연결

- 13주차: 두 검색 방식을 합치고 Reranking한다.
- 14주차: Retrieval 지표와 Answer 지표를 별도로 구성한다.
- 15주차: 악성 지시문이 들어 있는 문서가 검색될 수 있다.
- 16주차: Index 구축 비용과 검색 Latency를 관찰한다.

### 호기심 분기

- 한국어 형태소 분석이 Keyword Search에 미치는 영향 관찰
- Chunk Overlap 적용 전후 비교
- Embedding 모델이 바뀌면 기존 Index를 어떻게 할지 조사

### 주간 미니 테스트

- 정답 문서가 없는 것과 순위가 낮은 것을 구분한다.
- Chunk를 너무 작거나 크게 만들 때의 문제를 설명한다.
- Vector Search가 Keyword Search를 항상 이기지 않는 이유를 말한다.

## 13주차. Hybrid Retrieval, Reranking, Citation

### 학습 목표

- Keyword와 Vector 결과를 결합하는 이유를 설명한다.
- Retrieval과 Reranking의 책임을 구분한다.
- 문서 ID와 구간 정보를 최종 인용까지 보존한다.
- 근거가 부족하거나 충돌하면 답변을 보류한다.
- Static RAG와 Agentic Retrieval을 개념적으로 비교한다.

### 이론 범위

```text
Hybrid Search
Score Fusion의 직관
Reranking
Context Construction
Citation
Grounded Answer
Abstention
Static RAG / Agentic Retrieval
```

### 미니 실습

- Keyword와 Vector 검색 결과를 단순 규칙으로 결합한다.
- Reranking 전후 Top-k를 비교한다.
- 답변의 각 주요 주장에 문서 ID와 근거 구간을 연결한다.
- 인용은 있지만 본문이 주장을 뒷받침하지 않는 사례를 만든다.
- 충돌하는 문서가 있을 때 불확실성을 표시한다.
- Static RAG와 검색 Tool을 쓰는 Agent 흐름을 같은 질문으로 비교한다.

### 이전 내용 회수

- Tool Calling 흐름으로 검색 Tool 실행을 표현한다.
- Agent Budget 관점에서 반복 검색의 비용을 계산한다.
- Data Leakage와 Retrieval 평가 데이터 오염의 공통점을 생각한다.

### 미래 연결

- 14주차: 검색, 인용, 답변의 평가 항목을 분리한다.
- 15주차: 검색 문서를 신뢰하지 않고 권한과 출처를 검사한다.
- 16주차: 검색 Latency, Context Token, 답변 비용을 함께 분석한다.

### 호기심 분기

- Reranker 없이 규칙 기반 재정렬 시도
- Query Rewriting이 원래 의도를 바꾸는 실패 관찰
- GraphRAG는 어떤 문제에서 필요한지 개념만 조사

## 파트 5 종료 테스트

### 수행 과제

새로운 질문 10개로 다음을 비교한다.

```text
Keyword Search
Vector Search
Hybrid Search
Hybrid Search + Reranking
```

각 방식에서 다음을 기록한다.

- 정답 문서의 검색 여부와 순위
- 잘못 검색된 문서 유형
- 최종 답변의 근거 일치 여부
- 답변을 보류해야 했던 사례
- Latency와 Context 크기의 변화

### 파트 산출물

- 문서 준비와 Chunking 비교
- 네 가지 검색 방식 비교
- 인용과 답변 보류 실험
- 검색 실패와 생성 실패 분류
- `AI 시스템 지도 v6: Retrieval과 근거` 갱신

# 파트 6. 평가·안전·운영 판단

## 기간과 중심 질문

- 기간: 14~16주, 45시간
- 중심 질문: AI 시스템의 품질·위험·비용을 어떻게 측정하고 통제하는가?

새로운 대형 시스템을 만들지 않는다. 앞에서 만든 독립 실험과 기록을 하나의 평가 관점으로 다시 본다. 관측성 플랫폼이나 완전한 권한 시스템을 구현하는 대신 실패를 재현하고 적절한 통제 수단을 선택한다.

## 14주차. Evaluation 설계

### 학습 목표

- 평가하려는 주장과 평가 대상을 먼저 정의한다.
- 데이터, Retrieval, LLM Answer, Tool, Runtime 지표를 분리한다.
- Golden Set, 자동 점수, 사람 검토의 역할을 구분한다.
- 변경 전후를 같은 조건에서 비교한다.

### 이론 범위

```text
Evaluation Target
Golden Set
Offline Evaluation
Regression Test
Retrieval Metrics
Answer Correctness / Relevance
Citation Correctness
Tool Success / Argument Correctness
Latency / Cost
Human Review와 Model-based Judge의 한계
```

### 미니 실습

- GameOps 질문 20개 이상의 작은 Golden Set을 작성한다.
- 질문마다 기대 근거, 허용 답변, 금지 답변을 기록한다.
- 단순 LLM과 RAG 응답을 같은 질문으로 비교한다.
- Retrieval 실패와 Answer 실패를 따로 점수화한다.
- Tool 선택 성공과 인자 정확성을 분리한다.
- 프롬프트나 검색 설정 변경 전후 회귀 테스트를 수행한다.

### 이전 내용 회수

- Train, Validation, Test와 Golden Set의 공통점과 차이를 설명한다.
- Precision과 Recall을 Retrieval에 다시 적용한다.
- Event Log에서 Agent 완료율과 평균 Tool Call 수를 계산한다.

### 미래 연결

- 15주차: 안전 정책도 테스트 가능한 기대 행동으로 작성한다.
- 16주차: 품질, Latency, 비용 사이의 Trade-off를 판단한다.
- 이후 프로젝트: 기능 개발 전에 Eval Set을 함께 만든다.

### 호기심 분기

- LLM Judge와 사람 평가가 다른 사례 관찰
- 평가 질문이 특정 Prompt에 과적합되는 사례 생각하기
- 같은 평균 점수지만 치명적 실패율이 다른 시스템 비교

### 주간 미니 테스트

- 무엇을 잘한다고 주장하는지 모른 채 Eval을 만들면 생기는 문제를 말한다.
- 검색 결과는 맞지만 답변이 틀린 사례의 지표를 분리한다.
- 평균 점수 외에 반드시 확인할 실패 분포를 제시한다.

## 15주차. 안전, 권한, Prompt Injection

### 학습 목표

- Prompt, Model, Tool 권한을 서로 다른 방어 계층으로 본다.
- 외부 문서와 Tool Result를 신뢰할 수 없는 입력으로 취급한다.
- Read-only와 변경 작업의 승인 정책을 구분한다.
- Prompt Injection 성공 여부를 재현 가능한 테스트로 만든다.

### 이론 범위

```text
Trust Boundary
Prompt Injection
Data Exfiltration
Authentication / Authorization
Least Privilege
Tool Allowlist
Human Approval
Sensitive Data Handling
Audit Log
```

### 미니 실습

- 운영 문서 안에 모델 지시를 덮어쓰려는 문장을 넣는다.
- 악성 문서가 검색됐을 때 Agent 행동을 관찰한다.
- Tool Description만으로 권한을 막을 수 없는 사례를 만든다.
- Read-only 사용자에게 변경 Tool을 노출했을 때 위험을 분석한다.
- 실행 전 애플리케이션 권한 검사로 요청을 차단한다.
- 민감 데이터가 모델 입력과 로그에 남는 경로를 추적한다.

### 이전 내용 회수

- Structured Output이 안전을 보장하지 않는 이유를 다시 설명한다.
- Retrieval 출처와 Metadata를 권한 판단에 연결한다.
- Event Log와 Audit Log의 목적 차이를 구분한다.
- False Positive와 False Negative 관점에서 안전 정책을 평가한다.

### 미래 연결

- 16주차: 차단, 승인, 실패가 Latency와 운영 비용에 미치는 영향을 본다.
- 이후 프로젝트: Tool을 추가할 때 권한과 Eval을 함께 설계한다.

### 호기심 분기

- 권한별 Tool 목록을 다르게 제공하는 방식 관찰
- 사용자 입력과 검색 문서의 지시 우선순위 실험
- 로그에서 민감 정보를 마스킹하는 최소 규칙 작성

### 주간 미니 테스트

- Prompt Injection이 Prompt 문구만으로 해결되지 않는 이유를 설명한다.
- Authentication과 Authorization의 차이를 Tool 사례로 말한다.
- 변경 Tool 실행 전 필요한 검사와 승인 순서를 그린다.

## 16주차. Trace, 비용, 장애와 종합 판단

### 학습 목표

- 한 요청의 Model, Retrieval, Tool, Runtime 구간을 Trace로 재구성한다.
- Latency와 비용을 구성 요소별로 나눠 본다.
- Retry, Fallback, Cache가 품질과 중복 실행에 미치는 영향을 판단한다.
- 새로운 AI 사용 사례의 위험과 평가 계획을 설계한다.

### 이론 범위

```text
Trace / Span의 직관
Structured Logging
Token / Request Cost
End-to-end Latency
Retry / Backoff
Fallback
Cache
Rate Limit
Incident Diagnosis
품질·비용·지연 Trade-off
```

### 미니 실습

- 하나의 요청 Trace에서 Model, Retrieval, Tool 구간 시간을 분리한다.
- 같은 Tool이 Retry로 두 번 실행된 사례를 찾는다.
- Context 크기를 바꿔 Token, Latency, 답변 품질을 비교한다.
- Cache 적용이 안전한 요청과 위험한 요청을 구분한다.
- Model 실패 시 Fallback을 적용했을 때 품질 변화를 기록한다.
- 장애 로그를 받고 조사 순서를 데이터, Retrieval, LLM, Tool, Runtime으로 정한다.

### 이전 내용 회수

- 1~3주의 데이터 신뢰성부터 15주의 권한까지 전체 지도를 다시 그린다.
- 모든 주차의 실패 사례를 계층별로 재분류한다.
- 품질 지표가 좋아도 운영 불가능할 수 있는 사례를 설명한다.

### 미래 연결

16주차 이후 포트폴리오나 심화 과정은 아직 정하지 않는다. 대신 다음 선택에 필요한 근거를 남긴다.

- 사용 사례와 Agent 흐름 설계가 흥미로웠는가?
- 검색과 평가 개선이 흥미로웠는가?
- 모델과 데이터 실험이 흥미로웠는가?
- 성능, 비용, 장애 대응이 흥미로웠는가?

### 호기심 분기

- AI Gateway가 담당하는 역할만 조사
- Model Serving과 외부 API 호출의 운영 차이 비교
- Eval 결과와 Trace를 연결하는 관측 구조 그리기

## 파트 6 종료 테스트

### 종합 케이스 스터디

다음과 같은 새로운 요구를 받았다고 가정한다.

```text
게임 운영자가 자연어로 지표를 조회하고,
관련 장애 문서를 근거로 원인을 분석하며,
필요하면 후속 조치 초안을 만들 수 있게 한다.
```

코드를 통합 구현하지 않고 다음을 작성한다.

1. 데이터, Model, Retrieval, Tool, Runtime, Evaluation의 전체 흐름
2. 각 단계의 입력, 출력, 신뢰 경계
3. 대표 실패와 탐지 방법
4. 최소 Golden Set과 평가 지표
5. 권한과 승인 정책
6. Timeout, Retry, Cancellation 정책
7. 관측할 Trace, 비용, Latency
8. 구현 전에 확인해야 할 불확실성

### 구두 방어

AI에게 면접관 역할을 맡기고 다음 규칙으로 진행한다.

- AI는 한 번에 질문 하나만 한다.
- 학습자가 답하기 전에는 정답이나 힌트를 제공하지 않는다.
- 답변 뒤에는 사실 오류와 빠진 위험만 알려준다.
- 같은 결정에 대해 최소 세 번 `왜`를 묻는다.

### 파트 산출물

- Golden Set과 회귀 평가 실험
- Prompt Injection·권한 실패 분석
- Trace·비용·장애 분석
- 종합 케이스 스터디
- `AI 시스템 지도 v7: 평가·안전·운영` 완성

# 16주 과정 완료 기준

다음 조건을 만족하면 공통 이해 과정을 마친다.

- 전체 AI 시스템 흐름을 자료 없이 그린다.
- 각 구성 요소의 입력, 출력, 상태, 대표 실패를 설명한다.
- 모델 실패와 애플리케이션 실패를 구분한다.
- 검색 실패와 답변 생성 실패를 별도로 평가한다.
- LLM이 만든 Tool Call을 실행 전에 검증해야 하는 이유를 설명한다.
- Timeout, Cancellation, Retry, Idempotency의 관계를 사례로 설명한다.
- Prompt Injection에 Prompt 외의 방어 계층이 필요한 이유를 말한다.
- 품질, 비용, Latency, 권한이 충돌할 때 선택 기준을 제시한다.
- AI가 작성한 작은 구현을 검토하고 조건 하나를 직접 수정한다.
- 새로운 사용 사례에 대한 Eval과 실패 검증 계획을 작성한다.

완료 기준은 모든 세부 기술을 외우는 것이 아니다. 모르는 구현이나 프레임워크를 만나도 어느 계층의 문제인지 판단하고, 어떤 실험과 평가로 확인할지 정할 수 있어야 한다.

# 과정에서 제외하는 내용

1~16주에는 다음을 필수로 다루지 않는다.

- 논문 수준의 수학적 증명
- 대규모 분산 학습과 LLM Pre-training
- Fine-tuning과 LoRA
- Multi-Agent System
- 완전한 Durable Workflow Engine
- GraphRAG와 Knowledge Graph 구축
- GPU Kernel과 Inference 최적화
- Production Cloud 배포
- 화려한 Web UI
- Codex 전체 코드베이스 분석
- 포트폴리오용 통합 프로젝트

이 항목은 질문 백로그에 기록할 수 있다. 현재 파트의 필수 학습을 마치기 전에는 범위를 넓히지 않는다.

# 질문 백로그와 시스템 지도 관리

## 질문 백로그

```text
질문:
현재 추측:
관련 계층:
다시 확인할 주차:
검증할 실험:
확인 결과:
```

해결되지 않은 질문을 실패로 보지 않는다. 질문이 어느 계층에 속하고 무엇으로 검증할지 알게 됐다면 학습이 진전된 것이다.

## 시스템 지도 버전

| 시점 | 갱신 내용 |
|---|---|
| 0주차 | 전체 흐름과 대표 실패 |
| 3주차 | 데이터, 모델 평가, 일반화 |
| 6주차 | 신경망, Embedding, LLM 출력 |
| 9주차 | Model Client, Tool, Agent Loop |
| 11주차 | State, Event, Budget, Cancellation |
| 13주차 | Retrieval, Reranking, Citation |
| 16주차 | Eval, 안전, Trace, 비용, 장애 |

코드는 파트별로 독립되어도 시스템 지도와 질문 백로그는 16주 동안 같은 문서를 갱신한다. 이것이 독립 미니 과제를 하나의 학습 과정으로 묶는 연결 장치다.
