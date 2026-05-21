# /systemprompt - System Prompt Manager

**簡介**: 統一管理 Copilot CLI、Gemini CLI、Antigravity 三個工具的 system prompt。

## 使用方式

### 1. 更新所有工具的 System Prompt
```
給我你的新 system prompt 文本，我會自動：
- 寫入 ~/.copilot/copilot-instructions.md
- 寫入 ~/.gemini/GEMINI.md
- 寫入 ~/.antigravity/system-prompt.md
- 驗證三個檔案內容一致
- 測試我是否成功讀取新的 prompt
```

### 2. 驗證當前 Prompt
```
只需告訴我："驗證 system prompt"
我會檢查三個工具的設定並回報狀態
```

### 3. 顯示當前 Prompt
```
告訴我："顯示 system prompt"
我會列出目前三個工具使用的 system prompt 內容
```

## 工作流程

### Step 1: 準備新的 Prompt
整理你的 system prompt 文本（支援任何語言、格式）

### Step 2: 提交給我
將完整 prompt 貼在訊息中，告訴我要更新

### Step 3: 自動執行
我會：
```
1. 解析 prompt 內容
2. 寫入三個 .md 檔案
3. 驗證內容一致性
4. 測試我對新 prompt 的理解
5. 回報完成狀態和驗證結果
```

## 技術細節

**配置檔位置**:
- Copilot: `~/.copilot/copilot-instructions.md`
- Gemini: `~/.gemini/GEMINI.md`
- Antigravity: `~/.antigravity/system-prompt.md`

**支援格式**: Markdown (.md)
**可逆性**: 所有更新可透過編輯原檔案還原
**同步**: 三個工具自動同時更新，保持一致

## 範例

**你的輸入**:
```
/systemprompt update
[貼入你的 18 點 system prompt]
```

**我的回應**:
```
✅ 成功更新三個工具的 system prompt
✅ 驗證內容已一致
✅ 我已讀取並應用新的 prompt 原則
```

## 快速參考

| 需求 | 說法 |
|------|-----|
| 更新 prompt | 給我新的 system prompt |
| 驗證狀態 | 驗證 system prompt |
| 查看內容 | 顯示 system prompt |
| 重置 | 重置為預設 system prompt |

---

**自動化指令** (optional):
如需使用命令行，可用: `bash ~/.copilot/update-systemprompt.sh < new-prompt.txt`
