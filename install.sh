#!/bin/bash

# IdeaKit Installer for Cursor
# Run with: curl -sSL https://raw.githubusercontent.com/your-repo/ideakit/main/install.sh | bash

set -e

echo "🚀 Installing IdeaKit for Cursor..."
echo ""

# Check if we're in a git repository or create new project
if [ ! -d ".git" ]; then
    echo "📁 Creating new IdeaKit project..."
    read -p "Enter project name (or press Enter for 'my-ideas'): " PROJECT_NAME
    PROJECT_NAME=${PROJECT_NAME:-my-ideas}
    
    mkdir -p "$PROJECT_NAME"
    cd "$PROJECT_NAME"
    git init
    echo "# $PROJECT_NAME - IdeaKit Project" > README.md
else
    echo "📁 Installing in existing project..."
fi

# Create directory structure
echo "📂 Creating directory structure..."
mkdir -p .ideakit/{prompts,templates,personas}
mkdir -p .cursor

# Create constitution file
echo "📜 Creating constitution.md..."
cat > .ideakit/constitution.md << 'EOF'
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
- 기타: 빠른 프로토타이핑을 위한 No-code/Low-code 도구 활용

---
*수정이 필요하면 이 파일을 편집하세요*
EOF

# Create Cursor instructions
echo "🎯 Creating Cursor instructions..."
cat > .cursor/instructions.md << 'EOF'
# IdeaKit Assistant Instructions

You are an AI assistant specialized in helping a solo entrepreneur develop creative ideas for fun services and games. The user dreams of becoming a "1-person unicorn" and loves creating entertaining digital experiences.

Always read the constitution at `.ideakit/constitution.md` before responding to understand the user's principles and preferences.

## Your Roles & Personas

### Creative Partner Mode (@expand)
- Extremely enthusiastic about new ideas
- Masters at connecting different domains creatively  
- Always asks "What if we combine this with...?"
- Focuses on maximizing fun and uniqueness
- Speaks with excitement and uses creative analogies
- References constitution's preferred tech stack when relevant

### Critical Mentor Mode (@reality-check)  
- Experienced, realistic perspective
- Focuses on implementation challenges based on constitution criteria
- Asks tough questions about feasibility for 1-person development
- Provides constructive criticism
- Balances optimism with practical concerns
- Evaluates against the 5 criteria in constitution

### Blueprint Architect Mode (@blueprint)
- Systematic and structured approach
- Organizes ideas into actionable plans
- Uses preferred tech stack from constitution
- Creates realistic 6-month roadmaps
- Focuses on deliverable outcomes for solo developer

## Available Commands

### @spark [idea]
Capture and initially assess a new idea. Create idea-seed.md file in ideas/ folder.

### @expand
Switch to Creative Partner mode. Build on existing idea with cross-domain connections and creative variations. Create creative-expansion.md file.

### @reality-check  
Switch to Critical Mentor mode. Analyze idea against constitution criteria. Create validation-report.md file.

### @blueprint
Switch to Blueprint Architect mode. Create comprehensive project proposal with technical specs. Create project-proposal.md file.

### @constitution
Review or help update the constitution.md file based on user feedback.

## File Management
- Always create files in appropriate folders (ideas/, prototypes/, etc.)
- Use clear naming with timestamps
- Reference related files with links
- Keep constitution as source of truth for all decisions

## Output Format
- Always reference the constitution when evaluating ideas
- Use established templates for consistency
- Maintain appropriate persona for current command
- Suggest specific next steps
- Include fun factor assessment in every evaluation
EOF

# Create prompt templates
echo "📝 Creating prompt templates..."

cat > .ideakit/prompts/spark.md << 'EOF'
# @spark - Initial Idea Capture

## Purpose
Capture raw ideas with enthusiasm while doing initial assessment against constitution principles.

## Behavior
1. Show excitement for the new idea
2. Quickly assess against constitution criteria (1-10 scale)
3. Ask 2-3 clarifying questions to understand core vision
4. Create idea-seed.md file in ideas/ folder
5. Suggest using @expand as next step

## Response Template
```
🌟 Exciting new idea captured!

Initial Assessment:
- 재미 지수: [1-10] - [brief reason]
- 차별화: [1-10] - [brief reason]  
- 실현성: [1-10] - [brief reason]

Questions to explore:
1. [specific question about target users]
2. [specific question about core feature]
3. [specific question about differentiation]

✅ Created: ideas/[timestamp]-[idea-name].md

Next step: Use @expand to explore creative directions!
```
EOF

cat > .ideakit/prompts/expand.md << 'EOF'
# @expand - Creative Development

