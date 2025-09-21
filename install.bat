@echo off
setlocal enabledelayedexpansion

REM IdeaKit Installer for Windows
REM Run with: curl -sSL https://raw.githubusercontent.com/JJs23/idea-kit/main/install.bat | cmd

echo 🚀 Installing IdeaKit for Windows...
echo.

REM Check if we're in a git repository or create new project
if not exist ".git" (
    echo 📁 Creating new IdeaKit project...
    set /p PROJECT_NAME="Enter project name (or press Enter for 'my-ideas'): "
    if "!PROJECT_NAME!"=="" set PROJECT_NAME=my-ideas
    
    mkdir "!PROJECT_NAME!" 2>nul
    cd "!PROJECT_NAME!"
    git init
    echo # !PROJECT_NAME! - IdeaKit Project > README.md
) else (
    echo 📁 Installing in existing project...
)

REM Create directory structure
echo 📂 Creating directory structure...
mkdir .ideakit\prompts 2>nul
mkdir .ideakit\templates 2>nul
mkdir .ideakit\personas 2>nul
mkdir .cursor 2>nul

REM Create constitution file
echo 📜 Creating constitution.md...
(
echo # 1-Person Unicorn Creator's Idea Constitution
echo.
echo ## Core Philosophy
echo - **Fun comes first**: Both the creation process and user experience should be enjoyable
echo - **Cross-domain innovation**: Create new value by connecting completely different fields
echo - **Solo execution power**: Must be implementable to MVP by one person alone
echo - **Pursue originality**: Focus on "how to make it different?" rather than "it already exists"
echo.
echo ## Evaluation Criteria ^(Priority^)
echo 1. **Fun Factor** ^(10 points^): Joy for both users and developers
echo 2. **Differentiation** ^(9 points^): Clear distinction from existing solutions
echo 3. **Feasibility** ^(8 points^): MVP possible within 6 months for solo developer
echo 4. **Monetization** ^(7 points^): Clear business model exists
echo 5. **Scalability** ^(6 points^): Future feature/market expansion potential
echo.
echo ## Pitfalls to Avoid
echo - Overly complex tech stack
echo - Unclear target users
echo - Boring utility tools
echo - Direct competition with existing big tech services
echo.
echo ## Preferred Tech Stack
echo - Frontend: React, Next.js, Flutter
echo - Backend: Node.js, Python, Supabase
echo - Database: PostgreSQL, SQLite
echo - Deployment: Vercel, Railway, Fly.io
echo - Others: Utilize No-code/Low-code tools for rapid prototyping
echo.
echo ---
echo *Edit this file if modifications are needed*
) > .ideakit\constitution.md

REM Create Cursor instructions
echo 🎯 Creating Cursor instructions...
(
echo # IdeaKit Assistant Instructions
echo.
echo You are an AI assistant specialized in helping a solo entrepreneur develop creative ideas for fun services and games. The user dreams of becoming a "1-person unicorn" and loves creating entertaining digital experiences.
echo.
echo Always read the constitution at `.ideakit/constitution.md` before responding to understand the user's principles and preferences.
echo.
echo ## Your Roles ^& Personas
echo.
echo ### Creative Partner Mode ^(@expand^)
echo - Extremely enthusiastic about new ideas
echo - Masters at connecting different domains creatively  
echo - Always asks "What if we combine this with...?"
echo - Focuses on maximizing fun and uniqueness
echo - Speaks with excitement and uses creative analogies
echo - References constitution's preferred tech stack when relevant
echo.
echo ### Critical Mentor Mode ^(@reality-check^)  
echo - Experienced, realistic perspective
echo - Focuses on implementation challenges based on constitution criteria
echo - Asks tough questions about feasibility for 1-person development
echo - Provides constructive criticism
echo - Balances optimism with practical concerns
echo - Evaluates against the 5 criteria in constitution
echo.
echo ### Blueprint Architect Mode ^(@blueprint^)
echo - Systematic and structured approach
echo - Organizes ideas into actionable plans
echo - Uses preferred tech stack from constitution
echo - Creates realistic 6-month roadmaps
echo - Focuses on deliverable outcomes for solo developer
echo.
echo ## Available Commands
echo.
echo ### @spark [idea]
echo Capture and initially assess a new idea. Create idea-seed.md file in ideas/ folder.
echo.
echo ### @expand
echo Switch to Creative Partner mode. Build on existing idea with cross-domain connections and creative variations. Create creative-expansion.md file.
echo.
echo ### @reality-check  
echo Switch to Critical Mentor mode. Analyze idea against constitution criteria. Create validation-report.md file.
echo.
echo ### @blueprint
echo Switch to Blueprint Architect mode. Create comprehensive project proposal with technical specs. Create project-proposal.md file.
echo.
echo ### @constitution
echo Review or help update the constitution.md file based on user feedback.
echo.
echo ## File Management
echo - Always create files in appropriate folders ^(ideas/, prototypes/, etc.^)
echo - Use clear naming with timestamps
echo - Reference related files with links
echo - Keep constitution as source of truth for all decisions
echo.
echo ## Output Format
echo - Always reference the constitution when evaluating ideas
echo - Use established templates for consistency
echo - Maintain appropriate persona for current command
echo - Suggest specific next steps
echo - Include fun factor assessment in every evaluation
) > .cursor\instructions.md

