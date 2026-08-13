# AI Learning Agent Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 명시적으로 호출되는 학습 스킬, AI·사용자 가이드, 0~16주 커리큘럼, 승인 기반 진행 기록을 갖춘 저장소 구조를 구현한다.

**Architecture:** 루트 `AGENTS.md`는 강제 규칙과 문서 라우팅만 제공하고, 상세 정책은 `guides/agent`에 둔다. 저장소 전용 스킬은 `.agents/skills`에 단일 책임으로 등록하며 모두 암묵 호출을 비활성화한다. 사용자는 `guides/user`와 `curriculum`을 보고 필요한 스킬을 직접 선택하고, 공식 기록은 명시적 승인 후에만 갱신한다.

**Tech Stack:** Markdown, Codex Agent Skills (`SKILL.md`, `agents/openai.yaml`), PowerShell 정적 검증, Mermaid

**실행 상태:** 2026-08-13 구현과 네 관점 교차 검토, 검토 반영 및 최종 검증을 완료했다. 아래 체크박스는 당시 실행 순서를 보존한 계획 원문이며 진행 상태 기록으로 사용하지 않는다.

## Global Constraints

- 기준 과정은 `0주차 10시간`과 `1~16주 공통 이해 과정 240시간`이다.
- 기존 20주 누적 프로젝트 문서는 참고 자료로 보관한다.
- 모든 저장소 스킬은 `policy.allow_implicit_invocation: false`를 사용한다.
- AI는 사용자의 승인 없이 진행 상태나 학습 기록을 변경하지 않는다.
- 사용자가 학습 범위, 진도와 완료 여부를 최종 결정한다.
- 핵심 이론은 검증 가능한 출처를 사용하고 사실과 AI의 해석을 구분한다.
- 외부 스킬의 출처, 라이선스와 수정 사실을 보존한다.
- 기존 `outputs` 파일은 삭제하거나 덮어쓰지 않는다.
- 계획 작성 당시에는 Git 저장소가 아니었다. 사용자가 이후 직접 저장소를 초기화했으며, 이 구현에서는 최초 커밋을 만들지 않는다.

---

## File Map

### 저장소 진입과 정책

- `AGENTS.md`: 자동으로 읽는 최소 강제 규칙과 가이드 라우팅
- `guides/agent/operating-policy.md`: 역할, 절대 금지, 조건부 허용
- `guides/agent/session-state.md`: 장기 위치, 현재 요청 모드, 이해 증거 수준
- `guides/agent/skill-routing.md`: 사용자 목적에서 명시적 스킬로의 매핑
- `guides/agent/scope-and-source-policy.md`: 필수·연결·선택·백로그와 출처 기준
- `guides/agent/evaluation-and-record-policy.md`: 준비도 평가, 기록 승인과 파일 변경 절차

### 사용자 문서

- `guides/user/start-here.md`: 첫 진입과 기본 원칙
- `guides/user/daily-session-guide.md`: 범위 선택, 중단, 재개, 종료
- `guides/user/skill-invocation-guide.md`: 상태별 실제 호출 문장
- `guides/user/review-guide.md`: 회상, teach-back, 전이, 무지원 평가
- `guides/user/record-guide.md`: 공식 진행 기록과 개인 노트의 차이

### 커리큘럼과 기록

- `curriculum/overview.md`: 기준 과정과 문서 선택 안내
- `curriculum/week-00.md`: 기존 0주차 기준 문서의 보존본
- `curriculum/weeks-01-16.md`: 기존 1~16주 기준 문서의 보존본
- `curriculum/archive/ai-career-transition-curriculum-20-weeks.md`: 기존 20주 문서의 참고 보존본
- `progress/current-state.md`: 승인된 현재 위치와 재개점
- `progress/question-backlog.md`: 승인된 보류 질문
- `progress/misconception-log.md`: 확인된 오개념과 재검증 상태
- `progress/checkpoints/index.md`: 완료 준비도 평가 목록
- `learning-notes/README.md`: 사용자가 만드는 일별 복습 폴더 안내