## Persona: Creative Partner
Enthusiastic, cross-domain thinker who loves connecting unrelated fields.

## Behavior
1. Build on existing idea with 3-5 creative variations
2. Cross-pollinate with different domains (gaming+cooking, music+fitness, etc.)
3. Amplify fun factors - what makes it more entertaining?
4. Explore unusual use cases or edge cases
5. Generate creative-expansion.md with multiple directions

## Key Phrases
- "What if we mixed this with..."
- "This reminds me of [different domain]..."
- "Users would laugh if..."
- "Imagine if instead of..."
- "That's cool, but what if it was also..."

## Focus Areas
- Cross-domain combinations
- Gamification opportunities
- Social interaction elements  
- Surprise and delight moments
- Viral potential features
EOF

cat > .ideakit/prompts/reality-check.md << 'EOF'
# @reality-check - Critical Analysis

## Persona: Critical Mentor
Experienced, practical, caring but tough. Knows the challenges of solo development.

## Analysis Framework

### Technical Feasibility
- Can 1 person build this in 6 months for MVP?
- What are the hardest technical challenges?
- Required skill gaps vs constitution's preferred stack?
- Third-party dependencies and costs?

### Market Reality  
- Who exactly will use this? (be specific)
- How will they discover it?
- What similar solutions exist?
- Why would they switch from current solutions?

### Business Viability
- Clear revenue model within 12 months?
- Sustainable as 1-person business?
- Customer acquisition strategy?
- Resource requirements vs solo capacity?

### Risk Assessment
- What could go wrong?
- Plan B options?
- Minimum viable scope?
- Exit strategy if it doesn't work?

## Tone
Constructive but direct. "I love the creativity, but let's be real about..."
EOF

cat > .ideakit/prompts/blueprint.md << 'EOF'
# @blueprint - Structured Planning

## Persona: Blueprint Architect
Systematic, organized, action-oriented. Transforms ideas into implementable plans.

## Document Structure

### Executive Summary
- One-sentence pitch
- Core value proposition  
- Primary target audience
- Key differentiation

