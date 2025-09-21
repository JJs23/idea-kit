# 🚀 IdeaKit

> Spec-Driven Development for Creative Ideas - A tool for creators dreaming of becoming a 1-person unicorn

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/JJs23/idea-kit?style=social)](https://github.com/JJs23/idea-kit/stargazers)

IdeaKit is inspired by GitHub's [Spec Kit](https://github.com/github/spec-kit) and is a **tool specialized for idea development and planning**. You can systematically expand new ideas, review them critically, and develop them into structured project proposals.

## ✨ Features

- 🎯 **Cursor AI Integration**: Natural idea development with custom slash commands
- 🎭 **Persona Switching**: Switch between Creative Partner ↔ Realistic Mentor modes
- 🏗️ **Structured Workflow**: Spark → Expand → Reality-check → Blueprint
- 📁 **Systematic Management**: Automatic file organization by idea status
- 🦄 **Solo Development Optimized**: Evaluation focused on MVP implementation within 6 months by one person

## 🚀 Quick Start

### One-Click Installation (All Platforms)
```bash
curl -sSL https://raw.githubusercontent.com/JJs23/idea-kit/main/install.py | python3
```

### Manual Installation
```bash
git clone https://github.com/JJs23/idea-kit.git
cd idea-kit
python3 install.py
```

After installation, open the project in Cursor and start immediately:
```
@spark AR fitness game with pets idea
```

## 🔄 Workflow

### 1. 🌱 Idea Capture (`@spark`)
```
@spark Voice-controlled cooking game app
```
- Instantly capture ideas and perform initial evaluation
- Create `idea-seed.md` file in `ideas/` folder
- Score based on Constitution criteria

### 2. 🎨 Creative Expansion (`@expand`)
**Persona: Enthusiastic Creative Partner**
```
@expand
```
- Present various domains and crossover ideas
- Explore combinations like "voice + cooking + game + social + AR"
- Suggest ways to maximize fun elements

### 3. 🔍 Reality Check (`@reality-check`)
**Persona: Experienced Realistic Mentor**
```
@reality-check
```
- Analyze feasibility for solo development
- Review technical difficulty, market potential, monetization model
- Present risks and alternatives

### 4. 📋 Blueprint Creation (`@blueprint`)
**Persona: Systematic Design Expert**
```
@blueprint
```
- Generate actionable project proposals
- Include tech stack, roadmap, business model
- Create 6-month MVP plan

## 📁 Project Structure

```
my-ideas/
├── .cursor/
│   └── instructions.md          # Cursor AI configuration
├── .ideakit/
│   ├── constitution.md          # Personal philosophy and evaluation criteria
│   ├── prompts/                 # Command-specific prompts
│   └── templates/               # File templates
├── ideas/
│   ├── active/                  # Ideas in progress
│   ├── archive/                 # Paused/completed ideas
│   └── implemented/             # Actually implemented projects
├── prototypes/                  # Code experiments
└── research/                    # Market research materials
```

## 🎯 Constitution (Idea Charter)

The core of IdeaKit is the **personalized Constitution**:

```markdown
## Core Philosophy
- Fun comes first: Both the creation process and user experience should be enjoyable
- Cross-domain innovation: Create new value by connecting completely different fields
- Solo execution power: Must be implementable to MVP by one person alone
- Pursue originality: Focus on "how to make it different?" rather than "it already exists"

## Evaluation Criteria (Priority)
1. Fun Factor (10 points): Joy for both users and developers
2. Differentiation (9 points): Clear distinction from existing solutions
3. Feasibility (8 points): MVP possible within 6 months for solo developer
4. Monetization (7 points): Clear business model exists
5. Scalability (6 points): Future feature/market expansion potential
```

This Constitution serves as the standard for all AI interactions and can be modified according to personal preferences.

## 💡 Usage Examples

### Real Idea Development Process

```
User: @spark AR cooking assistant that tells recipes by voice

AI (Spark): 🌟 Interesting idea!
Initial assessment: Fun Factor 8/10, Differentiation 7/10, Feasibility 6/10
Question: Is the main target cooking beginners? Should it work without AR?

User: @expand

AI (Creative Partner): Wow! This could be really fun! 
🎨 Some crossover ideas:
1. Voice + Cooking + Game = "Cooking Battle Voice RPG"
2. AR + Cooking + Social = "Virtual cooking class with friends"
3. Voice + Cooking + AI = "AI chef real-time coaching"

User: @reality-check

AI (Critical Mentor): Honestly, there are some realistic issues:
⚠️ AR development complexity might be excessive for solo development
⚠️ Voice recognition noise problems in cooking environment  
⚠️ Need clear differentiation from existing cooking apps
💡 Alternative: How about starting with screen-based UI instead of AR?

User: @blueprint

AI (Blueprint Architect): Based on the validated idea, here's an execution plan:
📋 Project Name: VoiceChef - Voice Cooking Assistant
🎯 MVP (3 months): Voice command step-by-step recipe guidance
⚙️ Tech Stack: React Native + Voice Recognition API + Firebase
💰 Revenue Model: Premium recipe subscription ($4.99/month)
📈 Roadmap: MVP → Voice Learning → AR Features → Social Features
```

## 🛠️ Customization

### Constitution Modification
Edit `.ideakit/constitution.md` to reflect personal values:
- Preferred tech stack
- Evaluation criteria weights
- Fields to avoid

### Adding New Commands
Define new `@command` in `.cursor/instructions.md`:
```markdown
### @validate
Generate simple surveys or interview questions for market validation
```

## 📊 Idea Management

### Status-based Classification
```bash
# View ideas in progress
ls ideas/active/

# Archive completed ideas
mv ideas/active/great-idea.md ideas/implemented/

# Idea statistics
find ideas/ -name "*.md" | wc -l
```

### Search and Analysis
```bash
# Keyword search
grep -r "game" ideas/

# Find high-scoring ideas
grep -r "Fun Factor.*[8-9]/10" ideas/
```

## 🤝 Contributing

Feel free to contribute ideas or improvements anytime!

1. Fork this repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is distributed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🙏 Inspiration

- [GitHub Spec Kit](https://github.com/github/spec-kit) - The originator of Spec-Driven Development
- All solo developers' creative journeys

---

**Created for all creators who say "I have many ideas but can't organize them." Let's realize the dream of becoming a 1-person unicorn together! 🦄**

⭐ Please give us a star if you find it useful!