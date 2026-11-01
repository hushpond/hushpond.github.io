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

usethis::use_git_config(user.name  = "Wonjae Heo",
                        user.email = "hushpond@example.com")

usethis::edit_git_config()

usethis::git_sitrep()
# 6. Git 시작 + 첫 커밋 (커밋 여부 Yes, RStudio 재시작 Yes) -------
usethis::use_git()


# 7. (재시작 후) GitHub 저장소 생성 + push ------------------------
usethis::use_github()

# 8. 첫 배포 → 이어서 R/01_publish.R 실행

has_ghpages <- "origin/gh-pages" %in% gert::git_branch_list(local = FALSE)$name
if (!has_ghpages) {
  stop("첫 배포는 Terminal 탭에서 `quarto publish gh-pages`를 직접 실행하고 Y를 누르세요. ",
       "그 다음부터는 이 스크립트로 됩니다.")
}
status <- system2(qbin, c("publish", "gh-pages", "--no-prompt", "--no-browser"))
if (status != 0) stop("배포 실패. 위 메시지를 확인하세요.")
message("배포 완료. 1–2분 뒤 사이트에 반영됩니다.")


git config --show-origin --get-all user.name
git config --show-origin --get-all user.email