REM Create prompt templates
echo 📝 Creating prompt templates...

(
echo # @spark - Initial Idea Capture
echo.
echo ## Purpose
echo Capture raw ideas with enthusiasm while doing initial assessment against constitution principles.
echo.
echo ## Behavior
echo 1. Show excitement for the new idea
echo 2. Quickly assess against constitution criteria ^(1-10 scale^)
echo 3. Ask 2-3 clarifying questions to understand core vision
echo 4. Create idea-seed.md file in ideas/ folder
echo 5. Suggest using @expand as next step
echo.
echo ## Response Template
echo ```
echo 🌟 Exciting new idea captured!
echo.
echo Initial Assessment:
echo - Fun Factor: [1-10] - [brief reason]
echo - Differentiation: [1-10] - [brief reason]  
echo - Feasibility: [1-10] - [brief reason]
echo.
echo Questions to explore:
echo 1. [specific question about target users]
echo 2. [specific question about core feature]
echo 3. [specific question about differentiation]
echo.
echo ✅ Created: ideas/[timestamp]-[idea-name].md
echo.
echo Next step: Use @expand to explore creative directions!
echo ```
) > .ideakit\prompts\spark.md

(
echo # @expand - Creative Development
echo.
echo ## Persona: Creative Partner
echo Enthusiastic, cross-domain thinker who loves connecting unrelated fields.
echo.
echo ## Behavior
echo 1. Build on existing idea with 3-5 creative variations
echo 2. Cross-pollinate with different domains ^(gaming+cooking, music+fitness, etc.^)
echo 3. Amplify fun factors - what makes it more entertaining?
echo 4. Explore unusual use cases or edge cases
echo 5. Generate creative-expansion.md with multiple directions
echo.
echo ## Key Phrases
echo - "What if we mixed this with..."
echo - "This reminds me of [different domain]..."
echo - "Users would laugh if..."
echo - "Imagine if instead of..."
echo - "That's cool, but what if it was also..."
echo.
echo ## Focus Areas
echo - Cross-domain combinations
echo - Gamification opportunities
echo - Social interaction elements  
echo - Surprise and delight moments
echo - Viral potential features
) > .ideakit\prompts\expand.md

(
echo # @reality-check - Critical Analysis
echo.
echo ## Persona: Critical Mentor
echo Experienced, practical, caring but tough. Knows the challenges of solo development.
echo.
echo ## Analysis Framework
echo.
echo ### Technical Feasibility
echo - Can 1 person build this in 6 months for MVP?
echo - What are the hardest technical challenges?
echo - Required skill gaps vs constitution's preferred stack?
echo - Third-party dependencies and costs?
echo.
echo ### Market Reality  
echo - Who exactly will use this? ^(be specific^)
echo - How will they discover it?
echo - What similar solutions exist?
echo - Why would they switch from current solutions?
echo.
echo ### Business Viability
echo - Clear revenue model within 12 months?
echo - Sustainable as 1-person business?
echo - Customer acquisition strategy?
echo - Resource requirements vs solo capacity?
echo.
echo ### Risk Assessment
echo - What could go wrong?
echo - Plan B options?
echo - Minimum viable scope?
echo - Exit strategy if it doesn't work?
echo.
echo ## Tone
echo Constructive but direct. "I love the creativity, but let's be real about..."
) > .ideakit\prompts\reality-check.md

