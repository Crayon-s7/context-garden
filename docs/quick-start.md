---
doc: quick-start
audience: 自己
---

# Context Garden 快速开始

## 1. 安装 cg 命令行工具

```bash
# 方式一：直接用路径调用
/root/context-garden/bin/cg skills

# 方式二：加入 PATH（推荐）
echo 'export PATH="$PATH:/root/context-garden/bin"' >> ~/.bashrc
source ~/.bashrc

# 方式三：创建软链接
ln -s /root/context-garden/bin/cg /usr/local/bin/cg
```

安装后验证：

```bash
cg --help
```

## 2. 查看所有 Skill

```bash
cg skills
```

输出类似：

```
Available Skills:
  pitch-coach          当需要路演稿、项目介绍、答辩问题...
  finance-hackathon    当参加金融科技黑客松...
  cloud-solution-architect  当需要设计云架构方案...
  video-prompt-writer  当需要为 AI 视频生成工具...
```

## 3. 查看某个 Skill

```bash
cg skill pitch-coach
```

## 4. 查看项目上下文

```bash
cg context eventalpha
```

## 5. 拼接 Skill + 项目上下文

这是最核心的命令——把 Skill 和项目上下文组合成一段完整 prompt：

```bash
cg use pitch-coach eventalpha
```

输出是一段格式化的文本，可以直接复制到 ChatGPT / Claude / Cursor 使用。

**配合剪贴板**：

```bash
# macOS
cg use pitch-coach eventalpha | pbcopy

# Linux
cg use pitch-coach eventalpha | xclip -selection clipboard
```

## 6. 查看所有模板

```bash
cg templates
```

## 7. 获取某个模板

```bash
cg template pitch-script
```

## 8. 编辑文件

```bash
# 编辑 Skill
cg edit skill pitch-coach

# 编辑项目上下文
cg edit context eventalpha

# 编辑记忆
cg edit memory decisions
cg edit memory weekly
```

默认使用 `$EDITOR`，如果未设置则用 `vim`。

## 9. 同步到 GitHub

```bash
cg sync
```

这会执行 `git add -A && git commit && git push`。

## 10. 创建新项目

```bash
mkdir -p /root/context-garden/projects/my-new-project
```

然后创建 `context.md`：

```markdown
---
project: my-new-project
status: active
---

# 项目上下文

## 一句话定位
（你的项目是什么）
```

用 `cg edit context my-new-project` 可以快速编辑。

## 11. 创建新 Skill

```bash
mkdir -p /root/context-garden/skills/my-skill
```

创建 `SKILL.md`：

```markdown
---
name: my-skill
description: 什么时候用这个 Skill
---

# My Skill

## 目标
（解决什么问题）

## 输出结构
（输出应该长什么样）
```

用 `cg edit skill my-skill` 可以快速编辑。
