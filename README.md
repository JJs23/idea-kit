# 🚀 IdeaKit

> Spec-Driven Development for Creative Ideas - 1인 유니콘을 꿈꾸는 크리에이터를 위한 아이디어 개발 도구

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/JJs23/idea-kit?style=social)](https://github.com/JJs23/idea-kit/stargazers)

IdeaKit은 GitHub의 [Spec Kit](https://github.com/github/spec-kit)에서 영감을 받아, **아이디어 개발과 기획에 특화된 도구**입니다. 새로운 아이디어를 체계적으로 확장하고, 냉철하게 검토하며, 구조화된 기획서로 발전시킬 수 있습니다.

## ✨ 특징

- 🎯 **Cursor AI 통합**: 맞춤형 슬래시 명령어로 자연스러운 아이디어 개발
- 🎭 **페르소나 스위칭**: 창의적 파트너 ↔ 현실적 멘토 모드 전환
- 🏗️ **구조화된 워크플로우**: Spark → Expand → Reality-check → Blueprint
- 📁 **체계적 관리**: 아이디어 상태별 자동 파일 정리
- 🦄 **1인 개발 최적화**: 혼자서도 6개월 내 MVP 구현 가능성 중심 평가

## 🚀 빠른 시작

### 원클릭 설치
```bash
curl -sSL https://raw.githubusercontent.com/JJs23/idea-kit/main/install.sh | bash
```

### 수동 설치
```bash
git clone https://github.com/JJs23/idea-kit.git
cd idea-kit
./install.sh
```

설치 후 Cursor에서 프로젝트를 열고 바로 시작하세요:
```
@spark 반려동물과 함께하는 AR 운동 게임 아이디어
```

## 🔄 워크플로우

### 1. 🌱 아이디어 포착 (`@spark`)
```
@spark 음성으로 조작하는 요리 게임 앱
```
- 아이디어를 즉시 캡처하고 초기 평가
- `ideas/` 폴더에 `idea-seed.md` 파일 생성
- Constitution 기준으로 1차 점수 매기기

### 2. 🎨 창의적 확장 (`@expand`)
**페르소나: 열정적인 창의 파트너**
```
@expand
```
- 다양한 도메인과 크로스오버 아이디어 제시
- "음성 + 요리 + 게임 + 소셜 + AR" 등 조합 탐색
- 재미 요소 극대화 방향 제안

### 3. 🔍 현실 체크 (`@reality-check`)
**페르소나: 경험 많은 현실적 멘토**
```
@reality-check
```
- 1인 개발 기준 실현 가능성 분석
- 기술적 난이도, 시장성, 수익화 모델 검토
- 리스크와 대안 제시

### 4. 📋 기획서 작성 (`@blueprint`)
**페르소나: 체계적인 설계 전문가**
```
@blueprint
```
- 실행 가능한 프로젝트 제안서 생성
- 기술 스택, 로드맵, 비즈니스 모델 포함
- 6개월 MVP 계획 수립

## 📁 프로젝트 구조

```
my-ideas/
├── .cursor/
│   └── instructions.md          # Cursor AI 설정
├── .ideakit/
│   ├── constitution.md          # 개인 철학과 평가 기준
│   ├── prompts/                 # 명령어별 프롬프트
│   └── templates/               # 파일 템플릿
├── ideas/
│   ├── active/                  # 진행 중인 아이디어
│   ├── archive/                 # 보류/완료된 아이디어
│   └── implemented/             # 실제 구현한 프로젝트
├── prototypes/                  # 코드 실험
└── research/                    # 시장 조사 자료
```

## 🎯 Constitution (아이디어 헌법)

IdeaKit의 핵심은 **개인화된 Constitution**입니다:

```markdown
## 핵심 철학
- 재미가 최우선: 만드는 과정도, 사용하는 과정도 즐거워야 함
- 크로스 도메인 혁신: 전혀 다른 분야를 연결해서 새로운 가치 창출
- 1인 실행력: 혼자서도 MVP까지는 반드시 구현 가능해야 함
- 독창성 추구: "이미 있어"보다는 "어떻게 다르게 만들까?"

## 평가 기준 (우선순위)
1. 재미 지수 (10점): 사용자와 개발자 모두의 즐거움
2. 차별화 (9점): 기존 것과 명확히 구분되는 포인트
3. 실현성 (8점): 1인 개발자 기준 6개월 내 MVP 가능
4. 수익화 (7점): 명확한 비즈니스 모델 존재
5. 확장성 (6점): 향후 기능/시장 확장 가능성
```

이 Constitution은 모든 AI 상호작용의 기준이 되며, 개인 취향에 맞게 수정 가능합니다.

## 💡 사용 예시

### 실제 아이디어 개발 과정

```
사용자: @spark 음성으로 레시피를 알려주는 AR 요리 도우미

AI (Spark): 🌟 흥미로운 아이디어네요!
초기 평가: 재미 지수 8/10, 차별화 7/10, 실현성 6/10
질문: 주요 타겟은 요리 초보자인가요? AR 없이도 작동해야 할까요?

사용자: @expand

AI (Creative Partner): 와! 이거 완전 재미있겠는데요! 
🎨 몇 가지 크로스오버 아이디어:
1. 음성 + 요리 + 게임 = "요리 배틀 음성 RPG"
2. AR + 요리 + 소셜 = "친구와 함께하는 가상 요리 클래스"
3. 음성 + 요리 + AI = "AI 요리사가 실시간 코칭"

사용자: @reality-check

AI (Critical Mentor): 솔직히 말하면 몇 가지 현실적 문제가 있어요:
⚠️ AR 개발 복잡도가 1인 개발에는 과도할 수 있음
⚠️ 음성 인식의 요리 환경 노이즈 문제  
⚠️ 기존 요리 앱 대비 명확한 차별점 필요
💡 대안: AR 대신 화면 기반 UI로 시작하는 게 어떨까요?

사용자: @blueprint

AI (Blueprint Architect): 검증된 아이디어를 바탕으로 실행 계획을 만들어드릴게요:
📋 프로젝트명: VoiceChef - 음성 요리 도우미
🎯 MVP (3개월): 음성 명령으로 레시피 단계별 안내
⚙️ 기술스택: React Native + 음성인식 API + Firebase
💰 수익모델: 프리미엄 레시피 구독 ($4.99/월)
📈 로드맵: MVP → 음성학습 → AR 기능 → 소셜 기능
```

## 🛠️ 커스터마이징

### Constitution 수정
`.ideakit/constitution.md`를 편집해서 개인 가치관을 반영하세요:
- 선호하는 기술 스택
- 평가 기준 가중치
- 회피하고 싶은 분야

### 새 명령어 추가
`.cursor/instructions.md`에서 새로운 `@command` 정의 가능:
```markdown
### @validate
시장 검증을 위한 간단한 설문이나 인터뷰 질문 생성
```

## 📊 아이디어 관리

### 상태별 분류
```bash
# 진행 중인 아이디어 보기
ls ideas/active/

# 완료된 아이디어 아카이브
mv ideas/active/great-idea.md ideas/implemented/

# 아이디어 통계
find ideas/ -name "*.md" | wc -l
```

### 검색과 분석
```bash
# 키워드 검색
grep -r "게임" ideas/

# 높은 점수 아이디어 찾기
grep -r "재미 지수.*[8-9]/10" ideas/
```

## 🤝 기여하기

아이디어나 개선사항이 있으시면 언제든 기여해주세요!

1. Fork this repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 참조하세요.

## 🙏 영감

- [GitHub Spec Kit](https://github.com/github/spec-kit) - Spec-Driven Development의 원조
- 모든 1인 개발자들의 창의적 여정

---

**"아이디어는 많지만 정리가 안 된다"는 모든 크리에이터들을 위해 만들어졌습니다. 함께 1인 유니콘의 꿈을 실현해봐요! 🦄**

⭐ 유용하다면 Star를 눌러주세요!