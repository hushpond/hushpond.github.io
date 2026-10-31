# ============================================================
#  최초 1회 설정 — source() 하지 말고, 한 줄씩 Ctrl+Enter (Mac: Cmd+Enter)
#  전제: 이 R 프로젝트 폴더 이름이 'USERNAME.github.io' 로 바뀌어 있을 것
#        (use_github()가 폴더 이름을 저장소 이름으로 씀)
# ============================================================

# 1. 패키지 -----------------------------------------------------
install.packages(c("usethis", "gitcreds", "yaml", "knitr", "rmarkdown", "quarto"))

# 2. Git 사용자 정보 (커밋에 찍히는 이름/이메일) ------------------
usethis::use_git_config(
  user.name  = "Wonjae Heo",
  user.email = "GitHub에_등록한_이메일"          # TODO
)

# 3. GitHub 토큰 발급 → 브라우저에서 Expiration 늘리고 Generate, 토큰 복사 --
usethis::create_github_token()

# 4. 토큰 저장 → 콘솔에 붙여넣기 ---------------------------------
gitcreds::gitcreds_set()

# 5. 점검: GitHub 항목에 아이디와 '<discovered>'가 보이면 정상 ----
usethis::git_sitrep()

# 6. Git 시작 + 첫 커밋 (커밋 여부 Yes, RStudio 재시작 Yes) -------
usethis::use_git()

# 7. (재시작 후) GitHub 저장소 생성 + push ------------------------
usethis::use_github()

# 8. 첫 배포 → 이어서 R/01_publish.R 실행
