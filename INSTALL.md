# Developer Roadmap Plugin - Installation Guide

## Quick Installation (Recommended)

### Option 1: Single-Line Installation
```bash
# Copy plugin to Claude Code directory
cp -r /home/user/developer-roadmap-plugin ~/.claude-code/plugins/

# Or use the full path in Claude Code:
# /home/user/developer-roadmap-plugin
```

### Option 2: Manual Setup in Claude Code

1. **Open Claude Code**
2. **Load from path**: `/home/user/developer-roadmap-plugin`
3. **Verify installation**: Run `/learn` command

### Option 3: From Repository
```bash
# Clone the repository
git clone https://github.com/pluginagentmarketplace/developer-roadmap-plugin.git

# Navigate to plugin directory
cd developer-roadmap-plugin

# Load in Claude Code from the directory path
```

## Verification Checklist

After installation, verify:

✅ **Plugin Loads**
- [ ] Plugin appears in Claude Code

✅ **Commands Available**
- [ ] `/learn` - Personalized learning paths
- [ ] `/browse-roadmap` - Explore all roadmaps
- [ ] `/assess` - Knowledge assessment
- [ ] `/compare-paths` - Compare specializations

✅ **Agents Active**
- [ ] AI & ML Specialist
- [ ] Frontend Expert
- [ ] Backend Specialist
- [ ] DevOps Specialist
- [ ] Specialized Roles Expert
- [ ] Mobile & Game Specialist
- [ ] Fundamentals Expert

✅ **Skills Loadable**
- [ ] AI Foundations
- [ ] Machine Learning Practice
- [ ] Frontend Frameworks
- [ ] Backend Development
- [ ] Database Design
- [ ] Cloud Infrastructure
- [ ] System Architecture
- [ ] Mobile Development
- [ ] Game Development
- [ ] DevOps Practices
- [ ] Fundamentals

## File Structure

```
developer-roadmap-plugin/
├── .claude-plugin/
│   └── plugin.json                  # Plugin manifest
├── agents/                          # 7 agents
│   ├── 01-ai-ml-specialist.md
│   ├── 02-frontend-expert.md
│   ├── 03-backend-database.md
│   ├── 04-devops-cloud.md
│   ├── 05-specialized-roles.md
│   ├── 06-mobile-game.md
│   └── 07-foundational-tools.md
├── commands/                        # 4 slash commands
│   ├── learn.md
│   ├── browse-roadmap.md
│   ├── assess.md
│   └── compare-paths.md
├── skills/                          # 11 skills
│   ├── ai-foundations/
│   ├── machine-learning-practice/
│   ├── frontend-frameworks/
│   ├── backend-development/
│   ├── database-design/
│   ├── cloud-infrastructure/
│   ├── system-architecture/
│   ├── mobile-development/
│   ├── game-development/
│   ├── devops-practices/
│   └── fundamentals/
├── hooks/
│   └── hooks.json
├── README.md                        # Main documentation
├── INSTALL.md                       # This file
├── CHANGELOG.md                     # Version history
└── LICENSE                          # MIT License
```

## Getting Started

### Step 1: Install the Plugin
```bash
cp -r /home/user/developer-roadmap-plugin ~/.claude-code/plugins/
```

### Step 2: Reload Claude Code
- Close and reopen Claude Code
- Or use the plugin reload command if available

### Step 3: Verify Installation
```
/learn
```

### Step 4: Start Learning
Follow the interactive prompts to:
1. Assess your background
2. Choose your career goal
3. Get a personalized learning path
4. Begin with recommended resources

## Troubleshooting

### Plugin Not Loading
1. Check file permissions: `chmod -R 755 developer-roadmap-plugin`
2. Verify plugin.json is valid JSON
3. Ensure all required files exist
4. Restart Claude Code completely

### Commands Not Working
1. Clear Claude Code cache
2. Reload the plugin
3. Check command file syntax (should be valid markdown)
4. Verify plugin.json references correct paths

### Skills Not Loading
1. Verify SKILL.md files have correct frontmatter
2. Check skill naming (alphanumeric + hyphens only)
3. Ensure skills are referenced in plugin.json
4. Check for typos in skill paths

## System Requirements

- **Claude Code**: Latest version
- **OS**: macOS, Linux, or Windows (with WSL)
- **Disk Space**: ~5MB for plugin files
- **Internet**: Optional (works offline after loading)

## Support

### Getting Help
1. Check the README.md for detailed documentation
2. Review individual agent descriptions for guidance
3. Use `/learn` command for interactive help
4. Ask Claude directly for clarification

### Reporting Issues
1. Check TROUBLESHOOTING section first
2. Verify plugin structure matches requirements
3. Report with: OS, Claude Code version, error message

## Advanced Configuration

### Custom Hooks
Edit `hooks/hooks.json` to customize:
- Auto skill loading behavior
- Agent routing rules
- Response formatting

### Disabling Features
Remove entries from plugin.json to disable:
- Specific agents
- Specific commands
- Specific skills

### Adding Custom Agents
1. Create new markdown file in `agents/`
2. Add YAML frontmatter with description
3. Reference in plugin.json
4. Reload plugin

## Performance Tips

1. **Lazy Loading**: Skills load only when needed
2. **Caching**: Common queries are cached
3. **Offline**: Works without internet connection
4. **Lightweight**: ~5MB total size

## Updates

### Checking for Updates
```bash
cd developer-roadmap-plugin
git pull origin main
```

### What's New
See CHANGELOG.md for version history and updates.

## Uninstallation

```bash
# Remove plugin
rm -rf ~/.claude-code/plugins/developer-roadmap-plugin

# Or if using local path
# Simply remove the plugin reference from Claude Code
```

---

## Quick Start Commands

```
/learn                           # Get started with learning path
/browse-roadmap frontend         # Explore frontend roadmaps
/assess javascript               # Assess JavaScript knowledge
/compare-paths react vue angular # Compare frameworks
```

## Next Steps

1. ✅ Install the plugin (you're here!)
2. 📚 Run `/learn` to choose your path
3. 🎯 Explore `/browse-roadmap` for resources
4. 📊 Use `/assess` to check your level
5. 🚀 Start learning with recommended path

---

**Happy learning!** 🚀

For more information, see [README.md](README.md).
