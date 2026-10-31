# ============================================================
#  수정할 때마다 실행: 전체 선택 후 실행, 또는 콘솔에서
#    source("R/01_publish.R")
#  하는 일: (1) 사이트 빌드 확인 → (2) 소스 커밋·push → (3) GitHub Pages 배포
# ============================================================

msg <- "Update site"   # 커밋 메시지 (원하면 수정)

# Quarto 실행 파일 찾기 (RStudio에 포함된 것 포함)
qbin <- quarto::quarto_path()
if (is.null(qbin) || !nzchar(qbin)) {
  stop("Quarto를 찾지 못함. RStudio의 Terminal 탭에서 `quarto publish gh-pages`를 직접 실행하세요.")
}

# (1) 빌드 — 오류가 있으면 여기서 멈춤
quarto::quarto_render()

# (2) 소스 저장소에 커밋·push (변경이 없으면 건너뜀)
if (nrow(gert::git_status()) > 0) {
  gert::git_add(".")
  gert::git_commit(msg)
  gert::git_push()
}

# (3) 배포 — gh-pages 브랜치로 빌드 결과 업로드
status <- system2(qbin, c("publish", "gh-pages", "--no-prompt", "--no-browser"))
if (status != 0) stop("배포 실패. 위 메시지를 확인하세요.")
message("배포 완료. 1–2분 뒤 사이트에 반영됩니다.")
