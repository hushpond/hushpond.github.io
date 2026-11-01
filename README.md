# Personal site (Quarto + R project)

## 파일 지도 — 무엇을 고치려면 어디로

| 바꿀 것 | 파일 |
|---|---|
| CV 항목 (국문·영문) | `cv.yml` |
| CV PDF | `cv.pdf` (루트에 두기) |
| 첫 화면 (About, 국문·영문 두 열) | `index.qmd` |
| 프로젝트 목록 페이지 소개 문구 | `projects.qmd` |
| 프로젝트 | `projects/<이름>/index.qmd` (폴더 하나 = 프로젝트 하나) |
| 논문·글 목록 | `writing.qmd` |
| 이름, 메뉴, GitHub·메일 아이콘 링크 | `_quarto.yml` |
| 글꼴 (EB Garamond + Noto Serif KR) | `theme.scss` |
| 여백·색·열 폭 | `styles.css` 맨 위 `:root` 변수 |
| 이름, 아이콘, 저작권 문구 | `_quarto.yml`의 `header`, `footer` |
| 프로젝트 목록 모양 | `projects.ejs` (보통 건드릴 일 없음) |

## 최초 1회
1. 폴더 이름을 `USERNAME.github.io`로 변경 → `wj-site.Rproj` 더블클릭
2. `R/00_setup.R`을 열고 위에서부터 한 줄씩 실행

## 평소 작업
1. 파일 수정 후 Build 탭 → **Render Website** (또는 콘솔에서 `quarto::quarto_preview()`)로 확인
2. 만족하면 `source("R/01_publish.R")` → 커밋·push·배포 한 번에

## 프로젝트 추가
기존 프로젝트 폴더를 복사해 이름을 바꾸고 머리말만 수정:
```yaml
title: "제목"
description: "목록에 보일 한두 문장"
year: 2026            # 선택
order: 5              # 작을수록 위
categories: [R, network analysis]
github: https://github.com/USERNAME/REPO   # 없으면 줄 삭제
paper: https://doi.org/...                  # 선택
```

## 처음 배포 후 확인
GitHub 저장소 → Settings → Pages → Branch가 `gh-pages` / `(root)`인지 확인.
