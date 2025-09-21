# IdeaKit Windows Installer PRD (Product Requirements Document)

## 📋 Overview

The `install.bat` is a Windows batch file installer that automatically sets up the complete IdeaKit development environment for Windows users. It provides a one-click solution to create a structured project for creative idea development with AI assistance.

## 🎯 Purpose

- **Primary Goal**: Enable Windows users to quickly set up IdeaKit without manual configuration
- **Target Users**: Windows developers, solo entrepreneurs, creative individuals
- **Value Proposition**: Zero-configuration setup for AI-powered idea development workflow

## 🔧 Technical Specifications

### System Requirements
- **OS**: Windows 10/11
- **Shell**: Command Prompt or PowerShell
- **Dependencies**: Git (for new project creation)
- **Encoding**: UTF-8 support (chcp 65001)

### File Structure Created
```
project-root/
├── .ideakit/
│   ├── constitution.md          # Core philosophy and evaluation criteria
│   ├── prompts/
│   │   ├── spark.md            # @spark command prompt template
│   │   ├── expand.md           # @expand command prompt template
│   │   ├── reality-check.md    # @reality-check command prompt template
│   │   └── blueprint.md        # @blueprint command prompt template
│   └── templates/
│       ├── idea-seed.md        # Initial idea capture template
│       └── creative-expansion.md # Creative development template
├── .cursor/
│   └── instructions.md         # Cursor AI configuration
├── ideas/
│   ├── active/                 # Ideas in progress
│   ├── archive/                # Paused/completed ideas
│   ├── implemented/            # Actually implemented projects
│   └── example-idea.md         # Sample idea file
├── prototypes/                 # Code experiments
├── research/                   # Market research materials
├── .gitignore                  # Git ignore rules
└── package.json               # Project metadata and scripts
```

## 🚀 Core Features

### 1. Project Detection & Creation
- **Smart Detection**: Automatically detects if running in existing Git repository
- **New Project Mode**: 
  - Prompts for project name (default: "my-ideas")
  - Creates new directory structure
  - Initializes Git repository
  - Creates basic README.md
- **Existing Project Mode**: Installs IdeaKit components in current directory

### 2. Constitution System
- **Core Philosophy**: Fun-first, cross-domain innovation, solo execution power, originality pursuit
- **Evaluation Criteria**: 5-point scoring system (Fun Factor, Differentiation, Feasibility, Monetization, Scalability)
- **Tech Stack Preferences**: React, Next.js, Node.js, Python, Supabase, etc.
- **Pitfall Avoidance**: Guidelines for avoiding common mistakes

### 3. AI Command System
- **@spark**: Initial idea capture and assessment
- **@expand**: Creative partner mode for idea expansion
- **@reality-check**: Critical mentor mode for feasibility analysis
- **@blueprint**: Blueprint architect mode for project planning
- **@constitution**: Constitution review and updates

### 4. Template System
- **Idea Seed Template**: Structured format for initial idea capture
- **Creative Expansion Template**: Multi-variation idea development
- **Prompt Templates**: AI behavior definitions for each command
- **File Management**: Automatic organization by idea status

### 5. Project Organization
- **Status-based Folders**: active/, archive/, implemented/
- **Development Folders**: prototypes/, research/
- **Example Files**: Sample idea with complete workflow demonstration
- **Git Integration**: Proper .gitignore and package.json setup

## 📝 Installation Process

### Step 1: Environment Setup
```batch
@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
```

### Step 2: Project Detection
- Check for `.git` directory
- Branch into new project or existing project mode
- Handle user input for project naming

### Step 3: Directory Structure Creation
- Create all necessary folders with error suppression
- Ensure proper Windows path handling

### Step 4: Configuration Files
- Generate constitution.md with core philosophy
- Create Cursor AI instructions
- Set up prompt templates for each command

### Step 5: Template System
- Create file templates for idea development
- Set up example files for user guidance

### Step 6: Project Setup
- Generate .gitignore for proper version control
- Create package.json with useful scripts
- Display completion message with next steps

## 🎨 User Experience

### Installation Flow
1. **Download & Execute**: Single command execution
2. **Interactive Setup**: Project name input (optional)
3. **Progress Feedback**: Clear status messages for each step
4. **Completion Guide**: Instructions for next steps

### Error Handling
- **Silent Failures**: `2>nul` suppresses error messages for non-critical operations
- **Graceful Degradation**: Continues installation even if some steps fail
- **User Feedback**: Clear success/failure indicators

### Post-Installation
- **Immediate Usability**: Ready to use with Cursor AI
- **Example Provided**: Sample idea demonstrates full workflow
- **Documentation**: Built-in help through example files

## 🔄 Workflow Integration

### Cursor AI Integration
- **Custom Instructions**: Pre-configured AI behavior
- **Command Recognition**: Slash commands work immediately
- **Context Awareness**: AI understands project structure

### Development Workflow
1. **@spark**: Capture new ideas
2. **@expand**: Develop creative variations
3. **@reality-check**: Validate feasibility
4. **@blueprint**: Create implementation plan
5. **File Management**: Organize by status

## 📊 Success Metrics

### Installation Success
- **Completion Rate**: 100% successful installation
- **Error Rate**: Minimal errors with graceful handling
- **User Satisfaction**: Clear feedback and immediate usability

### Usage Adoption
- **Time to First Use**: Immediate after installation
- **Workflow Completion**: Full idea-to-blueprint cycle
- **Template Usage**: High adoption of provided templates

## 🛠️ Technical Implementation

### Batch File Features
- **Delayed Expansion**: `!variable!` syntax for dynamic variables
- **UTF-8 Support**: Proper encoding for international characters
- **Error Suppression**: `2>nul` for non-critical operations
- **User Input**: `set /p` for interactive project naming

### File Generation
- **Heredoc Syntax**: `(echo ...) > file` for multi-line file creation
- **Escape Characters**: `^` for special character handling
- **Path Handling**: Windows-specific path separators

### Cross-Platform Considerations
- **Windows-Specific**: Designed for Windows Command Prompt/PowerShell
- **Git Integration**: Works with Windows Git installations
- **Path Compatibility**: Uses Windows path separators

## 🔮 Future Enhancements

### Potential Improvements
- **PowerShell Version**: Native PowerShell script alternative
- **GUI Installer**: Windows Installer package option
- **Configuration Options**: Customizable installation parameters
- **Update Mechanism**: Built-in updater for IdeaKit components

### Integration Opportunities
- **VS Code Extension**: Direct integration with VS Code
- **Windows Store**: Distribution through Microsoft Store
- **Chocolatey Package**: Package manager distribution

## 📚 Documentation

### User Documentation
- **README.md**: Quick start guide with Windows instructions
- **INSTALL.md**: Detailed installation guide
- **Example Files**: Built-in usage examples

### Developer Documentation
- **PRD**: This document for technical specifications
- **Code Comments**: Inline documentation in batch file
- **Template Documentation**: Built into template files

## 🎯 Success Criteria

### Functional Requirements
- ✅ Complete project structure creation
- ✅ All configuration files generated
- ✅ AI integration ready
- ✅ Example files provided
- ✅ Error-free installation

### Non-Functional Requirements
- ✅ Fast installation (< 30 seconds)
- ✅ Clear user feedback
- ✅ Graceful error handling
- ✅ Cross-shell compatibility
- ✅ UTF-8 character support

---

**This PRD serves as the technical specification for the IdeaKit Windows installer, ensuring consistent implementation and user experience across all Windows environments.**
