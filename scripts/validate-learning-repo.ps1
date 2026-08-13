#requires -Version 7.0

[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$errors = [System.Collections.Generic.List[string]]::new()
$checkedFiles = 0

$requiredFiles = @(
    'AGENTS.md',
    'THIRD_PARTY_NOTICES.md',
    'curriculum/overview.md',
    'curriculum/week-00.md',
    'curriculum/weeks-01-16.md',
    'curriculum/archive/ai-career-transition-curriculum-20-weeks.md',
    'guides/agent/operating-policy.md',
    'guides/agent/session-state.md',
    'guides/agent/skill-routing.md',
    'guides/agent/scope-and-source-policy.md',
    'guides/agent/evaluation-and-record-policy.md',
    'guides/user/start-here.md',
    'guides/user/daily-session-guide.md',
    'guides/user/skill-invocation-guide.md',
    'guides/user/review-guide.md',
    'guides/user/record-guide.md',
    'progress/current-state.md',
    'progress/question-backlog.md',
    'progress/misconception-log.md',
    'progress/checkpoints/index.md',
    'learning-notes/README.md',
    'evaluation/behavior-scenarios.md',
    'evaluation/behavior-validation-result.md',
    'evaluation/final-verification.md',
    'evaluation/review-report-template.md'
)

$expectedSkills = @(
    'learning-session-planner',
    'retrieve-first-gate',
    'explain-first-interrogator',
    'diagnose-learning-error',
    'progressive-hint-ladder',
    'guided-code-practice',
    'learning-code-review',
    'teach-back-evaluator',
    'transfer-bridge',
    'unassisted-checkpoint',
    'weekly-learning-review',
    'ai-claim-checker',
    'learning-record-manager'
)

$externalSkills = $expectedSkills | Where-Object { $_ -ne 'learning-record-manager' }

foreach ($relativePath in $requiredFiles) {
    $fullPath = Join-Path $repoRoot $relativePath
    if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
        $errors.Add("필수 파일 없음: $relativePath")
        continue
    }
    $checkedFiles++
}

