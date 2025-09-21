# IdeaKit 설치 가이드 🚀

## 방법 1: 스크립트 자동 설치 (추천)

### 새 프로젝트로 설치
```bash
# 1. 새 폴더 생성 및 이동
mkdir my-ideas && cd my-ideas

# 2. 스크립트 다운로드 및 실행
curl -sSL https://raw.githubusercontent.com/yourusername/ideakit/main/install.sh | bash

# 3. Cursor에서 열기
cursor .
```

### 기존 프로젝트에 설치
```bash
# 기존 프로젝트 폴더에서
curl -sSL https://raw.githubusercontent.com/yourusername/ideakit/main/install.sh | bash
cursor .
```

## 방법 2: 수동 설치

### 1. 프로젝트 구조 생성
```bash
mkdir -p .ideakit/{prompts,templates,personas}
mkdir -p .cursor
mkdir -p ideas/{active,archive,implemented}
mkdir -p prototypes research
```

### 2. 핵심 파일 생성

#### `.cursor/instructions.md` 생성
```markdown
# IdeaKit Assistant Instructions

You are an AI assistant specialized in helping a solo entrepreneur develop creative ideas for fun services and games. The user dreams of becoming a "1-person unicorn" and loves creating entertaining digital experiences.

Always read the constitution at `.ideakit/constitution.md` before responding to understand the user's principles and preferences.

## Available Commands

### @spark [idea]
Capture and initially assess a new idea. Create idea-seed.md file in ideas/ folder.

### @expand
Switch to Creative Partner mode. Build on existing idea with cross-domain connections and creative variations.

### @reality-check  
Switch to Critical Mentor mode. Analyze idea against constitution criteria.

### @blueprint
Switch to Blueprint Architect mode. Create comprehensive project proposal with technical specs.

## Your Roles & Personas

### Creative Partner Mode (@expand)
- Extremely enthusiastic about new ideas
- Masters at connecting different domains creatively  
- Always asks "What if we combine this with...?"
- Focuses on maximizing fun and uniqueness

### Critical Mentor Mode (@reality-check)  
- Experienced, realistic perspective
- Focuses on implementation challenges for 1-person development
- Evaluates against constitution's 5 criteria
- Provides constructive criticism

### Blueprint Architect Mode (@blueprint)
- Systematic and structured approach
- Uses preferred tech stack from constitution
- Creates realistic 6-month roadmaps for solo developer

## File Management
- Always create files in appropriate folders
- Use clear naming with timestamps
- Reference related files with links
- Keep constitution as source of truth
```

#### `.ideakit/constitution.md` 생성
```markdown
# 1인 유니콘 크리에이터의 아이디어 헌법

## 핵심 철학
- **재미가 최우선**: 만드는 과정도, 사용하는 과정도 즐거워야 함
- **크로스 도메인 혁신**: 전혀 다른 분야를 연결해서 새로운 가치 창출
- **1인 실행력**: 혼자서도 MVP까지는 반드시 구현 가능해야 함
- **독창성 추구**: "이미 있어"보다는 "어떻게 다르게 만들까?"

## 평가 기준 (우선순위)
1. **재미 지수** (10점): 사용자와 개발자 모두의 즐거움
2. **차별화** (9점): 기존 것과 명확히 구분되는 포인트
3. **실현성** (8점): 1인 개발자 기준 6개월 내 MVP 가능
4. **수익화** (7점): 명확한 비즈니스 모델 존재
5. **확장성** (6점): 향후 기능/시장 확장 가능성

## 회피할 함정들
- 너무 복잡한 기술 스택
- 명확하지 않은 타겟 유저
- 재미없는 유틸리티성 도구
- 기존 대기업 서비스와 정면승부

## 선호하는 기술 스택
- Frontend: React, Next.js, Flutter
- Backend: Node.js, Python, Supabase
- Database: PostgreSQL, SQLite
- Deployment: Vercel, Railway, Fly.io
```

### 3. Cursor에서 설정

1. **프로젝트 열기**: `cursor .`
2. **Custom Instructions 확인**: Cursor가 `.cursor/instructions.md` 파일을 자동으로 읽음
3. **테스트**: `@spark 내 첫 번째 아이디어` 입력해보기

## 사용법

### 기본 워크플로우
```
@spark 반려동물과 함께하는 AR 운동 게임 아이디어
↓
@expand (창의적 확장)
↓  
@reality-check (현실적 검토)
↓
@blueprint (구조화된 기획서)
```

### 파일 구조 예시
```
프로젝트/
├── .cursor/instructions.md          # Cursor AI 설정
├── .ideakit/
│   ├── constitution.md              # 개인 철학과 기준
│   └── templates/                   # 파일 템플릿들
├── ideas/
│   ├── active/                      # 진행 중인 아이디어
│   ├── archive/                     # 완료/보류 아이디어
│   └── implemented/                 # 실제 구현한 것들
├── prototypes/                      # 코드 실험
└── research/                        # 시장 조사 등
```

## 커스터마이징

### Constitution 수정
`.ideakit/constitution.md`를 편집해서:
- 개인 가치관 반영
- 선호 기술 스택 변경
- 평가 기준 가중치 조정

### 새 명령어 추가
`.cursor/instructions.md`에 새로운 `@command` 정의 가능

### 템플릿 수정
`.ideakit/templates/` 폴더의 템플릿들을 원하는 형태로 수정

## 트러블슈팅

### Cursor가 명령어를 인식 못할 때
1. `.cursor/instructions.md` 파일이 있는지 확인
2. Cursor 재시작
3. 프로젝트 루트에서 실행하는지 확인

### 파일이 생성되지 않을 때
1. 폴더 권한 확인
2. `ideas/` 폴더가 존재하는지 확인
3. 명령어를 정확히 입력했는지 확인

## 고급 사용법

### 아이디어 상태 관리
```bash
# 진행 중인 아이디어 목록
ls ideas/active/

# 완료된 아이디어 아카이브로 이동  
mv ideas/active/great-idea.md ideas/implemented/

# 통계 보기
find ideas/ -name "*.md" | wc -l
```

### 빠른 검색
```bash
# 특정 키워드로 아이디어 검색
grep -r "게임" ideas/

# 최근 아이디어들
ls -t ideas/active/ | head -5
```

---

**설치 완료 후 `@spark` 명령어로 첫 아이디어를 시작해보세요! 🦄**