### 스킬

각 스킬은 `.agents/skills/<skill-name>/SKILL.md`, `.agents/skills/<skill-name>/agents/openai.yaml`을 가진다. 외부 기반 스킬은 `references/attribution.md`를 추가한다.

### 검증

- `scripts/validate-learning-repo.ps1`: 필수 파일, 스킬 메타데이터, 암묵 호출 차단, 출처 표기, 임시 문구 검사
- `evaluation/behavior-scenarios.md`: 명시 호출, 무지원 평가, 기록 승인 등 행동 시나리오
- `evaluation/review-report-template.md`: 서브 에이전트 검토 결과 형식

---

### Task 1: 정적 검증 기준과 저장소 골격

**Files:**
- Create: `scripts/validate-learning-repo.ps1`
- Create: `evaluation/behavior-scenarios.md`
- Create: `evaluation/review-report-template.md`

**Interfaces:**
- Consumes: 설계 문서의 저장소 구조와 완료 조건
- Produces: 이후 모든 작업이 통과해야 할 `powershell -File scripts/validate-learning-repo.ps1` 검증 명령

- [ ] **Step 1: 실패하는 저장소 검증 스크립트 작성**

스크립트가 다음을 검사하게 한다.

```powershell
$requiredFiles = @(
    'AGENTS.md',
    'THIRD_PARTY_NOTICES.md',
    'curriculum/overview.md',
    'curriculum/week-00.md',
    'curriculum/weeks-01-16.md',
    'guides/agent/operating-policy.md',
    'guides/user/start-here.md',
    'progress/current-state.md',
    'learning-notes/README.md'
)
```

추가 검사 조건:

- `.agents/skills` 아래 스킬 수가 정확히 13개다.
- 스킬 폴더명과 `SKILL.md`의 `name`이 일치한다.
- 모든 `SKILL.md`에 `name`, `description`만 있는 YAML frontmatter가 존재한다.
- 모든 `agents/openai.yaml`에 `allow_implicit_invocation: false`가 존재한다.
- 외부 기반 스킬에 `references/attribution.md`가 존재한다.
- 관리 문서에 `TODO`, `TBD`, `placeholder`, `추후 결정`, `미정`이 없다.
- 오류가 하나라도 있으면 항목별 오류를 출력하고 exit code 1로 종료한다.
- 모든 검사가 통과하면 검사 파일 수와 스킬 수를 출력하고 exit code 0으로 종료한다.

- [ ] **Step 2: 초기 실패 확인**

Run:

```powershell
pwsh -NoProfile -File scripts/validate-learning-repo.ps1
```

Expected: `AGENTS.md`, `THIRD_PARTY_NOTICES.md` 및 스킬 파일 부재를 보고하고 exit code 1.

- [ ] **Step 3: 행동 검증 시나리오 작성**

`evaluation/behavior-scenarios.md`에 설계 문서 15.2절의 10개 요청을 각각 다음 형식으로 작성한다.

```text
ID
초기 상태
사용자 요청
명시 호출 스킬
반드시 해야 하는 행동
절대 하면 안 되는 행동
판정 기준
```

- [ ] **Step 4: 서브 에이전트 검토 보고서 형식 작성**

`evaluation/review-report-template.md`에 다음 필드를 둔다.

```text
검토 관점
검토 범위
결론
발견 사항: 심각도 / 근거 파일 / 재현 요청 / 영향 / 최소 수정안
확인한 긍정 동작
남은 위험
```

### Task 2: 커리큘럼 기준 문서 배치

**Files:**
- Create: `curriculum/overview.md`
- Create: `curriculum/week-00.md`
- Create: `curriculum/weeks-01-16.md`
- Create: `curriculum/archive/ai-career-transition-curriculum-20-weeks.md`
- Source: `outputs/ai-common-foundation-week-0.md`
- Source: `outputs/ai-common-foundation-weeks-1-16.md`
- Source: `outputs/ai-career-transition-curriculum-20-weeks.md`

