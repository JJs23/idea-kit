# IdeaKit Installation Guide 🚀

## Method 1: Script Auto-Installation (Recommended)

### Install as New Project
```bash
# 1. Create new folder and navigate
mkdir my-ideas && cd my-ideas

# 2. Download and run script (works on all platforms)
curl -sSL https://raw.githubusercontent.com/JJs23/idea-kit/main/install.py | python3

# 3. Open in Cursor
cursor .
```

### Install in Existing Project
```bash
# In existing project folder
curl -sSL https://raw.githubusercontent.com/JJs23/idea-kit/main/install.py | python3
cursor .
```

## Method 2: Manual Installation

### 1. Create Project Structure
```bash
# Works on all platforms
mkdir -p .ideakit/{prompts,templates,personas}
mkdir -p .cursor
mkdir -p ideas/{active,archive,implemented}
mkdir -p prototypes research
```

### 2. Create Core Files

#### Create `.cursor/instructions.md`
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

#### Create `.ideakit/constitution.md`
```markdown
# 1-Person Unicorn Creator's Idea Constitution

## Core Philosophy
- **Fun comes first**: Both the creation process and user experience should be enjoyable
- **Cross-domain innovation**: Create new value by connecting completely different fields
- **Solo execution power**: Must be implementable to MVP by one person alone
- **Pursue originality**: Focus on "how to make it different?" rather than "it already exists"

## Evaluation Criteria (Priority)
1. **Fun Factor** (10 points): Joy for both users and developers
2. **Differentiation** (9 points): Clear distinction from existing solutions
3. **Feasibility** (8 points): MVP possible within 6 months for solo developer
4. **Monetization** (7 points): Clear business model exists
5. **Scalability** (6 points): Future feature/market expansion potential

## Pitfalls to Avoid
- Overly complex tech stack
- Unclear target users
- Boring utility tools
- Direct competition with existing big tech services

## Preferred Tech Stack
- Frontend: React, Next.js, Flutter
- Backend: Node.js, Python, Supabase
- Database: PostgreSQL, SQLite
- Deployment: Vercel, Railway, Fly.io
```

### 3. Setup in Cursor

1. **Open Project**: `cursor .`
2. **Check Custom Instructions**: Cursor automatically reads `.cursor/instructions.md` file
3. **Test**: Try typing `@spark my first idea`

## Usage

### Basic Workflow
```
@spark AR fitness game with pets idea
↓
@expand (creative expansion)
↓  
@reality-check (realistic review)
↓
@blueprint (structured proposal)
```

### File Structure Example
```
project/
├── .cursor/instructions.md          # Cursor AI configuration
├── .ideakit/
│   ├── constitution.md              # Personal philosophy and criteria
│   └── templates/                   # File templates
├── ideas/
│   ├── active/                      # Ideas in progress
│   ├── archive/                     # Completed/paused ideas
│   └── implemented/                 # Actually implemented projects
├── prototypes/                      # Code experiments
└── research/                        # Market research, etc.
```

## Customization

### Constitution Modification
Edit `.ideakit/constitution.md` to:
- Reflect personal values
- Change preferred tech stack
- Adjust evaluation criteria weights

### Adding New Commands
Define new `@command` in `.cursor/instructions.md`

### Template Modification
Modify templates in `.ideakit/templates/` folder to desired format

## Troubleshooting

### When Cursor doesn't recognize commands
1. Check if `.cursor/instructions.md` file exists
2. Restart Cursor
3. Make sure you're running from project root

### When files aren't created
1. Check folder permissions
2. Verify `ideas/` folder exists
3. Check if commands are typed correctly

## Advanced Usage

### Idea Status Management
```bash
# List ideas in progress
ls ideas/active/

# Move completed ideas to archive  
mv ideas/active/great-idea.md ideas/implemented/

# View statistics
find ideas/ -name "*.md" | wc -l
```

### Quick Search
```bash
# Search ideas by specific keyword
grep -r "game" ideas/

# Recent ideas
ls -t ideas/active/ | head -5
```

---

**After installation, start your first idea with the `@spark` command! 🦄**