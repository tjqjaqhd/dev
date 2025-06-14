# 멈추지 않는 만능 개발 템플릿 - MCP Base Container
FROM ubuntu:24.04

# 레이어 최소화를 위한 모든 패키지 설치를 단일 RUN으로 결합
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    python3 \
    python3-pip \
    python3-venv \
    pipx \
    ca-certificates \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Node.js 20 설치 (Ubuntu 기본 저장소에서 Node.js 설치 후 필요시 업그레이드)
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    npm install -g n && \
    n 20 || echo "Node.js 20 업그레이드 실패 - 기본 버전 사용" && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# pipx PATH 설정 및 MCP 관련 패키지 글로벌 설치
ENV PATH=$PATH:/root/.local/bin

# pipx 초기화 및 MCP 패키지 설치 (실패해도 계속 진행)
RUN pipx ensurepath || echo "pipx ensurepath 실패 - 계속 진행" && \
    pipx install mcp-python || echo "mcp-python 설치 실패 - 계속 진행" && \
    npm install -g @mcp/server@latest || echo "@mcp/server 설치 실패 - 계속 진행" && \
    echo "=== 설치된 버전 확인 ===" && \
    node --version || echo "Node.js 버전 확인 실패" && \
    python3 --version || echo "Python 버전 확인 실패" && \
    pipx list || echo "pipx 패키지 목록 확인 실패"

# 작업 디렉토리 설정
WORKDIR /workspace

# 기본 명령어
CMD ["/bin/bash"]