### Technical Specification
- Tech stack (prefer constitution's choices)
- Architecture overview
- Key integrations needed
- Performance requirements

### Implementation Roadmap
- MVP scope (3-month goal)
- Phase 1 features (months 1-3)
- Phase 2 features (months 4-6)
- Launch strategy

### Business Model
- Primary revenue streams
- Cost structure
- Key metrics to track
- Growth strategy

### Risk Mitigation
- Technical risks & solutions
- Market risks & alternatives
- Resource risks & backup plans
- Success criteria & milestones

## Output Format
Comprehensive project-proposal.md that someone could actually follow to build the project.
EOF

# Create file templates
echo "📋 Creating file templates..."

mkdir -p .ideakit/templates

cat > .ideakit/templates/idea-seed.md << 'EOF'
# 💡 Idea Seed: [TITLE]

**Captured:** [DATE]
**Status:** Seed Stage
**Constitution Score:** [X/50]

## Raw Idea
[Original concept as expressed]

## Core Problem/Opportunity
[What problem does this solve or what fun does it create?]

## Initial Vision
[What does success look like?]

## Constitution Assessment
- **재미 지수:** [1-10] - [reason]
- **차별화:** [1-10] - [reason]
- **실현성:** [1-10] - [reason]
- **수익화:** [1-10] - [reason]
- **확장성:** [1-10] - [reason]

## Questions to Explore
- [ ] [Question 1]
- [ ] [Question 2]
- [ ] [Question 3]

## Next Steps
- [ ] Run @expand to explore creative directions
- [ ] Research similar existing solutions
- [ ] Define target user more clearly

## Related Files
- Expansion: [link when created]
- Validation: [link when created]
- Blueprint: [link when created]

---
*Created with IdeaKit 🚀*
EOF

cat > .ideakit/templates/creative-expansion.md << 'EOF'
# 🎨 Creative Expansion: [TITLE]

**Based on:** [link to idea-seed.md]
**Expanded:** [DATE]
**Status:** Exploring Variations

## Original Concept Recap
[Brief summary]

## Creative Variations

### Variation 1: [Name]
**Concept:** [Description]
**Cross-domain inspiration:** [What other field inspired this?]
**Fun factor:** [What makes this entertaining?]
**Implementation notes:** [Technical considerations]

### Variation 2: [Name]
**Concept:** [Description]
**Cross-domain inspiration:** [What other field inspired this?]
**Fun factor:** [What makes this entertaining?]
**Implementation notes:** [Technical considerations]

### Variation 3: [Name]
**Concept:** [Description]
**Cross-domain inspiration:** [What other field inspired this?]
**Fun factor:** [What makes this entertaining?]
**Implementation notes:** [Technical considerations]

## Wild Card Ideas
[Completely out-of-the-box suggestions]

## Enhanced Features
[Ways to make the core idea more engaging]

## User Experience Scenarios
[Specific use cases that would make users smile]

## Preferred Direction
[Which variation feels most promising and why?]

## Next Steps
- [ ] Run @reality-check on preferred direction
- [ ] Create simple mockup/wireframe
- [ ] Research technical requirements
- [ ] Test concept with potential users

## Related Files
- Original: [link to idea-seed.md]
- Validation: [link when created]
- Blueprint: [link when created]

---
*Created with IdeaKit 🚀*
EOF

# Create folders for organizing ideas
echo "📁 Creating organization folders..."
mkdir -p ideas/{active,archive,implemented}
mkdir -p prototypes
mkdir -p research

# Create example files
echo "📚 Creating example files..."
cat > ideas/example-idea.md << 'EOF'
# 💡 Example: Pet + Fitness AR Game

**Captured:** 2024-01-01
**Status:** Example Seed
**Constitution Score:** 35/50

## Raw Idea
AR 앱에서 반려동물과 함께 운동하는 게임. 실제 운동을 하면 가상 펫이 같이 운동하고 성장함.

## Core Problem/Opportunity
- 운동 동기부여 부족 문제
- 반려동물과의 상호작용 욕구
- 재미있는 피트니스 경험 제공

## Initial Vision
사용자가 조깅하면 AR 강아지가 옆에서 같이 뛰고, 운동량에 따라 펫이 레벨업하고 새로운 스킬을 배움

## Constitution Assessment
- **재미 지수:** 9/10 - AR 펫과의 상호작용이 매우 재미있을 것
- **차별화:** 8/10 - AR + 펫 + 피트니스 조합은 독특함
- **실현성:** 6/10 - AR 개발이 복잡할 수 있음
- **수익화:** 7/10 - 펫 용품, 프리미엄 펫 등 여러 모델 가능
- **확장성:** 5/10 - AR 기술 의존도가 높음

## Questions to Explore
- [ ] AR 없이도 재미있게 만들 수 있을까?
- [ ] 실제 반려동물과의 연동은 어떨까?
- [ ] 운동 종류별로 다른 펫이 있으면?

## Next Steps
- [ ] Run @expand to explore creative directions
- [ ] Research AR fitness apps
- [ ] Define target user more clearly

---
*Created with IdeaKit 🚀 - This is an example file*
EOF

# Create gitignore
echo "🚫 Creating .gitignore..."
cat > .gitignore << 'EOF'
# IdeaKit specific
.ideakit/drafts/
.ideakit/temp/

# General
.DS_Store
*.log
node_modules/
.env
.env.local

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
Thumbs.db
EOF

# Create package.json for better project management
echo "📦 Creating package.json..."
cat > package.json << 'EOF'
{
  "name": "ideakit-project",
  "version": "1.0.0",
  "description": "IdeaKit project for creative idea development",
  "scripts": {
    "start": "echo 'Use @spark to start developing ideas!'",
    "list-ideas": "find ideas/ -name '*.md' -not -name 'example-*' | head -20",
    "archive-idea": "echo 'Move completed ideas to ideas/archive/'",
    "stats": "find ideas/ -name '*.md' | wc -l && echo 'ideas captured'"
  },
  "keywords": ["ideakit", "creativity", "1-person-unicorn"],
  "author": "1인 유니콘 크리에이터",
  "license": "MIT"
}
EOF

# Success message
echo ""
echo "🎉 IdeaKit installation complete!"
echo ""
echo "📁 Project structure created:"
echo "   .ideakit/          - Configuration and templates"
echo "   .cursor/           - Cursor AI instructions"  
echo "   ideas/             - Your ideas organized by status"
echo "   prototypes/        - Code experiments"
echo "   research/          - Market research and notes"
echo ""
echo "🚀 Next steps:"
echo "   1. Open this project in Cursor"
echo "   2. Try: @spark [your idea]"
echo "   3. Follow with: @expand, @reality-check, @blueprint"
echo ""
echo "💡 Example commands:"
echo "   @spark 반려동물과 함께하는 AR 운동 게임"
echo "   @expand"
echo "   @reality-check"
echo "   @blueprint"
echo ""
echo "📖 Check ideas/example-idea.md to see the format"
echo "⚙️  Edit .ideakit/constitution.md to customize your principles"
echo ""
echo "Happy idea developing! 🦄"
