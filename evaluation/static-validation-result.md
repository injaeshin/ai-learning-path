# 정적 검증 결과

- 최종 실행일: 2026-08-13
- 작업 브랜치: `feat/ai-learning-agent`
- 결과: 통과

## 저장소 검증

실행 명령:

```powershell
pwsh -NoProfile -File scripts/validate-learning-repo.ps1
```

결과:

```text
검증 통과: 파일 63개, 스킬 13개
```

검사 범위:

- 필수 정책·가이드·기록 파일 존재
- 스킬 폴더 수와 승인된 이름 13개 일치
- 스킬 폴더명과 `SKILL.md`의 `name` 일치
- frontmatter에 `name`, `description`만 존재
- 스킬 이름 문법과 비어 있지 않은 설명
- 모든 `agents/openai.yaml`의 고정 UI 스키마, 설명 길이와 정확한 `$skill-name`
- 모든 스킬에서 암묵 호출 차단
- 스킬의 운영·평가 정책 상대 링크와 실제 대상 존재
- 외부 기반 스킬 12개에 개별 출처 문서 존재
- 관리 문서의 미완성 표식과 잘못된 UTF-8 대체 문자 부재

## 호출 이름 검사

사용자·AI 가이드에서 `$skill-name` 형태를 추출해 실제 스킬 폴더와 비교했다.

```text
실제 스킬: 13
가이드에서 참조한 스킬: 13
존재하지 않는 호출: 0
가이드에서 빠진 스킬: 0
```

설명용 일반 표기 `$skill-name`은 비교에서 제외했다.

## 커리큘럼 무결성

| 원본 | SHA-256 | 복제본 일치 |
|---|---|---|
| `outputs/ai-common-foundation-week-0.md` | `BC5BBEB0095C5C61BDAA836C1A3F7BDB39510F589CB56EFB4DDA1CE386EBB1B4` | 예 |
| `outputs/ai-common-foundation-weeks-1-16.md` | `7F2AC927EAFA3153AE31616CC0312BC2DF62809E8C294E6ECDFDED0F01E0D7B2` | 예 |
| `outputs/ai-career-transition-curriculum-20-weeks.md` | `9162574841A9B6EFBBEB9A73C16DA86305D0E67C8D2799C95495168963664597` | 예 |

0주차와 1~16주차는 기준 경로에, 20주 문서는 참고 보관 경로에 원문 그대로 복제됐다.

## 공식 스킬 검증기 상태

`skill-creator/scripts/quick_validate.py`는 실행 환경의 번들 Python에 `PyYAML` 모듈이 없어 시작되지 않았다. 이는 스킬 검증 실패가 아니라 검증 도구 의존성 부족이다.

대신 저장소 고정 스키마 검증기에서 이름, frontmatter, 폴더 일치, UI 필드·길이, 기본 프롬프트 호출명, 암묵 호출 정책과 상대 링크를 검사했다. 외부 패키지는 설치하지 않았다.
