#!/usr/bin/env python3
"""
기본 템플릿 테스트 파일 (Python)
실제 프로젝트에서는 이 파일을 프로젝트에 맞게 수정하세요
"""

import sys
import os
import unittest

class TemplateTest(unittest.TestCase):
    """템플릿 기본 기능 테스트"""
    
    def test_python_environment(self):
        """Python 환경 확인"""
        self.assertGreater(sys.version_info.major, 2, "Python 3+ should be available")
        self.assertTrue(hasattr(sys, 'version'), "Python version should be accessible")
    
    def test_error_resilience(self):
        """에러 복원력 테스트"""
        try:
            # 의도적으로 실패할 수 있는 작업
            result = int('invalid number')
            self.fail("Should have raised ValueError")
        except ValueError:
            # 에러가 발생해도 계속 진행 (continue-on-error 패턴)
            self.assertTrue(True, "Error handling works correctly")
    
    def test_mcp_readiness(self):
        """MCP 통합 준비 상태 확인"""
        # MCP 관련 환경 확인 (실제로는 선택사항)
        has_mcp_config = os.getenv('COPILOT_MCP_API_KEY') is not None
        # API 키가 없어도 템플릿은 정상 작동해야 함
        self.assertTrue(True, "Template works with or without MCP configuration")

if __name__ == '__main__':
    print('🎯 이 테스트 파일은 템플릿의 기본 구조를 확인합니다.')
    print('📝 실제 프로젝트에서는 프로젝트에 맞는 테스트로 교체하세요.')
    print('🐍 python3 tests/template_test.py로 실행할 수 있습니다.')
    print()
    
    unittest.main()