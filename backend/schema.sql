-- ══════════════════════════════════════════════
--  Alien Nest — Supabase Schema
--  Supabase SQL Editor에 붙여넣기 후 Run 클릭
-- ══════════════════════════════════════════════

-- 데이터 저장소 (key-value 방식)
CREATE TABLE IF NOT EXISTS data_store (
    key         TEXT PRIMARY KEY,
    value       JSONB NOT NULL DEFAULT '{}',
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
  );

-- Row Level Security 활성화 (anon 키로 모두 허용)
ALTER TABLE data_store ENABLE ROW LEVEL SECURITY;

CREATE POLICY "anon_all" ON data_store
  FOR ALL TO anon
  USING (true)
  WITH CHECK (true);

-- 인덱스
CREATE INDEX IF NOT EXISTS idx_data_store_updated ON data_store (updated_at DESC);

-- ✅ 완료! Table Editor에서 data_store 테이블이 보이면 성공입니다.