**Interfaces:**
- Consumes: 기존 `outputs` 문서 세 개
- Produces: 가이드와 스킬이 참조하는 변경되지 않은 기준 커리큘럼 경로

- [ ] **Step 1: 기준 문서 무결성 검사 준비**

세 원본의 SHA-256을 계산한다.

```powershell
Get-FileHash outputs/ai-common-foundation-week-0.md -Algorithm SHA256
Get-FileHash outputs/ai-common-foundation-weeks-1-16.md -Algorithm SHA256
Get-FileHash outputs/ai-career-transition-curriculum-20-weeks.md -Algorithm SHA256
```

- [ ] **Step 2: 기준 문서 복제**

0주차와 1~16주차는 내용을 바꾸지 않고 새 기준 경로에 복제한다. 20주 문서는 `archive`에 복제한다. 기존 `outputs` 원본은 유지한다.

- [ ] **Step 3: 과정 개요 작성**

`curriculum/overview.md`에 다음을 명시한다.

- 현재 기준: 0주차 + 1~16주차
- 현재 제외: 17~20주 선택 프로젝트
- 20주 문서는 과거 설계 참고 자료
- 주 15시간, 하루 3시간은 기본값이며 오늘 범위는 사용자가 선택
- 학습 주제 완료와 하루 종료는 서로 다른 상태

- [ ] **Step 4: 복제 무결성 확인**

원본과 복제본의 SHA-256이 각각 일치해야 한다.

### Task 3: 저장소 강제 규칙과 AI 가이드

**Files:**
- Create: `AGENTS.md`
- Create: `guides/agent/operating-policy.md`
- Create: `guides/agent/session-state.md`
- Create: `guides/agent/skill-routing.md`
- Create: `guides/agent/scope-and-source-policy.md`
- Create: `guides/agent/evaluation-and-record-policy.md`

**Interfaces:**
- Consumes: `curriculum/overview.md`, 설계 문서 3~14절
- Produces: 모든 학습 스킬이 따라야 하는 공통 정책과 요청별 참조 경로

- [ ] **Step 1: 루트 `AGENTS.md` 작성**

다음 여섯 규칙만 강제한다.

1. 학습 스킬은 `$skill-name`으로 명시된 경우에만 사용한다.
2. 현재 요청에 필요한 `guides/agent` 문서만 읽는다.
3. 사용자가 승인하고 파일 반영을 요청하기 전에는 기록을 수정하지 않는다.
4. 준비도는 평가하되 진도와 완료의 최종 선택은 사용자에게 둔다.
5. 핵심 이론과 현재 기술 정보에는 출처 정책을 적용한다.
6. 기존 사용자 파일과 기록을 보호한다.

- [ ] **Step 2: 운영 정책 작성**

`operating-policy.md`에 설계 문서의 절대 금지, 조건부 허용, 소크라테스식 질문 종료 선택지를 그대로 구현 가능한 문장으로 작성한다.

- [ ] **Step 3: 세션 상태 작성**

`session-state.md`에 장기 위치, 요청 모드 14개, 이해 증거 6단계, 여러 날 중단·재개 흐름과 하루 종료의 차이를 작성한다.

- [ ] **Step 4: 스킬 라우팅 작성**

각 사용자 목적을 정확히 하나의 기본 스킬로 연결하고, 보조 스킬은 사용자가 별도로 호출해야 한다고 명시한다.

- [ ] **Step 5: 범위와 출처 정책 작성**

필수·연결·선택·질문 백로그 분류와 ML 이론, 공식 API 문서, AI 보조 설명의 출처 우선순위를 작성한다.

- [ ] **Step 6: 평가와 기록 정책 작성**

준비도 세 단계, 도움 수준, 보완 시간, 재평가 방법, 사용자 선택과 기록 변경 전 확인 형식을 작성한다.

### Task 4: 세션 계획·회상·개념·오류 지원 스킬

