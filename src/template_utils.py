#!/usr/bin/env python3
"""
기본 템플릿 유틸리티 (Python)
에러 복원력을 고려한 기본 구현
"""

import os
import json
import sys
from typing import Any, Optional

def safe_json_parse(json_string: str, default_value: Any = None) -> Any:
    """
    안전한 JSON 파싱 (실패해도 계속 진행)
    
    Args:
        json_string: 파싱할 JSON 문자열
        default_value: 파싱 실패 시 기본값
        
    Returns:
        파싱된 객체 또는 기본값
    """
    try:
        return json.loads(json_string)
    except (json.JSONDecodeError, TypeError) as error:
        print(f"⚠️  JSON 파싱 실패 - 기본값 사용: {error}", file=sys.stderr)
        return default_value

def get_env_safe(key: str, default_value: str = '') -> str:
    """
    환경 변수 안전 접근
    
    Args:
        key: 환경 변수 키
        default_value: 기본값
        
    Returns:
        환경 변수 값 또는 기본값
    """
    try:
        return os.getenv(key, default_value)
    except Exception as error:
        print(f"⚠️  환경 변수 {key} 접근 실패 - 기본값 사용: {error}", file=sys.stderr)
        return default_value

def is_mcp_configured() -> bool:
    """
    MCP 설정 확인 (선택사항)
    
    Returns:
        MCP 설정 여부
    """
    mcp_api_key = get_env_safe('COPILOT_MCP_API_KEY')
    return len(mcp_api_key) > 0

def initialize_template():
    """템플릿 초기화 함수"""
    print('🚀 멈추지 않는 개발 템플릿 초기화...')
    print(f'🐍 Python: {sys.version}')
    print(f'🔧 MCP 설정: {"✅ 구성됨" if is_mcp_configured() else "⚠️  미구성 (선택사항)"}')
    print('✨ 템플릿 준비 완료!')

if __name__ == '__main__':
    initialize_template()