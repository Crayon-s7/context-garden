# Context Garden

> 我的个人 AI 上下文花园：用 GitHub 管理长期项目、个人偏好、可复用 Skill 和常用模板，让不同 AI 工具快速理解我是谁、我在做什么、我希望它怎么帮我。

## 一句话介绍

**Context Garden 是一个可版本化、可迁移、可复用的个人 AI 上下文系统。**

它不是简单保存聊天记录，而是把真正有价值的上下文沉淀下来：

- 我是谁，我的偏好是什么。
- 我正在做哪些长期项目。
- 我有哪些可以复用的工作流。
- 我经常需要生成哪些类型的内容。
- 我希望 AI 在不同场景下如何协作。

当我需要 AI 进入某个工作状态时，不再从头解释，而是直接加载对应的项目上下文和 Skill。

## 为什么需要它

现在使用 AI 最大的问题之一是：**上下文总是散的。**

同一个项目，我可能在 ChatGPT、Claude、Cursor、Codex、Notion、微信、文档里反复解释。每换一个工具，就要重新告诉 AI：

- 项目背景是什么。
- 之前做过哪些决策。
- 我喜欢什么表达风格。
- 这个任务应该按照什么方法处理。
- 哪些信息是重要的，哪些不要重复问。

Context Garden 解决的是这个问题：

> 把散落在不同对话里的关键信息，沉淀成一个可维护的个人上下文仓库。

## 核心理念

- **Context**：AI 工作真正依赖的上下文。
- **Garden**：上下文不是一次性写完的，而是持续种下、修剪、更新和复用的。

## 仓库结构

```text
context-garden/
  README.md
  profile/        # 个人背景和偏好
  projects/       # 长期项目上下文
  skills/         # 可复用 AI 工作流
  templates/      # 常用输出模板
  memory/         # 跨项目重要结论
  bin/cg          # 命令行工具
  docs/           # 使用说明
```

## 快速开始

```bash
# 查看所有 Skill
cg skills

# 拼接 Skill + 项目上下文为完整 prompt
cg use pitch-coach eventalpha

# 同步到 GitHub
cg sync
```

详细用法见 [docs/quick-start.md](docs/quick-start.md)。

## 演进路线

| 阶段 | 内容 | 状态 |
|---|---|---|
| **V1** | Markdown + GitHub，手动维护上下文 | ✅ 已完成 |
| **V2** | 命令行工具 `cg`，快速读取 skill 和 context | ✅ 已完成 |
| **V3** | 跨工具适配，导出到 Claude / Cursor / Codex | 📋 规划中 |
| **V4** | MCP Server，AI 工具直接查询上下文 | 📋 规划中 |

## 隐私原则

这个仓库建议创建为 **private repository**。不要保存 API Key、密码、客户敏感信息等。

**Context Garden 的目标不是收集更多信息，而是让我的重要上下文可以被持续复用。**