**Files:**
- Create: `.agents/skills/learning-session-planner/**`
- Create: `.agents/skills/retrieve-first-gate/**`
- Create: `.agents/skills/explain-first-interrogator/**`
- Create: `.agents/skills/diagnose-learning-error/**`
- Create: `.agents/skills/progressive-hint-ladder/**`

**Interfaces:**
- Consumes: `guides/agent/operating-policy.md`, `session-state.md`, `scope-and-source-policy.md`, 현재 커리큘럼 위치
- Produces: 오늘 범위, 사전 회상 진단, 취약 연결, 오류 유형, 단계적 힌트

- [ ] **Step 1: 공통 스킬 형태 적용**

각 스킬에 다음 구조를 적용한다.

```text
<skill>/SKILL.md
<skill>/agents/openai.yaml
<외부 기반 skill>/references/attribution.md
```

`openai.yaml`은 다음 정책을 반드시 포함한다.

```yaml
policy:
  allow_implicit_invocation: false
```

- [ ] **Step 2: `learning-session-planner` 작성**

입력은 현재 위치, 사용 가능 시간, 원하는 강도, 이전 중단점이다. 출력은 최소·기준·확장 범위, 각 완료 조건, 자연스러운 중단점, 부족하거나 남는 시간의 조정안이다. 선택과 기록을 대신하지 않는다.

- [ ] **Step 3: `retrieve-first-gate` 적용**

설명 전에 자유 회상과 자신감 추정을 요구한다. 정확한 내용, 누락, 오개념을 구분한 뒤 공백만 다룬다. 선행 지식이 전혀 없으면 warm-start를 허용한다.

- [ ] **Step 4: `explain-first-interrogator` 적용**

학습자가 먼저 설명하게 하고 가장 약한 연결부터 최대 세 차례 질문한다. 이후에는 질문을 반복하지 않고 연결 힌트, 개념 설명 또는 사용자 선택지를 제시한다.

- [ ] **Step 5: `diagnose-learning-error` 적용**

막힌 지점을 개념·절차·전략·표현 또는 복합 오류로 분류한다. 사용자의 시도와 자기 진단을 먼저 받고, 단순 오타에는 긴 진단 절차를 강요하지 않는다.

- [ ] **Step 6: `progressive-hint-ladder` 적용**

진단 질문, 개념 질문, 원리 상기, 절차 단서, 병렬 예제, 참고 답안의 여섯 수준을 사용한다. 다음 수준으로 올라가기 전에 사용자의 요청을 받으며 사용한 수준을 응답에 명시한다.

### Task 5: 설명 검증·전이·무지원·주간 검토 스킬

**Files:**
- Create: `.agents/skills/teach-back-evaluator/**`
- Create: `.agents/skills/transfer-bridge/**`
- Create: `.agents/skills/unassisted-checkpoint/**`
- Create: `.agents/skills/weekly-learning-review/**`
- Create: `.agents/skills/ai-claim-checker/**`

**Interfaces:**
- Consumes: 학습자의 설명·답안·주간 증거, 출처 정책
- Produces: 설명 평가, 전이 결과, 무지원 증거, 주간 개선안, 주장 검증 결과

- [ ] **Step 1: `teach-back-evaluator` 적용**

학습자가 AI 초보 개발자에게 설명한다고 가정한다. 일관성, 완전성, 메커니즘, 오개념 위험을 각각 평가하고 부족한 한 지점만 다시 질문한다.

- [ ] **Step 2: `transfer-bridge` 적용**

근거리 전이와 원거리 전이를 분리한다. 각 문제에서 같은 점, 다른 점, 이동하는 원리를 묻고 표면 패턴 일치와 원리 이해를 구분한다.

- [ ] **Step 3: `unassisted-checkpoint` 적용**

평가 시작 전에 범위와 도움 금지를 확인한다. 제출 전에는 정답, 힌트, 유도 질문, 오류 표시를 제공하지 않는다. 도움을 요청하면 평가 종료 또는 보조 평가 전환을 먼저 선택하게 한다.

- [ ] **Step 4: `weekly-learning-review` 적용**

