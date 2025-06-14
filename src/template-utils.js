// 기본 템플릿 소스 파일 예시
// 실제 프로젝트에서는 이 파일을 프로젝트에 맞게 수정하세요

/**
 * 템플릿 유틸리티 함수들
 * 에러 복원력을 고려한 기본 구현
 */

/**
 * 안전한 JSON 파싱 (실패해도 계속 진행)
 * @param {string} jsonString - 파싱할 JSON 문자열
 * @param {any} defaultValue - 파싱 실패 시 기본값
 * @returns {any} 파싱된 객체 또는 기본값
 */
function safeJsonParse(jsonString, defaultValue = null) {
  try {
    return JSON.parse(jsonString);
  } catch (error) {
    console.warn('JSON 파싱 실패 - 기본값 사용:', error.message);
    return defaultValue;
  }
}

/**
 * 환경 변수 안전 접근
 * @param {string} key - 환경 변수 키
 * @param {string} defaultValue - 기본값
 * @returns {string} 환경 변수 값 또는 기본값
 */
function getEnvSafe(key, defaultValue = '') {
  try {
    return process.env[key] || defaultValue;
  } catch (error) {
    console.warn(`환경 변수 ${key} 접근 실패 - 기본값 사용:`, error.message);
    return defaultValue;
  }
}

/**
 * MCP 설정 확인 (선택사항)
 * @returns {boolean} MCP 설정 여부
 */
function isMcpConfigured() {
  const mcpApiKey = getEnvSafe('COPILOT_MCP_API_KEY');
  return mcpApiKey.length > 0;
}

/**
 * 템플릿 초기화 함수
 */
function initializeTemplate() {
  console.log('🚀 멈추지 않는 개발 템플릿 초기화...');
  console.log('📦 Node.js:', process.version);
  console.log('🔧 MCP 설정:', isMcpConfigured() ? '✅ 구성됨' : '⚠️  미구성 (선택사항)');
  console.log('✨ 템플릿 준비 완료!');
}

// CommonJS 및 ES Module 호환성
if (typeof module !== 'undefined' && module.exports) {
  module.exports = {
    safeJsonParse,
    getEnvSafe,
    isMcpConfigured,
    initializeTemplate
  };
}

// 직접 실행 시 초기화
if (require.main === module) {
  initializeTemplate();
}