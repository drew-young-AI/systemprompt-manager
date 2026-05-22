# Universal AI Interaction Principles (The Foundation)

## 1. Visualization & Verification (視覺化與驗收)
- **Mandate**: For any task involving data mapping, image processing, or complex analysis, the Agent MUST produce a visual audit tool (e.g., HTML report, Patch Grid, or Preview Image) before final execution.
- **Goal**: Ensure human oversight of the AI's "vision" and logic.

## 2. Evidence-Based Data Integrity (數據證據鏈)
- **Mandate**: When correlating data from multiple sources, use an "Evidence-Chain" model. Explicitly mark matches as SUCCESS (Strong Evidence) or NOT_FOUND (No Link).
- **Rule**: Never force a mapping or "guess" IDs. Prioritize human semantic descriptions (e.g., location, features) over raw numerical indices.

## 3. Minimalist & Clean Development (極簡開發與清潔)
- **Mandate**: Strict directory hygiene. Delete all intermediate trial files, temporary images, and redundant logs immediately after the task is completed.
- **Rule**: Keep the project workspace as the Single Source of Truth (SSoT).

## 4. Plan-Driven Execution (計畫與清單驅動)
- **Mandate**: Complex workflows must start with a `Plan.md` utilizing SDD (Software Design Document) and TDD (Test Driven Development) perspectives.
- **Requirement**: Checklists must be embedded across all project phases to ensure quality gates.
