# 멈추지 않는 개발 템플릿 🚀

[![Build MCP Base](https://github.com/tjqjaqhd/Dev/actions/workflows/build-mcp-base.yml/badge.svg)](https://github.com/tjqjaqhd/Dev/actions/workflows/build-mcp-base.yml)
[![CodeQL](https://github.com/tjqjaqhd/Dev/actions/workflows/codeql.yml/badge.svg)](https://github.com/tjqjaqhd/Dev/actions/workflows/codeql.yml)
[![Lint Workflows](https://github.com/tjqjaqhd/Dev/actions/workflows/lint-workflows.yml/badge.svg)](https://github.com/tjqjaqhd/Dev/actions/workflows/lint-workflows.yml)

## 🎯 GitHub Actions 최적화

각 액션은 **필요할 때만** 실행되도록 최적화되었습니다:

### 📋 액션별 실행 조건

| 액션 | 실행 시점 | 목적 |
|-----|---------|-----|
| **build-mcp-base.yml** | Dockerfile 변경시 | Docker 이미지 빌드/배포 |
| **codeql.yml** | 소스코드 변경시 + 주간 | 보안 취약점 스캔 |
| **copilot-setup-steps.yml** | 새 PR 생성시 | MCP 환경 자동 설정 |
| **lint-workflows.yml** | 워크플로우 변경시 | GitHub Actions 검증 |

### ⚡ 최적화 내용

- **CodeQL**: PR마다 실행하지 않고 main 브랜치 코드 변경시만 실행
- **Docker Build**: PR에서 제거, main 브랜치 Dockerfile 변경시만 실행  
- **MCP Setup**: PR 업데이트마다 실행하지 않고 새 PR 생성시만 실행
- **Workflow Lint**: 워크플로우 파일 변경시만 실행

## 🚀 사용 방법

1. **"Use this template"** 버튼 클릭
2. 새 저장소 생성
3. Clone 후 즉시 개발 시작!

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO
npm install  # 또는 pnpm install
npm run init # 환경 확인
```

## 🛠️ 개발 환경

- **Node.js** + **Python** 지원
- **Docker** 컨테이너 환경 제공
- **MCP (Model Context Protocol)** 지원
- **자동 보안 스캔** 및 **의존성 업데이트**

## 📝 라이선스

MIT License
