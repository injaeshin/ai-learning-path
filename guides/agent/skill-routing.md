# 명시적 스킬 라우팅

사용자의 목적을 확인한 뒤 아래 기본 스킬 하나만 안내한다. 스킬은 사용자가 `$skill-name`으로 호출해야 실행한다. 보조 스킬이 유용해도 자동 호출하지 않는다.

| 사용자 목적 | 기본 스킬 | 호출하지 않는 경우 |
|---|---|---|
| 오늘 가능한 시간에 맞춰 범위 선택 | `$learning-session-planner` | AI가 범위를 확정하지 않고 호출 예시만 안내 |
| 새 주제 시작 또는 중단 세션 재개 | `$learning-session-planner` | 현재 위치와 재개점만 읽어서 알려줌 |
| 설명을 보기 전 기억 확인 | `$retrieve-first-gate` | 바로 시험을 시작하지 않음 |
| 자신의 개념 설명 점검 | `$explain-first-interrogator` | 일반 답변을 학습 평가로 취급하지 않음 |
| 어디서 왜 막혔는지 진단 | `$diagnose-learning-error` | 시도 내용을 먼저 요청하고 진단은 보류 |
| 필요한 만큼만 도움 요청 | `$progressive-hint-ladder` | 힌트를 임의 제공하지 않음 |
| 설계부터 직접 코드 구현 | `$guided-code-practice` | 완성 코드를 대신 작성하지 않음 |
| 작성한 코드의 문제 검토 | `$learning-code-review` | 자동 수정하지 않고 호출 안내 |
| 배운 내용을 가르치듯 설명하고 평가 | `$teach-back-evaluator` | 일반 대화를 완료 증거로 기록하지 않음 |
| 다른 상황에 같은 원리 적용 | `$transfer-bridge` | 확장 문제를 자동 생성하지 않음 |
| 힌트 없는 독립 수행 평가 | `$unassisted-checkpoint` | 무지원 평가 상태를 만들지 않음 |
| 한 주의 이해와 AI 의존도 회고 | `$weekly-learning-review` | 시간 합계만으로 주간 완료 판정하지 않음 |
| AI 설명이나 자료의 핵심 주장 검증 | `$ai-claim-checker` | 검증하지 않은 내용을 확정 사실로 표현하지 않음 |
| 승인한 내용을 파일에 반영 | `$learning-record-manager` | 파일을 수정하지 않음 |

## 자주 혼동하는 선택

### 설명을 배우고 싶은 경우

- 먼저 자신이 아는 것을 꺼내려면 `$retrieve-first-gate`
- 이미 작성한 설명의 논리적 공백을 찾으려면 `$explain-first-interrogator`
- 한 주제 전체를 가르치듯 설명하고 평가받으려면 `$teach-back-evaluator`
- 설명 속 사실과 출처를 확인하려면 `$ai-claim-checker`

### 문제를 풀거나 코드를 작성하는 경우

- 원인을 모르는 막힘은 `$diagnose-learning-error`
- 원인은 알지만 다음 단서가 필요하면 `$progressive-hint-ladder`
- 코드의 설계와 직접 구현 흐름은 `$guided-code-practice`
- 완성한 코드의 문제만 확인하려면 `$learning-code-review`
- 도움 없이 수행할 수 있는지 확인하려면 `$unassisted-checkpoint`

## 스킬 종료 후

한 스킬의 결과에서 다른 활동이 필요해지면 다음 형식으로 안내한다.

```text
현재 활동에서 확인한 것
다음 활동이 필요한 이유
추천 스킬과 호출 예시
지금 진행할지에 대한 사용자 선택
```

추천만 하고 자동으로 다음 스킬을 실행하지 않는다.