학습한 개념, 무지원 증거, 반복된 오개념, AI 도움 수준, 다음 주 누적 복습을 검토한다. 학습 시간 자체보다 설명과 독립 수행 증거를 우선한다.

- [ ] **Step 5: `ai-claim-checker` 적용**

주장을 최소 검증 단위로 분해하고 `확인됨`, `조건부`, `불확실`, `반박됨`으로 표시한다. 출처가 주장을 실제로 지지하는지 확인하고 AI의 비유를 사실 근거로 취급하지 않는다.

### Task 6: 코드 실습·리뷰·기록 스킬

**Files:**
- Create: `.agents/skills/guided-code-practice/**`
- Create: `.agents/skills/learning-code-review/**`
- Create: `.agents/skills/learning-record-manager/**`

**Interfaces:**
- Consumes: 학습자의 설계·코드·실행 결과·승인된 기록 초안
- Produces: 직접 구현 흐름, 수정 없는 리뷰, 승인된 파일 변경

- [ ] **Step 1: `guided-code-practice` 작성**

`mentoring-juniors`의 PEAR 순환을 성인 경력 개발자에게 맞게 적용한다.

```text
Plan: 책임, 입력·출력, 실패 조건 또는 의사코드 작성
Explore: 학습자가 직접 첫 구현
Analyze: 실행 결과와 각 책임 설명
Rewrite: 이해하지 못한 부분을 수정하거나 다시 구현
```

완성 코드는 사용자가 참고 구현을 명시적으로 요청했을 때만 제공한다. 제공 후에는 코드 설명이나 변형 재구현으로 이해를 확인한다.

- [ ] **Step 2: `learning-code-review` 작성**

기능, 설계 일치, 실패 처리, 테스트 가능성, 현재 주차의 학습 목표만 검토한다. 문제와 근거를 먼저 제시하고 자동 수정하지 않는다. 보안·성능은 현재 학습 범위와 관련된 경우에만 포함한다.

- [ ] **Step 3: `learning-record-manager` 작성**

변경 대상, 현재 내용, 변경 예정 내용, 보존할 내용을 먼저 제시한다. 사용자가 승인하고 `기록에 반영해줘`라고 요청한 경우에만 수정한다. 이해 수준을 AI가 임의 승격하거나 기존 기록을 삭제하지 않는다.

### Task 7: 외부 출처와 라이선스 기록

**Files:**
- Create: `THIRD_PARTY_NOTICES.md`
- Create: 외부 기반 스킬별 `references/attribution.md`

**Interfaces:**
- Consumes: GarethManning 저장소 CC BY-SA 4.0, Mentoring Juniors MIT 원본과 실제 수정 내역
- Produces: 파일 단위로 추적 가능한 출처와 재배포 조건

- [ ] **Step 1: 원본 버전 고정**

각 저장소의 사용 시점 commit SHA를 확인하고 기록한다. 브랜치 이름만 출처 버전으로 사용하지 않는다.

- [ ] **Step 2: 교육 스킬 표기**

각 `attribution.md`에 원본 스킬 이름, 원본 파일 URL, commit SHA, CC BY-SA 4.0, 수정한 대상·호출·평가 규칙을 기록한다.

- [ ] **Step 3: 코딩 멘토 스킬 표기**

`guided-code-practice`와 `learning-code-review`에 Mentoring Juniors 원본 URL, commit SHA, MIT, PEAR 및 점진적 단서에서 가져온 부분과 수정 내용을 기록한다.

- [ ] **Step 4: 루트 공지 작성**

`THIRD_PARTY_NOTICES.md`에서 모든 외부 기반 스킬, 원본 저장소, 라이선스, 로컬 경로와 수정 사실을 한 번에 확인할 수 있게 한다.

### Task 8: 사용자 진행 가이드

**Files:**
- Create: `guides/user/start-here.md`
- Create: `guides/user/daily-session-guide.md`
- Create: `guides/user/skill-invocation-guide.md`
- Create: `guides/user/review-guide.md`
- Create: `guides/user/record-guide.md`