$skillsRoot = Join-Path $repoRoot '.agents/skills'
if (-not (Test-Path -LiteralPath $skillsRoot -PathType Container)) {
    $errors.Add('스킬 폴더 없음: .agents/skills')
} else {
    $actualSkillFolders = @(Get-ChildItem -LiteralPath $skillsRoot -Directory | Select-Object -ExpandProperty Name | Sort-Object)
    $expectedSorted = @($expectedSkills | Sort-Object)

    if ($actualSkillFolders.Count -ne $expectedSkills.Count) {
        $errors.Add("스킬 수 불일치: 예상 $($expectedSkills.Count), 실제 $($actualSkillFolders.Count)")
    }

    foreach ($skillName in $expectedSkills) {
        if ($skillName -notin $actualSkillFolders) {
            $errors.Add("스킬 폴더 없음: .agents/skills/$skillName")
            continue
        }

        $skillPath = Join-Path $skillsRoot $skillName
        $skillFile = Join-Path $skillPath 'SKILL.md'
        $openAiFile = Join-Path $skillPath 'agents/openai.yaml'

        if (-not (Test-Path -LiteralPath $skillFile -PathType Leaf)) {
            $errors.Add("SKILL.md 없음: .agents/skills/$skillName/SKILL.md")
        } else {
            $checkedFiles++
            $content = Get-Content -LiteralPath $skillFile -Raw -Encoding UTF8
            $frontmatterMatch = [regex]::Match($content, '(?s)\A---\r?\n(.*?)\r?\n---')
            if (-not $frontmatterMatch.Success) {
                $errors.Add("YAML frontmatter 없음: .agents/skills/$skillName/SKILL.md")
            } else {
                $frontmatterLines = $frontmatterMatch.Groups[1].Value -split '\r?\n' |
                    Where-Object { $_.Trim() -ne '' -and -not $_.TrimStart().StartsWith('#') }
                $keys = @($frontmatterLines | ForEach-Object {
                    if ($_ -match '^([a-zA-Z0-9_-]+):') { $Matches[1] } else { '__invalid__' }
                })
                $expectedKeys = @('description', 'name')
                $actualKeys = @($keys | Sort-Object)
                if (($actualKeys -join ',') -ne ($expectedKeys -join ',')) {
                    $errors.Add("frontmatter 키 오류: .agents/skills/$skillName/SKILL.md (name, description만 허용)")
                }

                $nameMatch = [regex]::Match($frontmatterMatch.Groups[1].Value, '(?m)^name:\s*["'']?([^"''\r\n]+)["'']?\s*$')
                if (-not $nameMatch.Success -or $nameMatch.Groups[1].Value.Trim() -ne $skillName) {
                    $errors.Add("스킬 이름 불일치: 폴더=$skillName")
                }

                if ($skillName -notmatch '^[a-z0-9-]{1,64}$') {
                    $errors.Add("스킬 이름 문법 오류: $skillName")
                }

                $descriptionMatch = [regex]::Match($frontmatterMatch.Groups[1].Value, '(?m)^description:\s*"([^"\r\n]+)"\s*$')
                if (-not $descriptionMatch.Success -or [string]::IsNullOrWhiteSpace($descriptionMatch.Groups[1].Value)) {
                    $errors.Add("스킬 설명 없음 또는 따옴표 형식 오류: .agents/skills/$skillName/SKILL.md")
                }
            }

            $operatingPolicyLink = '[운영 정책](../../../guides/agent/operating-policy.md)'
            if (-not $content.Contains($operatingPolicyLink, [System.StringComparison]::Ordinal)) {
                $errors.Add("운영 정책 링크 없음: .agents/skills/$skillName/SKILL.md")
            }

            $relativeLinks = [regex]::Matches($content, '\]\((\.\./\.\./\.\./[^)#]+)(?:#[^)]+)?\)')
            foreach ($relativeLink in $relativeLinks) {
                $targetPath = [System.IO.Path]::GetFullPath((Join-Path $skillPath $relativeLink.Groups[1].Value))
                if (-not $targetPath.StartsWith($repoRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
                    $errors.Add("저장소 밖 스킬 링크: .agents/skills/$skillName/SKILL.md -> $($relativeLink.Groups[1].Value)")
                } elseif (-not (Test-Path -LiteralPath $targetPath)) {
                    $errors.Add("깨진 스킬 링크: .agents/skills/$skillName/SKILL.md -> $($relativeLink.Groups[1].Value)")
                }
            }
        }

        if (-not (Test-Path -LiteralPath $openAiFile -PathType Leaf)) {
            $errors.Add("openai.yaml 없음: .agents/skills/$skillName/agents/openai.yaml")
        } else {
            $checkedFiles++
            $openAiContent = Get-Content -LiteralPath $openAiFile -Raw -Encoding UTF8
            $openAiSchema = [regex]::Match(
                $openAiContent,
                '\Ainterface:\r?\n  display_name: "([^"\r\n]+)"\r?\n  short_description: "([^"\r\n]+)"\r?\n  default_prompt: "([^"\r\n]+)"\r?\npolicy:\r?\n  allow_implicit_invocation: false\r?\n?\z'
            )
            if (-not $openAiSchema.Success) {
                $errors.Add("openai.yaml 고정 스키마 오류: .agents/skills/$skillName/agents/openai.yaml")
            } else {
                $displayName = $openAiSchema.Groups[1].Value
                $shortDescription = $openAiSchema.Groups[2].Value
                $defaultPrompt = $openAiSchema.Groups[3].Value
                if ([string]::IsNullOrWhiteSpace($displayName)) {
                    $errors.Add("표시 이름 없음: .agents/skills/$skillName/agents/openai.yaml")
                }
                if ($shortDescription.Length -lt 25 -or $shortDescription.Length -gt 64) {
                    $errors.Add("짧은 설명 길이 오류(25~64자): .agents/skills/$skillName/agents/openai.yaml")
                }
                $escapedSkillName = [regex]::Escape($skillName)
                if ($defaultPrompt -notmatch "(?<![a-z0-9-])\`$$escapedSkillName(?![a-z0-9-])") {
                    $errors.Add("기본 프롬프트의 정확한 스킬 호출 없음: .agents/skills/$skillName/agents/openai.yaml")
                }
            }
        }

        if ($skillName -in $externalSkills) {
            $attributionFile = Join-Path $skillPath 'references/attribution.md'
            if (-not (Test-Path -LiteralPath $attributionFile -PathType Leaf)) {
                $errors.Add("외부 출처 문서 없음: .agents/skills/$skillName/references/attribution.md")
            } else {
                $checkedFiles++
            }
        }
    }

    foreach ($unexpected in $actualSkillFolders | Where-Object { $_ -notin $expectedSorted }) {
        $errors.Add("예상하지 않은 스킬 폴더: .agents/skills/$unexpected")
    }
}

$evaluationPolicySkills = @('teach-back-evaluator', 'unassisted-checkpoint')
foreach ($skillName in $evaluationPolicySkills) {
    $skillFile = Join-Path $skillsRoot "$skillName/SKILL.md"
    if (Test-Path -LiteralPath $skillFile -PathType Leaf) {
        $content = Get-Content -LiteralPath $skillFile -Raw -Encoding UTF8
        if (-not $content.Contains('[평가와 기록 정책](../../../guides/agent/evaluation-and-record-policy.md)', [System.StringComparison]::Ordinal)) {
            $errors.Add("공통 평가 정책 링크 없음: .agents/skills/$skillName/SKILL.md")
        }
    }
}

$managedRoots = @('AGENTS.md', 'curriculum', 'guides', 'progress', 'learning-notes', '.agents/skills')
$unfinishedPattern = '(?i)\bTODO\b|\bTBD\b|placeholder|추후 결정|미정'
foreach ($relativeRoot in $managedRoots) {
    $fullRoot = Join-Path $repoRoot $relativeRoot
    if (-not (Test-Path -LiteralPath $fullRoot)) {
        continue
    }

    $files = if (Test-Path -LiteralPath $fullRoot -PathType Leaf) {
        @(Get-Item -LiteralPath $fullRoot)
    } else {
        @(Get-ChildItem -LiteralPath $fullRoot -Recurse -File -Include '*.md', '*.yaml')
    }

    foreach ($file in $files) {
        $relativeFile = $file.FullName.Substring($repoRoot.Length + 1).Replace('\', '/')
        $matches = Select-String -LiteralPath $file.FullName -Pattern $unfinishedPattern -AllMatches
        foreach ($match in $matches) {
            $errors.Add("미완성 표식: ${relativeFile}:$($match.LineNumber)")
        }
    }
}

$textFiles = Get-ChildItem -LiteralPath $repoRoot -Recurse -File | Where-Object {
    $_.FullName -notmatch '[\\/]\.git[\\/]' -and
    $_.Extension -in @('.md', '.yaml', '.yml', '.ps1')
}
foreach ($file in $textFiles) {
    $replacementMatches = Select-String -LiteralPath $file.FullName -SimpleMatch ([char]0xFFFD)
    foreach ($replacementMatch in $replacementMatches) {
        $relativeFile = $file.FullName.Substring($repoRoot.Length + 1).Replace('\', '/')
        $errors.Add("손상된 UTF-8 대체 문자: ${relativeFile}:$($replacementMatch.LineNumber)")
    }
}

if ($errors.Count -gt 0) {
    Write-Host "검증 실패: $($errors.Count)개" -ForegroundColor Red
    foreach ($errorMessage in $errors) {
        Write-Host "- $errorMessage"
    }
    exit 1
}

Write-Host "검증 통과: 파일 ${checkedFiles}개, 스킬 $($expectedSkills.Count)개" -ForegroundColor Green
exit 0
