#!/usr/bin/env python3
"""
IdeaKit Universal Installer
Cross-platform installer for IdeaKit - works on Windows, macOS, and Linux
Run with: curl -sSL https://raw.githubusercontent.com/JJs23/idea-kit/main/install.py | python3
"""

import os
import sys
import platform
import subprocess
import shutil
from pathlib import Path
from typing import Optional

def print_status(message: str, emoji: str = "🚀"):
    """Print status message with emoji"""
    print(f"{emoji} {message}")

def print_success(message: str):
    """Print success message"""
    print(f"✅ {message}")

def print_info(message: str):
    """Print info message"""
    print(f"ℹ️  {message}")

def get_os_type() -> str:
    """Get operating system type"""
    return platform.system().lower()

def is_git_repo() -> bool:
    """Check if current directory is a git repository"""
    return os.path.exists('.git')

def run_command(command: str, shell: bool = True) -> bool:
    """Run a command and return success status"""
    try:
        result = subprocess.run(command, shell=shell, capture_output=True, text=True)
        return result.returncode == 0
    except Exception:
        return False

def create_directory(path: str) -> bool:
    """Create directory if it doesn't exist"""
    try:
        Path(path).mkdir(parents=True, exist_ok=True)
        return True
    except Exception:
        return False

def write_file(filepath: str, content: str) -> bool:
    """Write content to file"""
    try:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        return True
    except Exception:
        return False

def get_project_name() -> str:
    """Get project name from user input"""
    try:
        print("📁 Project Setup")
        print("   This will create a new folder for your IdeaKit project.")
        project_name = input("   Enter project name (or press Enter for 'my-ideas'): ").strip()
        return project_name if project_name else "my-ideas"
    except (EOFError, KeyboardInterrupt):
        return "my-ideas"

def create_new_project(project_name: str, skip_git: bool = False) -> bool:
    """Create new project directory and initialize git"""
    try:
        print(f"   Creating project folder: {project_name}")
        
        # Create project directory
        if not create_directory(project_name):
            print(f"   ❌ Failed to create directory: {project_name}")
            return False
        
        # Change to project directory
        os.chdir(project_name)
        print(f"   ✅ Created and moved to: {os.getcwd()}")
        
        # Initialize git (unless skipped)
        if not skip_git and shutil.which('git'):
            print("   🔧 Initializing Git repository...")
            run_command('git init')
            write_file('README.md', f"# {project_name} - IdeaKit Project\n")
            print("   ✅ Git repository initialized")
        elif skip_git:
            print("   ⏭️  Skipping Git initialization (--no-git flag)")
            write_file('README.md', f"# {project_name} - IdeaKit Project\n")
        else:
            print("   ⚠️  Git not found, skipping Git initialization")
            write_file('README.md', f"# {project_name} - IdeaKit Project\n")
        
        return True
    except Exception as e:
        print(f"   ❌ Error creating project: {e}")
        return False

def create_directory_structure():
    """Create the complete directory structure"""
    directories = [
        '.ideakit/prompts',
        '.ideakit/templates', 
        '.ideakit/personas',
        '.cursor',
        'ideas/active',
        'ideas/archive',
        'ideas/implemented',
        'prototypes',
        'research'
    ]
    
    for directory in directories:
        if not create_directory(directory):
            print(f"Warning: Could not create directory {directory}")

def create_constitution():
    """Create constitution.md file"""
    content = """# 1-Person Unicorn Creator's Idea Constitution

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
- Others: Utilize No-code/Low-code tools for rapid prototyping

---
*Edit this file if modifications are needed*
"""
    return write_file('.ideakit/constitution.md', content)

def create_cursor_instructions():
    """Create Cursor AI instructions"""
    content = """# IdeaKit Assistant Instructions

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
"""
    return write_file('.cursor/instructions.md', content)