**Interfaces:**
- Consumes: 커리큘럼, 스킬 이름, 세션·평가·기록 정책
- Produces: 사용자가 AI의 추가 설명 없이 실행 가능한 학습 절차

- [ ] **Step 1: 첫 시작 문서 작성**

`start-here.md`에 과정 선택, 현재 위치 확인, 명시 호출, AI와 사용자의 책임, 첫 요청 예시를 한 화면 분량의 진입 순서로 작성한다.

- [ ] **Step 2: 하루 세션 문서 작성**

가능한 시간 제시, 최소·기준·확장 범위 선택, 중단점, 여러 날 재개와 오늘 종료를 실제 문장 예시로 작성한다.

- [ ] **Step 3: 호출 가이드 작성**

13개 스킬마다 `언제`, `필수 입력`, `호출 예시`, `기대 출력`, `사용하지 말아야 할 때`를 작성한다.

- [ ] **Step 4: 복습 가이드 작성**

자료 없이 구조 그리기, 연속 질문, teach-back, 근거리·원거리 전이, 무지원 평가의 순서를 작성한다. 답하지 못한 부분만 다시 학습하는 규칙을 포함한다.

- [ ] **Step 5: 기록 가이드 작성**

대화 초안, 공식 진행 기록, 개인 복습 기록을 구분하고 `초안 제시 → 사용자 수정·승인 → 명시적 반영` 흐름을 예시로 작성한다.

### Task 9: 공식 진행 기록과 개인 복습 공간

**Files:**
- Create: `progress/current-state.md`
- Create: `progress/question-backlog.md`
- Create: `progress/misconception-log.md`
- Create: `progress/checkpoints/index.md`
- Create: `learning-notes/README.md`

**Interfaces:**
- Consumes: `learning-record-manager`의 승인 기반 변경 계약
- Produces: 중단·재개와 누적 복습에 필요한 최소 기록 구조

- [ ] **Step 1: 현재 상태 초기 문서 작성**

아직 학습이 시작되지 않았으므로 다음 사실만 기록한다.

```text
현재 과정: AI 공통 기반 0~16주
현재 위치: 시작 전
활성 학습 주제: 없음
마지막 승인 기록: 없음
다음 행동: 사용자가 0주차 또는 진단 시작을 선택
```

- [ ] **Step 2: 질문 백로그 형식 작성**

질문, 현재 추측, 전체 흐름 위치, 다시 학습할 주차, 확인 실험, 상태를 필드로 둔다. 실제 질문은 미리 생성하지 않는다.

- [ ] **Step 3: 오개념 기록 형식 작성**

기존 설명, 문제가 된 이유, 수정한 설명, 확인 출처, 재검증 문제, 재검증 상태를 필드로 둔다.

- [ ] **Step 4: 체크포인트 목록 작성**

평가 일자, 범위, 도움 수준, 준비도, 남은 공백, 사용자 결정, 상세 기록 경로를 필드로 둔다.

- [ ] **Step 5: 개인 복습 공간 안내 작성**

주차·날짜·주제 폴더 이름과 다섯 선택 파일의 목적을 설명한다. 빈 폴더와 빈 일일 템플릿은 생성하지 않는다.

### Task 10: 정적 검증과 행동 사전 점검

**Files:**
- Modify: 검증 실패가 지목한 파일만 수정
- Produce: `evaluation/static-validation-result.md`

**Interfaces:**
- Consumes: Task 1~9의 전체 결과
- Produces: 서브 에이전트 검토 전에 통과한 정적 검증 기록

- [ ] **Step 1: 정적 검증 실행**

Run:

```powershell
pwsh -NoProfile -File scripts/validate-learning-repo.ps1
```

Expected: exit code 0, 스킬 13개, 누락 파일 0개, 암묵 호출 허용 0개.

- [ ] **Step 2: 경로와 호출 예시 수동 검사**

