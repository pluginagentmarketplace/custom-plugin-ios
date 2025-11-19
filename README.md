# Developer Roadmap Plugin

A comprehensive Claude Code plugin for learning and mastering 75+ developer specializations. Built from the official [developer-roadmap](https://github.com/kamranahmedse/developer-roadmap) repository.

## 🚀 Features

### 7 Expert Agents
- **AI & Machine Learning Specialist** - 7 AI/ML roadmaps
- **Frontend & Web Technologies Expert** - 13 web framework roadmaps
- **Backend & Database Specialist** - 20 backend and database roadmaps
- **DevOps & Cloud Infrastructure Specialist** - 6 cloud and infrastructure roadmaps
- **Specialized Roles & Architecture Expert** - 9 specialized technical roles
- **Mobile & Game Development Specialist** - 9 mobile and game development roadmaps
- **Foundational Skills & Tools Expert** - 4 foundational roadmaps

### 11 Comprehensive Skills
- AI Foundations & Machine Learning Practice
- Frontend Frameworks & Backend Development
- Database Design & Cloud Infrastructure
- System Architecture & Mobile Development
- Game Development & DevOps Practices
- Fundamentals (CS, Git, Linux, Bash)

### 4 Interactive Commands
- **`/learn`** - Personalized learning path recommendations
- **`/browse-roadmap`** - Explore 75+ roadmaps by category
- **`/assess`** - Knowledge assessment and gap analysis
- **`/compare-paths`** - Compare different specializations

### 1,000+ Hours of Content
- Complete learning paths from beginner to advanced
- Real-world best practices and patterns
- Career progression guidance
- Industry trends and market insights

## 📥 Installation

### Option 1: Single-Line Installation
```bash
curl -fsSL https://raw.githubusercontent.com/pluginagentmarketplace/developer-roadmap-plugin/main/install.sh | bash
```

### Option 2: Manual Installation
```bash
# Clone the repository
git clone https://github.com/pluginagentmarketplace/developer-roadmap-plugin.git

# In Claude Code, load from local directory
# Use: ./developer-roadmap-plugin
```

### Option 3: From Marketplace
```
Claude Code Marketplace → Search "Developer Roadmap" → Add Plugin
```

## 🎯 Quick Start

### Step 1: Start Learning
```
/learn
```
I'll help you choose the perfect learning path based on your goals and experience.

### Step 2: Explore Available Resources
```
/browse-roadmap frontend
```
Discover all available roadmaps in your area of interest.

### Step 3: Assess Your Knowledge
```
/assess
```
Evaluate your current skill level and identify gaps.

### Step 4: Compare Career Paths
```
/compare-paths react angular vue
```
Compare different specializations to find your best fit.

## 📚 Learning Paths (Examples)

### Frontend Developer (6-8 months)
```
HTML/CSS/JavaScript → React/Vue → Advanced Patterns → Full-Stack
```

### Backend Engineer (9-12 months)
```
Fundamentals → Choose Language → Databases → System Design → Production
```

### AI/ML Engineer (6-18 months)
```
Prompt Engineering → AI Fundamentals → ML Practice → MLOps/Specialization
```

### DevOps Specialist (12-18 months)
```
Docker → Kubernetes → Cloud (AWS/Azure) → Terraform → Monitoring/Logging
```

### Full-Stack Engineer (12-15 months)
```
Frontend → Backend → Databases → DevOps → Full-Stack Integration
```

## 🏗️ Plugin Architecture

```
developer-roadmap-plugin/
├── .claude-plugin/
│   └── plugin.json                    # Plugin manifest
├── agents/
│   ├── 01-ai-ml-specialist.md
│   ├── 02-frontend-expert.md
│   ├── 03-backend-database.md
│   ├── 04-devops-cloud.md
│   ├── 05-specialized-roles.md
│   ├── 06-mobile-game.md
│   └── 07-foundational-tools.md
├── commands/
│   ├── learn.md
│   ├── browse-roadmap.md
│   ├── assess.md
│   └── compare-paths.md
├── skills/
│   ├── ai-foundations/SKILL.md
│   ├── machine-learning-practice/SKILL.md
│   ├── frontend-frameworks/SKILL.md
│   ├── backend-development/SKILL.md
│   ├── database-design/SKILL.md
│   ├── cloud-infrastructure/SKILL.md
│   ├── system-architecture/SKILL.md
│   ├── mobile-development/SKILL.md
│   ├── game-development/SKILL.md
│   ├── devops-practices/SKILL.md
│   └── fundamentals/SKILL.md
├── hooks/
│   └── hooks.json
└── README.md
```

## 🎓 Roadmaps Included

### AI & Machine Learning (7)
AI Engineer, AI Data Scientist, AI Agents, AI Red Teaming, Machine Learning, MLOps, Prompt Engineering

### Frontend & Web (13)
HTML, CSS, JavaScript, TypeScript, React, Vue, Angular, Next.js, Swift UI, GraphQL, API Design, and more

### Backend & Databases (20)
Backend, Node.js, Python, Java, Go, Rust, PHP, C++, Kotlin, Laravel, Spring Boot, SQL, PostgreSQL, MongoDB, Redis, Data Engineer, Data Analyst, BI Analyst, DSA

### DevOps & Cloud (6)
DevOps, Docker, Kubernetes, AWS, Terraform, Cloudflare

### Mobile & Games (9)
Android, iOS, Flutter, Game Developer, Server-Side Games, UX Design, Design Systems, QA, Product Manager

### Specialized Roles (9)
Software Architect, System Design, Engineering Manager, Code Review, Technical Writer, Developer Relations, Blockchain, Cyber Security

### Foundations (4)
Computer Science, Git/GitHub, Linux, Shell/Bash

## 💡 Usage Examples

### Learning a New Technology
```
User: "I want to learn React"
Agent: Recommends React learning path, prerequisites, estimated hours
Skills: frontend-frameworks
Projects: 5 progressively complex React apps
Timeline: 3-4 months
```

### Career Transition
```
User: "I'm switching from marketing to tech"
Agent: Suggests frontend as entry point
Path: HTML/CSS/JS → React → Full-Stack
Timeline: 6-8 months
Support: Beginner-friendly resources
```

### System Design Interview Prep
```
User: "Preparing for FAANG system design interview"
Agent: Activates specialized-roles agent
Skills: system-architecture
Topics: Scalability, databases, caching, microservices
Practice: Interview-style design questions
```

### Full-Stack Development
```
User: "Build complete applications"
Path: Frontend → Backend → DevOps
Skills: frontend-frameworks, backend-development, cloud-infrastructure
Projects: End-to-end full-stack applications
```

## 🔄 Continuous Updates

This plugin automatically stays current with:
- Latest developer-roadmap repository updates
- Emerging technologies and trends
- Industry best practices
- New learning resources

## 📊 Statistics

| Metric | Value |
|--------|-------|
| **Total Roadmaps** | 75+ |
| **Total Topics** | 3,000+ |
| **Learning Hours** | 1,000+ |
| **Specializations** | 7 |
| **Skills** | 11 |
| **Commands** | 4 |
| **Agents** | 7 |

## 🤝 Contributing

Contributions welcome! Help improve:
- Roadmap content
- New specializations
- Better examples
- Additional resources

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## 📄 License

MIT License - See [LICENSE](LICENSE) for details.

## 🔗 Resources

- **Original Repository**: [kamranahmedse/developer-roadmap](https://github.com/kamranahmedse/developer-roadmap)
- **Live Site**: [roadmap.sh](https://roadmap.sh)
- **Claude Code Docs**: [docs.claude.com](https://docs.claude.com)

## 💬 Support

- Found a bug? Open an issue
- Want to suggest a feature? Open a discussion
- Need help? Check the documentation or ask Claude!

## 🌟 Feedback

Love the plugin? Leave a star! Have suggestions? We'd love to hear them.

---

**Ready to master your craft?** Start with `/learn` today!

Built with ❤️ for developers, by developers.
