# IdeaKit Universal Installer PRD (Product Requirements Document)

## 📋 Overview

The `install.py` is a cross-platform Python installer that automatically sets up the complete IdeaKit development environment for all operating systems. It provides a one-click solution to create a structured project for creative idea development with AI assistance through Cursor.

## 🎯 Purpose

- **Primary Goal**: Enable developers on any platform to quickly set up IdeaKit without manual configuration
- **Target Users**: Developers, solo entrepreneurs, creative individuals (Windows, macOS, Linux)
- **Value Proposition**: Zero-configuration cross-platform setup for AI-powered idea development workflow

## 🔧 Technical Specifications

### System Requirements
- **OS**: Windows 10/11, macOS 10.14+, Linux (Ubuntu 18.04+, CentOS 7+)
- **Python**: Python 3.6+ (built-in on most systems)
- **Dependencies**: Git (for new project creation)
- **IDE**: Cursor (recommended) or VS Code with Cursor extension

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
- **Cross-Platform**: Works identically on Windows, macOS, and Linux

### 2. Constitution System
- **Core Philosophy**: Fun-first, cross-domain innovation, solo execution power, originality pursuit
- **Evaluation Criteria**: 5-point scoring system (Fun Factor, Differentiation, Feasibility, Monetization, Scalability)
- **Tech Stack Preferences**: React, Next.js, Node.js, Python, Supabase, etc.
- **Pitfall Avoidance**: Guidelines for avoiding common mistakes

### 3. Cursor AI Command System
- **@spark**: Initial idea capture and assessment
- **@expand**: Creative partner mode for idea expansion
- **@reality-check**: Critical mentor mode for feasibility analysis
- **@blueprint**: Blueprint architect mode for project planning
- **@constitution**: Constitution review and updates
- **Cursor Integration**: Commands work directly in Cursor chat interface
- **Custom Instructions**: Pre-configured AI behavior for consistent responses

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
```python
#!/usr/bin/env python3
import os, sys, platform, subprocess, shutil
from pathlib import Path
```

### Step 2: Project Detection
- Check for `.git` directory using `os.path.exists('.git')`
- Branch into new project or existing project mode
- Handle user input for project naming with `input()`

### Step 3: Directory Structure Creation
- Create all necessary folders using `Path().mkdir(parents=True, exist_ok=True)`
- Cross-platform path handling with `pathlib.Path`

### Step 4: Configuration Files
- Generate constitution.md with core philosophy
- Create Cursor AI instructions in `.cursor/instructions.md`
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
1. **Download & Execute**: Single command execution across all platforms
2. **Interactive Setup**: Project name input (optional)
3. **Progress Feedback**: Clear status messages with emojis for each step
4. **Completion Guide**: Instructions for next steps

### Error Handling
- **Exception Handling**: Python try-catch blocks for robust error handling
- **Graceful Degradation**: Continues installation even if some steps fail
- **User Feedback**: Clear success/failure indicators with detailed messages
- **Cross-Platform**: Handles OS-specific differences automatically

### Post-Installation
- **Immediate Usability**: Ready to use with Cursor AI
- **Example Provided**: Sample idea demonstrates full workflow
- **Documentation**: Built-in help through example files

## 🔄 Workflow Integration

### Cursor AI Integration
- **Custom Instructions**: Pre-configured AI behavior in `.cursor/instructions.md`
- **Command Recognition**: @spark, @expand, @reality-check, @blueprint commands work immediately
- **Context Awareness**: AI understands project structure and constitution
- **Persona Switching**: Different AI personalities for different workflow stages
- **File Management**: Automatic file creation and organization

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

### Python Features
- **Cross-Platform**: Works on Windows, macOS, and Linux
- **UTF-8 Support**: Built-in Unicode support for international characters
- **Exception Handling**: Robust error handling with try-catch blocks
- **User Input**: `input()` function for interactive project naming

### File Generation
- **File I/O**: `open()` and `write()` for multi-line file creation
- **Path Handling**: `pathlib.Path` for cross-platform path management
- **Directory Creation**: `Path().mkdir(parents=True, exist_ok=True)`

### Cross-Platform Considerations
- **Universal Compatibility**: Single codebase for all operating systems
- **Git Integration**: Works with Git installations on any platform
- **Path Compatibility**: Automatic path separator handling
- **Shell Detection**: Detects and adapts to different shell environments

## 🔮 Future Enhancements

### Potential Improvements
- **GUI Installer**: Cross-platform GUI installer using tkinter or PyQt
- **Configuration Options**: Customizable installation parameters
- **Update Mechanism**: Built-in updater for IdeaKit components
- **Dependency Management**: Automatic Python package installation

### Integration Opportunities
- **VS Code Extension**: Direct integration with VS Code
- **Package Managers**: pip, npm, or system package manager distribution
- **Docker Support**: Containerized installation option
- **Cloud Integration**: Direct deployment to cloud platforms

## 📚 Documentation

### User Documentation
- **README.md**: Quick start guide with cross-platform instructions
- **INSTALL.md**: Detailed installation guide for all platforms
- **Example Files**: Built-in usage examples and templates

### Developer Documentation
- **PRD**: This document for technical specifications
- **Code Comments**: Inline documentation in Python script
- **Template Documentation**: Built into template files
- **API Documentation**: Python function documentation

## 🎯 Success Criteria

### Functional Requirements
- ✅ Complete project structure creation
- ✅ All configuration files generated
- ✅ AI integration ready
- ✅ Example files provided
- ✅ Error-free installation

### Non-Functional Requirements
- ✅ Fast installation (< 30 seconds)
- ✅ Clear user feedback with emojis and status messages
- ✅ Graceful error handling with Python exceptions
- ✅ Cross-platform compatibility (Windows, macOS, Linux)
- ✅ UTF-8 character support for international users
- ✅ Cursor AI integration ready out of the box

---

**This PRD serves as the technical specification for the IdeaKit Universal installer, ensuring consistent implementation and user experience across all operating systems and development environments.**