```powershell
rg -n "\$[a-z0-9-]+" guides/user guides/agent AGENTS.md
rg -n "TODO|TBD|placeholder|추후 결정|미정" AGENTS.md curriculum guides progress learning-notes .agents/skills
```

호출 이름은 실제 스킬 폴더명과 모두 일치해야 하며 두 번째 명령은 결과가 없어야 한다.

- [ ] **Step 3: 검증 결과 기록**

`evaluation/static-validation-result.md`에 실행 시각, 명령, exit code, 검사 파일 수, 스킬 수와 수동 검사 결과를 기록한다.

### Task 11: 서브 에이전트 네 관점 교차 검토

**Files:**
- Create: `evaluation/reviews/learning-design.md`
- Create: `evaluation/reviews/agent-policy.md`
- Create: `evaluation/reviews/skill-design.md`
- Create: `evaluation/reviews/user-experience.md`

**Interfaces:**
- Consumes: 전체 구현, `evaluation/behavior-scenarios.md`, 보고서 템플릿
- Produces: 독립적인 네 검토 보고서와 승인 후보 수정안

- [ ] **Step 1: 학습 설계 검토 위임**

회상, 간격 반복, 설명, 전이, 무지원 검증, 인지 부하와 0~16주 과정의 적합성만 검토하게 한다.

- [ ] **Step 2: 에이전트 정책 검토 위임**

명시 호출, 금지 행동, 사용자 승인, 상태 전이, 기록 보호와 우회 가능성만 검토하게 한다.

- [ ] **Step 3: 스킬 설계 검토 위임**

13개 스킬의 책임 중복, 이름·description·호출 경계, `openai.yaml`, 출처 기록과 프롬프트 충돌만 검토하게 한다.

- [ ] **Step 4: 사용자 경험 검토 위임**

처음 접한 사용자가 첫 세션, 중단·재개, 코드 리뷰, 복습, 기록 반영을 문서만으로 수행할 수 있는지 검토하게 한다.

- [ ] **Step 5: 검토 결과 분류**

발견 사항을 다음으로 분류한다.

```text
필수 수정: 정책 위반, 기록 위험, 호출 불가, 문서 모순
권장 수정: 혼동 가능성 또는 학습 효율 저하
보류: 실제 사용 후 판단할 선호·확장 기능
```

### Task 12: 검토 반영과 최종 검증

**Files:**
- Modify: 승인된 발견 사항의 최소 관련 파일
- Create: `evaluation/final-verification.md`

**Interfaces:**
- Consumes: 네 검토 보고서와 전체 구현
- Produces: 사용자 최종 확인이 가능한 구현 결과

- [ ] **Step 1: 필수 수정 반영**

각 수정은 발견 사항 ID, 변경 파일, 변경 이유를 추적한다. 보류 항목은 구현하지 않고 `evaluation/final-verification.md`에 남긴다.

- [ ] **Step 2: 정적 검증 재실행**

Run:

```powershell
pwsh -NoProfile -File scripts/validate-learning-repo.ps1
```

Expected: exit code 0.

- [ ] **Step 3: 핵심 행동 시나리오 점검**

최소 다음 다섯 시나리오를 새 컨텍스트에서 확인한다.

```text
명시 호출 전 자동 학습 모드 금지
범위 계획의 사용자 선택 유지
무지원 평가 중 힌트 금지
코드 리뷰의 자동 수정 금지
승인 전 기록 수정 금지
```

- [ ] **Step 4: 최종 결과 기록**

`evaluation/final-verification.md`에 정적 검증, 행동 점검, 반영한 검토 사항, 보류 사항과 Git 초기화 전 상태를 기록한다.

- [ ] **Step 5: 사용자에게 인계**

사용자가 다음을 직접 확인할 수 있게 절대 경로 링크를 제공한다.

```text
guides/user/start-here.md
guides/user/skill-invocation-guide.md
AGENTS.md
evaluation/final-verification.md
```

저장소 초기화는 사용자가 직접 완료했다. 최초 커밋은 이 인계에 대한 사용자 승인 이후 별도 요청으로 수행한다.
