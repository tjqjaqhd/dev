# Copilot 개발 지침 📋

이 파일은 GitHub Copilot과 개발 팀이 이 저장소에서 일관된 개발을 수행하기 위한 가이드라인입니다.

## 폴더 구조 📁

```
/
├── .github/           # GitHub 설정 파일들
│   ├── workflows/     # CI/CD 워크플로우
│   └── *.md          # PR 템플릿, 이슈 템플릿 등
├── src/              # 소스 코드 (생성 시)
├── tests/            # 테스트 코드 (생성 시)
├── docs/             # 문서 (생성 시)
├── Dockerfile        # 컨테이너 이미지 정의
└── README.md         # 프로젝트 설명서
```

## 코딩 컨벤션 🎯

### 일반 원칙
- **가독성 우선**: 명확하고 이해하기 쉬운 코드 작성
- **일관성 유지**: 기존 코드 스타일과 일치
- **자동화 활용**: 가능한 모든 작업을 자동화

### 파일 명명 규칙
- **kebab-case**: 파일명은 소문자와 하이픈 사용 (`my-component.js`)
- **camelCase**: JavaScript/TypeScript 변수/함수명
- **PascalCase**: 클래스명, 컴포넌트명

### 커밋 메시지
```
type(scope): 간단한 설명

- feat: 새로운 기능
- fix: 버그 수정
- docs: 문서 변경
- style: 코드 포맷팅
- refactor: 코드 리팩토링
- test: 테스트 추가/수정
- chore: 기타 작업
```

## 금지 사항 ⛔

### 절대 생성/수정하지 말 것
- `/.git/` 디렉토리의 직접 조작
- 시스템 설정 파일 무단 변경
- 보안 자격 증명의 하드코딩

### 권장하지 않는 패턴
- 거대한 단일 파일 (1000줄 이상)
- 하드코딩된 환경별 설정
- 테스트 없는 중요 로직

## 의존성 관리 📦

### Node.js 프로젝트
- **pnpm** 사용 권장 (npm 대신)
- `pnpm-lock.yaml` 파일 반드시 커밋
- 보안 취약점 정기 검사

### Python 프로젝트
- **venv** 또는 **pipx** 사용
- `requirements.txt` 또는 `pyproject.toml` 버전 고정
- 가상환경 활성화 상태에서 작업

## MCP (Model Context Protocol) 설정 🤖

### 환경 변수
```bash
COPILOT_MCP_API_KEY=your_api_key_here
```

### MCP 서버 요구사항
- PR 생성 시 템플릿에서 MCP 서버 필요 여부 체크
- 필요 시 자동으로 `copilot-setup-steps` 워크플로우 실행

## 에러 처리 원칙 🛡️

### CI/CD 파이프라인
- **절대 중단되지 않는 파이프라인**: `continue-on-error: true` 적극 활용
- **2단계 접근법**: 중요한 작업은 실패해도 대안 제공
- **명확한 에러 메시지**: 실패 시 원인과 해결방법 제시

### 의존성 설치
```yaml
# 좋은 예시
- name: Install dependencies
  run: |
    npm install || echo "npm install 실패 - 계속 진행"
    pip install -r requirements.txt || echo "pip install 실패 - 계속 진행"
  continue-on-error: true
```

## 템플릿 사용 가이드 🚀

이 저장소는 **Template Repository**로 설정되어 있습니다.

### 새 프로젝트 시작하기
1. GitHub에서 **"Use this template"** 버튼 클릭
2. 새 저장소 이름 설정
3. Clone 후 즉시 개발 시작 가능!

### 초기 설정 (자동)
- Docker 이미지 빌드
- CI/CD 파이프라인 활성화
- 보안 스캔 (CodeQL) 활성화
- 워크플로우 린팅 활성화

## 도움말 📚

### 문제 해결
1. **Actions 탭**에서 워크플로우 상태 확인
2. **Issues** 탭에서 알려진 문제 검색
3. **Wiki** 또는 **Discussions**에서 추가 정보 확인

### 연락처
- GitHub Issues로 버그 리포트
- Discussions로 질문 및 제안

---

> 💡 **팁**: 이 지침을 수정할 때는 반드시 팀과 상의 후 업데이트하세요!