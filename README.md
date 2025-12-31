<div align="center">

<!-- Animated Typing Banner -->
<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=28&duration=3000&pause=1000&color=2E9EF7&center=true&vCenter=true&multiline=true&repeat=true&width=600&height=100&lines=Ios+Assistant;7+Agents+%7C+7+Skills;Claude+Code+Plugin" alt="Ios Assistant" />

<br/>

<!-- Badge Row 1: Status Badges -->
[![Version](https://img.shields.io/badge/Version-1.0.0-blue?style=for-the-badge)](https://github.com/pluginagentmarketplace/custom-plugin-ios/releases)
[![License](https://img.shields.io/badge/License-Custom-yellow?style=for-the-badge)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Production-brightgreen?style=for-the-badge)](#)
[![SASMP](https://img.shields.io/badge/SASMP-v1.3.0-blueviolet?style=for-the-badge)](#)

<!-- Badge Row 2: Content Badges -->
[![Agents](https://img.shields.io/badge/Agents-7-orange?style=flat-square&logo=robot)](#-agents)
[![Skills](https://img.shields.io/badge/Skills-7-purple?style=flat-square&logo=lightning)](#-skills)
[![Commands](https://img.shields.io/badge/Commands-4-green?style=flat-square&logo=terminal)](#-commands)

<br/>

<!-- Quick CTA Row -->
[📦 **Install Now**](#-quick-start) · [🤖 **Explore Agents**](#-agents) · [📖 **Documentation**](#-documentation) · [⭐ **Star this repo**](https://github.com/pluginagentmarketplace/custom-plugin-ios)

---

### What is this?

> **Ios Assistant** is a Claude Code plugin with **7 agents** and **7 skills** for ios development.

</div>

---

## 📑 Table of Contents

<details>
<summary>Click to expand</summary>

- [Quick Start](#-quick-start)
- [Features](#-features)
- [Agents](#-agents)
- [Skills](#-skills)
- [Commands](#-commands)
- [Documentation](#-documentation)
- [Contributing](#-contributing)
- [License](#-license)

</details>

---

## 🚀 Quick Start

### Prerequisites

- Claude Code CLI v2.0.27+
- Active Claude subscription

### Installation (Choose One)

<details open>
<summary><strong>Option 1: From Marketplace (Recommended)</strong></summary>

```bash
# Step 1️⃣ Add the marketplace
/plugin add marketplace pluginagentmarketplace/custom-plugin-ios

# Step 2️⃣ Install the plugin
/plugin install ios-assistant@pluginagentmarketplace-ios

# Step 3️⃣ Restart Claude Code
# Close and reopen your terminal/IDE
```

</details>

<details>
<summary><strong>Option 2: Local Installation</strong></summary>

```bash
# Clone the repository
git clone https://github.com/pluginagentmarketplace/custom-plugin-ios.git
cd custom-plugin-ios

# Load locally
/plugin load .

# Restart Claude Code
```

</details>

### ✅ Verify Installation

After restart, you should see these agents:

```
ios-assistant:02-frontend-expert
ios-assistant:07-foundational-tools
ios-assistant:03-backend-database
ios-assistant:04-devops-cloud
ios-assistant:01-ai-ml-specialist
... and 2 more
```

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🤖 **7 Agents** | Specialized AI agents for ios tasks |
| 🛠️ **7 Skills** | Reusable capabilities with Golden Format |
| ⌨️ **4 Commands** | Quick slash commands |
| 🔄 **SASMP v1.3.0** | Full protocol compliance |

---

## 🤖 Agents

### 7 Specialized Agents

| # | Agent | Purpose |
|---|-------|---------|
| 1 | **02-frontend-expert** | Specialist in web development, modern JavaScript frameworks, |
| 2 | **07-foundational-tools** | Expert in computer science fundamentals, version control, Li |
| 3 | **03-backend-database** | Expert in backend development across multiple languages and  |
| 4 | **04-devops-cloud** | Specialist in containerization, orchestration, cloud platfor |
| 5 | **01-ai-ml-specialist** | Expert in AI engineering, machine learning, data science, ML |
| 6 | **06-mobile-game** | Specialist in mobile app development, game development, UX d |
| 7 | **05-specialized-roles** | Expert in software architecture, system design, security, bl |

---

## 🛠️ Skills

### Available Skills

| Skill | Description | Invoke |
|-------|-------------|--------|
| `system-architecture` | System design and architecture including scalability pattern | `Skill("ios-assistant:system-architecture")` |
| `machine-learning-practice` | Practical machine learning skills including data preprocessi | `Skill("ios-assistant:machine-learning-practice")` |
| `fundamentals` | Foundational computer science skills including data structur | `Skill("ios-assistant:fundamentals")` |
| `backend-development` | Backend development across multiple languages and frameworks | `Skill("ios-assistant:backend-development")` |
| `mobile-development` | Mobile app development for iOS and Android including native  | `Skill("ios-assistant:mobile-development")` |
| `database-design` | Database design, optimization, and administration including  | `Skill("ios-assistant:database-design")` |
| `frontend-frameworks` | Modern frontend framework development including React, Vue,  | `Skill("ios-assistant:frontend-frameworks")` |
| `devops-practices` | DevOps practices including CI/CD pipelines, monitoring, logg | `Skill("ios-assistant:devops-practices")` |
| `cloud-infrastructure` | Cloud infrastructure including containerization with Docker, | `Skill("ios-assistant:cloud-infrastructure")` |
| `ai-foundations` | Foundational concepts for AI and machine learning developmen | `Skill("ios-assistant:ai-foundations")` |
| ... | +1 more | See skills/ directory |

---

## ⌨️ Commands

| Command | Description |
|---------|-------------|
| `/learn` | /learn |
| `/assess` | /assess |
| `/compare-paths` | paths |
| `/browse-roadmap` | roadmap |

---

## 📚 Documentation

| Document | Description |
|----------|-------------|
| [CHANGELOG.md](CHANGELOG.md) | Version history |
| [CONTRIBUTING.md](CONTRIBUTING.md) | How to contribute |
| [LICENSE](LICENSE) | License information |

---

## 📁 Project Structure

<details>
<summary>Click to expand</summary>

```
custom-plugin-ios/
├── 📁 .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
├── 📁 agents/              # 7 agents
├── 📁 skills/              # 7 skills (Golden Format)
├── 📁 commands/            # 4 commands
├── 📁 hooks/
├── 📄 README.md
├── 📄 CHANGELOG.md
└── 📄 LICENSE
```

</details>

---

## 📅 Metadata

| Field | Value |
|-------|-------|
| **Version** | 1.0.0 |
| **Last Updated** | 2025-12-29 |
| **Status** | Production Ready |
| **SASMP** | v1.3.0 |
| **Agents** | 7 |
| **Skills** | 7 |
| **Commands** | 4 |

---

## 🤝 Contributing

Contributions are welcome! Please read our [Contributing Guide](CONTRIBUTING.md).

1. Fork the repository
2. Create your feature branch
3. Follow the Golden Format for new skills
4. Submit a pull request

---

## ⚠️ Security

> **Important:** This repository contains third-party code and dependencies.
>
> - ✅ Always review code before using in production
> - ✅ Check dependencies for known vulnerabilities
> - ✅ Follow security best practices
> - ✅ Report security issues privately via [Issues](../../issues)

---

## 📝 License

Copyright © 2025 **Dr. Umit Kacar** & **Muhsin Elcicek**

Custom License - See [LICENSE](LICENSE) for details.

---

## 👥 Contributors

<table>
<tr>
<td align="center">
<strong>Dr. Umit Kacar</strong><br/>
Senior AI Researcher & Engineer
</td>
<td align="center">
<strong>Muhsin Elcicek</strong><br/>
Senior Software Architect
</td>
</tr>
</table>

---

<div align="center">

**Made with ❤️ for the Claude Code Community**

[![GitHub](https://img.shields.io/badge/GitHub-pluginagentmarketplace-black?style=for-the-badge&logo=github)](https://github.com/pluginagentmarketplace)

</div>