def create_prompt_templates():
    """Create all prompt template files"""
    templates = {
        'spark.md': """# @spark - Initial Idea Capture

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
- Fun Factor: [1-10] - [brief reason]
- Differentiation: [1-10] - [brief reason]  
- Feasibility: [1-10] - [brief reason]

Questions to explore:
1. [specific question about target users]
2. [specific question about core feature]
3. [specific question about differentiation]

✅ Created: ideas/[timestamp]-[idea-name].md

Next step: Use @expand to explore creative directions!
```
""",
        'expand.md': """# @expand - Creative Development

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
""",
        'reality-check.md': """# @reality-check - Critical Analysis

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
""",
        'blueprint.md': """# @blueprint - Structured Planning

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
"""
    }
    
    success = True
    for filename, content in templates.items():
        if not write_file(f'.ideakit/prompts/{filename}', content):
            success = False
    
    return success

def create_file_templates():
    """Create file templates"""
    templates = {
        'idea-seed.md': """# 💡 Idea Seed: [TITLE]

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
- **Fun Factor:** [1-10] - [reason]
- **Differentiation:** [1-10] - [reason]  
- **Feasibility:** [1-10] - [reason]
- **Monetization:** [1-10] - [reason]
- **Scalability:** [1-10] - [reason]

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
""",
        'creative-expansion.md': """# 🎨 Creative Expansion: [TITLE]

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
"""
    }
    
    success = True
    for filename, content in templates.items():
        if not write_file(f'.ideakit/templates/{filename}', content):
            success = False
    
    return success

def create_example_idea():
    """Create example idea file"""
    content = """# 💡 Example: Pet + Fitness AR Game

**Captured:** 2024-01-01
**Status:** Example Seed
**Constitution Score:** 35/50

## Raw Idea
AR app game to exercise with pets. When you actually exercise, virtual pets exercise together and grow.

## Core Problem/Opportunity
- Lack of exercise motivation
- Desire for interaction with pets
- Providing fun fitness experience

## Initial Vision
When user jogs, AR dog runs alongside, and pets level up and learn new skills based on exercise amount

## Constitution Assessment
- **Fun Factor:** 9/10 - AR pet interaction would be very fun
- **Differentiation:** 8/10 - AR + pet + fitness combination is unique
- **Feasibility:** 6/10 - AR development could be complex
- **Monetization:** 7/10 - Multiple models possible like pet accessories, premium pets
- **Scalability:** 5/10 - High dependency on AR technology

## Questions to Explore
- [ ] Can it be fun without AR?
- [ ] How about integration with real pets?
- [ ] What if different pets for different exercise types?

## Next Steps
- [ ] Run @expand to explore creative directions
- [ ] Research AR fitness apps
- [ ] Define target user more clearly

---
*Created with IdeaKit 🚀 - This is an example file*
"""
    return write_file('ideas/example-idea.md', content)

def create_gitignore():
    """Create .gitignore file"""
    content = """# IdeaKit specific
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
desktop.ini
"""
    return write_file('.gitignore', content)

def create_package_json():
    """Create package.json file"""
    content = """{
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
  "author": "1-Person Unicorn Creator",
  "license": "MIT"
}
"""
    return write_file('package.json', content)

def print_completion_message():
    """Print installation completion message"""
    current_dir = os.path.basename(os.getcwd())
    print()
    print("🎉 IdeaKit installation complete!")
    print()
    print(f"📁 Project '{current_dir}' structure created:")
    print("   .ideakit/          - Configuration and templates")
    print("   .cursor/           - Cursor AI instructions")  
    print("   ideas/             - Your ideas organized by status")
    print("   prototypes/        - Code experiments")
    print("   research/          - Market research and notes")
    print()
    print("🚀 Next steps:")
    print("   1. Open this project in Cursor")
    print("   2. Try: @spark [your idea]")
    print("   3. Follow with: @expand, @reality-check, @blueprint")
    print()
    print("💡 Example commands:")
    print("   @spark AR fitness game with pets")
    print("   @expand")
    print("   @reality-check")
    print("   @blueprint")
    print()
    print("📖 Check ideas/example-idea.md to see the format")
    print("⚙️  Edit .ideakit/constitution.md to customize your principles")
    print()
    print(f"🎯 Your project is ready in: {os.getcwd()}")
    print("Happy idea developing! 🦄")

