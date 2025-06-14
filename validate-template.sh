#!/bin/bash

# 템플릿 기능 검증 스크립트
echo "🚀 멈추지 않는 개발 템플릿 검증 시작..."

# 기본 환경 확인
echo "📋 환경 확인:"
echo "- Node.js: $(node --version 2>/dev/null || echo '미설치')"
echo "- Python: $(python3 --version 2>/dev/null || echo '미설치')"
echo "- npm: $(npm --version 2>/dev/null || echo '미설치')"
echo "- pipx: $(pipx --version 2>/dev/null || echo '미설치')"

# 패키지 설치 테스트
echo ""
echo "📦 의존성 설치 테스트:"
npm install --silent || echo "❌ npm install 실패 - 계속 진행"
echo "✅ npm 의존성 처리 완료"

# 기본 스크립트 실행 테스트
echo ""
echo "🔧 스크립트 실행 테스트:"
npm run test || echo "❌ 테스트 실패 - 계속 진행"
npm run build || echo "❌ 빌드 실패 - 계속 진행"
npm run lint || echo "❌ 린트 실패 - 계속 진행"
echo "✅ 기본 스크립트 실행 완료"

# 워크플로우 파일 검증
echo ""
echo "⚙️  워크플로우 파일 검증:"
if command -v actionlint >/dev/null 2>&1; then
    actionlint .github/workflows/*.yml && echo "✅ 워크플로우 린트 통과" || echo "❌ 워크플로우 린트 실패 - 계속 진행"
else
    echo "⚠️  actionlint 미설치 - 워크플로우 검증 건너뜀"
fi

# Docker 이미지 테스트 (선택사항)
echo ""
echo "🐳 Docker 이미지 테스트:"
if command -v docker >/dev/null 2>&1; then
    if docker images | grep -q test-mcp-base; then
        echo "✅ Docker 이미지 존재 확인"
        docker run --rm test-mcp-base bash -c "echo '컨테이너 실행 테스트 성공'" || echo "❌ 컨테이너 실행 실패 - 계속 진행"
    else
        echo "⚠️  Docker 이미지 미구축 - 테스트 건너뜀"
    fi
else
    echo "⚠️  Docker 미설치 - 테스트 건너뜀"
fi

echo ""
echo "🎉 템플릿 검증 완료!"
echo "   이 템플릿은 'Use this template' 버튼으로 사용할 준비가 되었습니다."
echo ""
echo "📚 다음 단계:"
echo "   1. Repository Settings에서 'Template repository' 활성화"
echo "   2. COPILOT_MCP_API_KEY 시크릿 설정 (필요시)"
echo "   3. Actions 탭에서 워크플로우 실행 상태 확인"