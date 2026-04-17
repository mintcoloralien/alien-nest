# ✦ Alien Nest — 셋업 가이드

이 가이드를 따라하면 **이 컴퓨터, 모바일, 노트북** 어디서든 데이터가 동기화되는 Alien Nest를 배포할 수 있습니다.

---

## 전체 흐름 요약

```
Supabase 계정 만들기
  → 데이터베이스 스키마 실행
  → index.html 에 Supabase 키 입력
  → Vercel 로 배포 (웹 접속 가능)
```

---

## Step 1. Supabase 프로젝트 만들기

1. [https://supabase.com](https://supabase.com) 접속 → 무료 계정 가입 (GitHub 로그인 권장)
2. **New project** 클릭
3. 프로젝트 이름 입력 (예: `alien-nest`), 비밀번호 설정, 리전은 **Northeast Asia (Seoul)** 선택
4. 생성 완료까지 약 1~2분 대기

---

## Step 2. 데이터베이스 스키마 실행

1. Supabase 프로젝트 대시보드 → 왼쪽 메뉴 **SQL Editor** 클릭
2. `backend/schema.sql` 파일 전체 내용 복사
3. SQL Editor에 붙여넣기 → **Run** 버튼 클릭
4. 완료되면 왼쪽 **Table Editor**에서 `data_store` 테이블 확인

---

## Step 3. Supabase API 키 확인

1. 왼쪽 메뉴 **Settings** → **API** 클릭
2. 아래 두 값을 복사:

| 항목 | 어디서 찾나 |
|------|------------|
| **Project URL** | `https://abcdefgh.supabase.co` 형태 |
| **anon public key** | `eyJhbGci...` 로 시작하는 긴 문자열 |

---

## Step 4. index.html 에 키 입력

`index.html` 파일 상단의 아래 부분을 찾아서 실제 값으로 교체하세요:

```javascript
// ── Supabase 설정 ─────────────────────────────
const SUPABASE_URL      = 'https://YOUR_PROJECT_REF.supabase.co';  // ← 여기 교체
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';                // ← 여기 교체
```

교체 후:

```javascript
const SUPABASE_URL      = 'https://abcdefgh.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';
```

---

## Step 5. Vercel로 배포 (멀티 디바이스 접속)

### 방법 A. GitHub를 통한 배포 (권장)

1. [https://github.com](https://github.com) 에서 새 repository 생성 (예: `alien-nest`)
2. `alien-nest` 폴더 내 파일들을 push:
   ```bash
   git init
   git add index.html
   git commit -m "Alien Nest 배포"
   git remote add origin https://github.com/YOUR_USERNAME/alien-nest.git
   git push -u origin main
   ```
3. [https://vercel.com](https://vercel.com) → 무료 가입 → **New Project** → GitHub repository 연결
4. 설정 변경 없이 **Deploy** 클릭
5. 배포 완료 후 `https://alien-nest-xxxx.vercel.app` 형태의 URL 발급

### 방법 B. 드래그앤드롭 배포 (가장 간단)

1. [https://vercel.com/new](https://vercel.com/new) 접속
2. **"Deploy without Git"** 선택
3. `index.html` 파일만 드래그앤드롭
4. 바로 URL 발급

---

## Step 6. 모바일/노트북 접속

- 발급된 Vercel URL을 모바일 브라우저에서 열기
- 모바일 홈 화면에 추가하면 앱처럼 사용 가능:
  - **iPhone**: Safari → 공유 버튼 → "홈 화면에 추가"
  - **Android**: Chrome → 메뉴(⋮) → "홈 화면에 추가"

---

## 동기화 상태 표시

사이드바 하단에 동기화 상태가 표시됩니다:

| 색상 | 의미 |
|------|------|
| 🟢 초록 | 동기화 완료 |
| 🟡 노랑 | 저장 중 |
| 🔴 빨강 | 오프라인 (로컬 저장됨) |
| ⚫ 회색 | 연결 중 / 설정 필요 |

> 오프라인 상태에서도 데이터는 브라우저 로컬에 저장됩니다. 온라인이 되면 다음 저장 시 자동 동기화됩니다.

---

## 폴더 구조

```
alien-nest/
├── index.html          ← 메인 앱 (여기에 Supabase 키 입력)
├── SETUP.md            ← 이 가이드
└── backend/
    └── schema.sql      ← Supabase SQL Editor에서 실행
```

---

## 자주 발생하는 문제

| 문제 | 해결 방법 |
|------|----------|
| 동기화 안 돼요 | index.html의 SUPABASE_URL, SUPABASE_ANON_KEY 확인 |
| 빨간 점이 떠요 | Supabase 프로젝트가 일시 정지됐을 수 있음 (무료 플랜은 비활성 시 정지) |
| 데이터가 사라졌어요 | Supabase Table Editor → data_store 테이블에서 직접 확인 |
| CORS 오류가 나요 | Supabase 설정 → API → Allowed origins에 Vercel URL 추가 |

---

## 완료 체크리스트

- [ ] Supabase 프로젝트 생성
- [ ] schema.sql 실행 (data_store 테이블 생성 확인)
- [ ] index.html에 SUPABASE_URL, SUPABASE_ANON_KEY 입력
- [ ] Vercel 배포 완료
- [ ] 사이드바 하단에 🟢 초록 점 확인
- [ ] 모바일에서 접속 확인

모든 체크리스트를 완료하면 ✦ Alien Nest를 어디서든 사용할 수 있습니다!