def print_help():
    """Print help message"""
    print("🚀 IdeaKit Universal Installer")
    print()
    print("USAGE:")
    print("  python install.py [OPTIONS]")
    print()
    print("OPTIONS:")
    print("  -h, --help     Show this help message")
    print("  -n, --name     Specify project name directly")
    print("  --no-git       Skip Git initialization")
    print("  --existing     Install in existing project (skip project creation)")
    print()
    print("EXAMPLES:")
    print("  python install.py                    # Interactive installation")
    print("  python install.py -n my-ideas        # Create project named 'my-ideas'")
    print("  python install.py --existing         # Install in current directory")
    print("  python install.py -n game-dev --no-git  # Create project without Git")
    print()
    print("DESCRIPTION:")
    print("  IdeaKit is a tool for creative idea development with AI assistance.")
    print("  This installer sets up the complete development environment.")
    print()
    print("  Features:")
    print("  • Cross-platform support (Windows, macOS, Linux)")
    print("  • Cursor AI integration with custom commands")
    print("  • Structured idea development workflow")
    print("  • Template system for consistent documentation")
    print()
    print("  Commands available after installation:")
    print("  • @spark [idea]     - Capture and assess new ideas")
    print("  • @expand           - Creative expansion mode")
    print("  • @reality-check    - Feasibility analysis")
    print("  • @blueprint        - Project planning")
    print("  • @constitution     - Update evaluation criteria")
    print()
    print("  For more information, visit: https://github.com/JJs23/idea-kit")

def main():
    """Main installation function"""
    # Parse command line arguments
    import sys
    
    # Check for help flag
    if len(sys.argv) > 1 and sys.argv[1] in ['-h', '--help']:
        print_help()
        sys.exit(0)
    
    # Parse other arguments
    project_name = None
    skip_git = False
    existing_project = False
    
    i = 1
    while i < len(sys.argv):
        arg = sys.argv[i]
        if arg in ['-n', '--name']:
            if i + 1 < len(sys.argv):
                project_name = sys.argv[i + 1]
                i += 2
            else:
                print("❌ Error: --name requires a project name")
                sys.exit(1)
        elif arg == '--no-git':
            skip_git = True
            i += 1
        elif arg == '--existing':
            existing_project = True
            i += 1
        else:
            print(f"❌ Error: Unknown argument '{arg}'")
            print("Use --help for usage information")
            sys.exit(1)
    
    print_status("Installing IdeaKit...")
    print()
    
    # Check if we're in a git repository or create new project
    if not is_git_repo() and not existing_project:
        print_status("Setting up new IdeaKit project...")
        
        if project_name is None:
            project_name = get_project_name()
        
        if not create_new_project(project_name, skip_git):
            print("❌ Failed to create new project")
            sys.exit(1)
        
        print()
        print_status("Installing IdeaKit components in new project...")
    else:
        if existing_project:
            print_status("Installing in existing project...")
        else:
            print_status("Installing in existing Git repository...")
    
    # Create directory structure
    print_status("Creating directory structure...")
    create_directory_structure()
    
    # Create configuration files
    print_status("Creating constitution.md...")
    if not create_constitution():
        print("⚠️  Warning: Could not create constitution.md")
    
    print_status("Creating Cursor instructions...")
    if not create_cursor_instructions():
        print("⚠️  Warning: Could not create Cursor instructions")
    
    # Create prompt templates
    print_status("Creating prompt templates...")
    if not create_prompt_templates():
        print("⚠️  Warning: Could not create all prompt templates")
    
    # Create file templates
    print_status("Creating file templates...")
    if not create_file_templates():
        print("⚠️  Warning: Could not create all file templates")
    
    # Create example files
    print_status("Creating example files...")
    if not create_example_idea():
        print("⚠️  Warning: Could not create example idea")
    
    # Create project files
    print_status("Creating .gitignore...")
    if not create_gitignore():
        print("⚠️  Warning: Could not create .gitignore")
    
    print_status("Creating package.json...")
    if not create_package_json():
        print("⚠️  Warning: Could not create package.json")
    
    # Print completion message
    print_completion_message()

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n❌ Installation cancelled by user")
        sys.exit(1)
    except Exception as e:
        print(f"\n❌ Installation failed: {e}")
        sys.exit(1)