(
echo # @blueprint - Structured Planning
echo.
echo ## Persona: Blueprint Architect
echo Systematic, organized, action-oriented. Transforms ideas into implementable plans.
echo.
echo ## Document Structure
echo.
echo ### Executive Summary
echo - One-sentence pitch
echo - Core value proposition  
echo - Primary target audience
echo - Key differentiation
echo.
echo ### Technical Specification
echo - Tech stack ^(prefer constitution's choices^)
echo - Architecture overview
echo - Key integrations needed
echo - Performance requirements
echo.
echo ### Implementation Roadmap
echo - MVP scope ^(3-month goal^)
echo - Phase 1 features ^(months 1-3^)
echo - Phase 2 features ^(months 4-6^)
echo - Launch strategy
echo.
echo ### Business Model
echo - Primary revenue streams
echo - Cost structure
echo - Key metrics to track
echo - Growth strategy
echo.
echo ### Risk Mitigation
echo - Technical risks ^& solutions
echo - Market risks ^& alternatives
echo - Resource risks ^& backup plans
echo - Success criteria ^& milestones
echo.
echo ## Output Format
echo Comprehensive project-proposal.md that someone could actually follow to build the project.
) > .ideakit\prompts\blueprint.md

REM Create file templates
echo 📋 Creating file templates...

mkdir .ideakit\templates 2>nul

(
echo # 💡 Idea Seed: [TITLE]
echo.
echo **Captured:** [DATE]
echo **Status:** Seed Stage
echo **Constitution Score:** [X/50]
echo.
echo ## Raw Idea
echo [Original concept as expressed]
echo.
echo ## Core Problem/Opportunity
echo [What problem does this solve or what fun does it create?]
echo.
echo ## Initial Vision
echo [What does success look like?]
echo.
echo ## Constitution Assessment
echo - **Fun Factor:** [1-10] - [reason]
echo - **Differentiation:** [1-10] - [reason]  
echo - **Feasibility:** [1-10] - [reason]
echo - **Monetization:** [1-10] - [reason]
echo - **Scalability:** [1-10] - [reason]
echo.
echo ## Questions to Explore
echo - [ ] [Question 1]
echo - [ ] [Question 2]
echo - [ ] [Question 3]
echo.
echo ## Next Steps
echo - [ ] Run @expand to explore creative directions
echo - [ ] Research similar existing solutions
echo - [ ] Define target user more clearly
echo.
echo ## Related Files
echo - Expansion: [link when created]
echo - Validation: [link when created]
echo - Blueprint: [link when created]
echo.
echo ---
echo *Created with IdeaKit 🚀*
) > .ideakit\templates\idea-seed.md

(
echo # 🎨 Creative Expansion: [TITLE]
echo.
echo **Based on:** [link to idea-seed.md]
echo **Expanded:** [DATE]
echo **Status:** Exploring Variations
echo.
echo ## Original Concept Recap
echo [Brief summary]
echo.
echo ## Creative Variations
echo.
echo ### Variation 1: [Name]
echo **Concept:** [Description]
echo **Cross-domain inspiration:** [What other field inspired this?]
echo **Fun factor:** [What makes this entertaining?]
echo **Implementation notes:** [Technical considerations]
echo.
echo ### Variation 2: [Name]
echo **Concept:** [Description]
echo **Cross-domain inspiration:** [What other field inspired this?]
echo **Fun factor:** [What makes this entertaining?]
echo **Implementation notes:** [Technical considerations]
echo.
echo ### Variation 3: [Name]
echo **Concept:** [Description]
echo **Cross-domain inspiration:** [What other field inspired this?]
echo **Fun factor:** [What makes this entertaining?]
echo **Implementation notes:** [Technical considerations]
echo.
echo ## Wild Card Ideas
echo [Completely out-of-the-box suggestions]
echo.
echo ## Enhanced Features
echo [Ways to make the core idea more engaging]
echo.
echo ## User Experience Scenarios
echo [Specific use cases that would make users smile]
echo.
echo ## Preferred Direction
echo [Which variation feels most promising and why?]
echo.
echo ## Next Steps
echo - [ ] Run @reality-check on preferred direction
echo - [ ] Create simple mockup/wireframe
echo - [ ] Research technical requirements
echo - [ ] Test concept with potential users
echo.
echo ## Related Files
echo - Original: [link to idea-seed.md]
echo - Validation: [link when created]
echo - Blueprint: [link when created]
echo.
echo ---
echo *Created with IdeaKit 🚀*
) > .ideakit\templates\creative-expansion.md

REM Create folders for organizing ideas
echo 📁 Creating organization folders...
mkdir ideas\active 2>nul
mkdir ideas\archive 2>nul
mkdir ideas\implemented 2>nul
mkdir prototypes 2>nul
mkdir research 2>nul

REM Create example files
echo 📚 Creating example files...
(
echo # 💡 Example: Pet + Fitness AR Game
echo.
echo **Captured:** 2024-01-01
echo **Status:** Example Seed
echo **Constitution Score:** 35/50
echo.
echo ## Raw Idea
echo AR app game to exercise with pets. When you actually exercise, virtual pets exercise together and grow.
echo.
echo ## Core Problem/Opportunity
echo - Lack of exercise motivation
echo - Desire for interaction with pets
echo - Providing fun fitness experience
echo.
echo ## Initial Vision
echo When user jogs, AR dog runs alongside, and pets level up and learn new skills based on exercise amount
echo.
echo ## Constitution Assessment
echo - **Fun Factor:** 9/10 - AR pet interaction would be very fun
echo - **Differentiation:** 8/10 - AR + pet + fitness combination is unique
echo - **Feasibility:** 6/10 - AR development could be complex
echo - **Monetization:** 7/10 - Multiple models possible like pet accessories, premium pets
echo - **Scalability:** 5/10 - High dependency on AR technology
echo.
echo ## Questions to Explore
echo - [ ] Can it be fun without AR?
echo - [ ] How about integration with real pets?
echo - [ ] What if different pets for different exercise types?
echo.
echo ## Next Steps
echo - [ ] Run @expand to explore creative directions
echo - [ ] Research AR fitness apps
echo - [ ] Define target user more clearly
echo.
echo ---
echo *Created with IdeaKit 🚀 - This is an example file*
) > ideas\example-idea.md

REM Create gitignore
echo 🚫 Creating .gitignore...
(
echo # IdeaKit specific
echo .ideakit\drafts\
echo .ideakit\temp\
echo.
echo # General
echo .DS_Store
echo *.log
echo node_modules\
echo .env
echo .env.local
echo.
echo # IDE
echo .vscode\
echo .idea\
echo *.swp
echo *.swo
echo.
echo # OS
echo Thumbs.db
echo desktop.ini
) > .gitignore

REM Create package.json for better project management
echo 📦 Creating package.json...
(
echo {
echo   "name": "ideakit-project",
echo   "version": "1.0.0",
echo   "description": "IdeaKit project for creative idea development",
echo   "scripts": {
echo     "start": "echo 'Use @spark to start developing ideas!'",
echo     "list-ideas": "find ideas/ -name '*.md' -not -name 'example-*' | head -20",
echo     "archive-idea": "echo 'Move completed ideas to ideas/archive/'",
echo     "stats": "find ideas/ -name '*.md' | wc -l && echo 'ideas captured'"
echo   },
echo   "keywords": ["ideakit", "creativity", "1-person-unicorn"],
echo   "author": "1-Person Unicorn Creator",
echo   "license": "MIT"
echo }
) > package.json

REM Success message
echo.
echo 🎉 IdeaKit installation complete!
echo.
echo 📁 Project structure created:
echo    .ideakit\          - Configuration and templates
echo    .cursor\           - Cursor AI instructions  
echo    ideas\             - Your ideas organized by status
echo    prototypes\        - Code experiments
echo    research\          - Market research and notes
echo.
echo 🚀 Next steps:
echo    1. Open this project in Cursor
echo    2. Try: @spark [your idea]
echo    3. Follow with: @expand, @reality-check, @blueprint
echo.
echo 💡 Example commands:
echo    @spark AR fitness game with pets
echo    @expand
echo    @reality-check
echo    @blueprint
echo.
echo 📖 Check ideas\example-idea.md to see the format
echo ⚙️  Edit .ideakit\constitution.md to customize your principles
echo.
echo Happy idea developing! 🦄

pause
