# 🚀 멈추지 않는 만능 개발 템플릿

[![Build MCP Base](https://github.com/tjqjaqhd/Dev/actions/workflows/build-mcp-base.yml/badge.svg)](https://github.com/tjqjaqhd/Dev/actions/workflows/build-mcp-base.yml)
[![CodeQL](https://github.com/tjqjaqhd/Dev/actions/workflows/codeql.yml/badge.svg)](https://github.com/tjqjaqhd/Dev/actions/workflows/codeql.yml)
[![Lint Workflows](https://github.com/tjqjaqhd/Dev/actions/workflows/lint-workflows.yml/badge.svg)](https://github.com/tjqjaqhd/Dev/actions/workflows/lint-workflows.yml)

**"Use this template"으로 복제만 하면 즉시 개발·테스트·배포가 가능한 완전 자동화 템플릿**

GitHub Copilot Coding Agent가 의존성 오류로 절대 중단되지 않도록 설계된 견고한 개발 환경을 제공합니다.

## ✨ 주요 특징

- 🔄 **절대 멈추지 않는 CI/CD**: `continue-on-error` 패턴으로 견고함 보장
- 🤖 **Copilot Agent 최적화**: MCP 서버 자동 설정 및 의존성 복원력
- 🐳 **즉시 사용 가능한 컨테이너**: Ubuntu 24.04 + Node 20 + Python 환경
- 🛡️ **보안 스캔 내장**: CodeQL 자동 실행
- 📋 **완전 자동화된 품질 관리**: 워크플로우 린팅, 의존성 업데이트

## 🚀 빠른 시작

### 1. 템플릿 사용하기

1. GitHub에서 **"Use this template"** 버튼 클릭
2. 새 저장소 이름 입력
3. Clone 후 즉시 개발 시작!

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME
npm install  # 또는 pnpm install
```

### 2. MCP 서버 설정 (선택사항)

GitHub Copilot과 MCP 서버를 사용하는 경우:

1. **Repository Settings** → **Secrets and variables** → **Actions**
2. 새 시크릿 추가: `COPILOT_MCP_API_KEY`
3. API 키 값 입력

### 3. 자동 설정 확인

템플릿 복제 후 **Actions** 탭에서 다음 워크플로우가 자동 실행됩니다:

- ✅ **Build & Push MCP Base**: Docker 이미지 빌드 및 푸시
- ✅ **CodeQL**: 보안 취약점 스캔  
- ✅ **Lint Workflows**: 워크플로우 파일 검증

## 🛠️ 개발 환경

### 포함된 도구들

| 도구 | 버전 | 용도 |
|------|------|------|
| **Ubuntu** | 24.04 | 기본 OS |
| **Node.js** | 20.x | JavaScript/TypeScript 런타임 |
| **Python** | 3.x | Python 개발 |
| **pipx** | Latest | Python 패키지 격리 설치 |
| **@mcp/server** | Latest | MCP 서버 (전역 설치) |
| **mcp-python** | Latest | Python MCP 클라이언트 |

### 로컬 개발

```bash
# Docker로 개발 환경 실행
docker build -t my-dev-env .
docker run -it --rm -v $(pwd):/workspace my-dev-env

# 또는 직접 실행
npm run start
python3 -m venv venv && source venv/bin/activate
pip install -r requirements.txt
```

## 🔧 커스터마이징

### 프로젝트 설정

1. **package.json** 수정: 프로젝트명, 스크립트, 의존성
2. **requirements.txt** 수정: Python 의존성 추가
3. **.github/copilot-instructions.md** 수정: 팀 전용 개발 가이드라인

### 워크플로우 수정

- `.github/workflows/` 디렉토리의 YAML 파일들을 프로젝트에 맞게 수정
- 모든 워크플로우는 **실패해도 중단되지 않는** 구조로 설계됨

## 📋 워크플로우 가이드

### PR 생성 시

PR 템플릿에서 **"이 PR은 MCP 서버가 필요합니다"** 체크 시:
- `copilot-setup-steps` 워크플로우 자동 실행
- MCP 환경 자동 설정 (실패해도 계속 진행)

### 자동 품질 관리

- **Renovate**: 매주 월요일 오전 의존성 자동 업데이트
- **CodeQL**: 보안 취약점 주기적 스캔
- **ActionLint**: 워크플로우 파일 문법 검증

## 🛡️ 에러 복원력

이 템플릿의 핵심 철학은 **"절대 멈추지 않는 개발 환경"**입니다:

### 의존성 설치 실패 대응
```bash
npm install || echo "npm install 실패 - 계속 진행"
pip install package || echo "package 설치 실패 - 대안 사용"
```

### CI/CD 파이프라인
- 모든 중요 스텝에 `continue-on-error: true`
- 실패 시 명확한 에러 메시지와 대안 제시
- 2단계 접근법: 주요 기능 실패 시 기본 기능으로 fallback

## 📚 추가 리소스

- [개발 지침서](.github/copilot-instructions.md)
- [PR 템플릿](.github/PULL_REQUEST_TEMPLATE.md)
- [워크플로우 문서](.github/workflows/)

## 🤝 기여하기

1. 이슈 생성 또는 기존 이슈 확인
2. 포크 후 새 브랜치 생성
3. 변경사항 커밋 (컨벤션 준수)
4. PR 생성 (템플릿 사용)

## 📄 라이선스

MIT License - 자유롭게 사용, 수정, 배포 가능합니다.

---

> 💡 **팁**: 이 템플릿은 GitHub Copilot Coding Agent가 의존성 문제로 멈추지 않도록 특별히 설계되었습니다. 모든 설치 과정이 실패해도 개발을 계속할 수 있습니다!