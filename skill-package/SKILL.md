---
name: systemprompt-manager
description: 管理與同步 Gemini, Copilot CLI 的系統提示詞 (System Prompt)。使用此技能來更新您的 AI 憲法並將其同步至所有相關配置檔。
---

# System Prompt Manager

此技能用於統一管理 Gemini CLI, Copilot CLI 及相關工具的系統提示詞。

## 使用說明

1. 修改 `skills/systemprompt.md` 以更新您的統一指令。
2. 執行同步腳本：
   ```bash
   /Users/drew/Project/systemprompt-manager/scripts/update-systemprompt.sh
   ```
3. 執行後，您的所有 CLI 工具將立即採用最新的「統一憲法」。
