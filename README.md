# ENTREPRENEURSHIP, INVESTMENT, AND REGIONAL ECONOMIC DEVELOPMENT IN VIETNAM  
🛠️ **Tech Stack**: Stata (panel data, FE/RE, FGLS, PCSE, interaction models)

---

## (i). Overview

This project examines how **entrepreneurship development** across Vietnamese provinces is shaped by **private investment, public investment, and foreign direct investment (FDI)**, and how these effects are **conditioned by institutional quality**, measured through the **Provincial Competitiveness Index (PCI)**.

Using a **balanced provincial panel dataset for Vietnam (63 provinces, 2016–2022)**, the study moves beyond average national effects to uncover **regional heterogeneity** and **governance-conditioned investment mechanisms**. A key contribution is the distinction between **FDI quantity** and **FDI efficiency**, allowing the analysis to assess not only how much FDI enters a province, but how effectively it supports entrepreneurial activity.

The project addresses core econometric challenges in regional development research, including **cross-sectional dependence, heteroskedasticity, serial correlation**, and **institutional interaction effects**.

---

## (ii). Data Description

- **Unit of analysis**: Vietnamese provinces  
- **Period**: Annual panel, **2016–2022**  
- **Sources**: General Statistics Office (GSO), PCI database, official investment statistics  

### Key Variables
- **Entrepreneurship (ENT)** – proxy for entrepreneurial activity (dependent variable)  
- **Private Investment (PRI)** – domestic private capital  
- **Public Investment (PUB)** – government capital expenditure  
- **Foreign Direct Investment (FDI)** – capital inflows and project counts  
- **FDI Efficiency (FDIE)** – DEA-based efficiency measure  
- **Institutional Quality (PCI)** – composite governance index  
- **Controls**: GRDP per capita, labor force, urbanization, infrastructure indicators  

All monetary variables are log-transformed to allow elasticity-based interpretation.

---

## (iii). Methodology

### 🔍 Pre-Estimation Diagnostics
- Descriptive statistics and correlation analysis  
- Multicollinearity checks (VIF)  
- Cross-sectional dependence tests  

### 📈 Baseline Panel Models
- **OLS**, **Fixed Effects (FE)**, and **Random Effects (RE)** estimations  
- Model selection guided by **F-tests, Breusch–Pagan LM tests, and Hausman tests**  

### ⚙️ Main Estimators
To ensure reliable inference under provincial heterogeneity:
- **FGLS** – efficient under heteroskedasticity and AR(1) disturbances  
- **PCSE** – robust to cross-sectional dependence and panel-specific error structures  

### 🧩 Extended Specifications
- Interaction models:
  - **FDI × PCI**
  - **FDIE × PCI**
- Regional subsample regressions across Vietnam’s major economic regions  
- Robustness checks using alternative FDI measures (capital vs. project counts)

---

## (iv). Modeling Pipeline

```text
STEP 1: Data cleaning and descriptive analysis
→ STEP 2: Correlation and multicollinearity diagnostics
→ STEP 3: OLS / FE / RE baseline estimation
→ STEP 4: Model selection and residual diagnostics
→ STEP 5: FGLS estimation (efficiency-focused)
→ STEP 6: PCSE estimation (robust inference)
→ STEP 7: Institutional interaction models (FDI × PCI, FDIE × PCI)
→ STEP 8: Regional heterogeneity analysis
→ STEP 9: Robustness checks and synthesis
```
## (v). Main Findings (Summary)

- Private investment is the most stable and consistent driver of entrepreneurship across provinces.
- FDI promotes entrepreneurship on average, but its effectiveness depends critically on institutional quality.
- FDI efficiency outperforms FDI volume, highlighting that **how investment is used matters more than how much enters**.
- High PCI levels may crowd out local entrepreneurship by intensifying competition and compliance costs, revealing a **governance paradox**.
- Strong regional heterogeneity exists: coastal and industrial regions benefit differently from FDI compared to agricultural and less-developed regions.

---

## (vi). Economic Relevance

- Demonstrates that **entrepreneurship-led growth is institution-dependent**, not investment-automatic.
- Highlights the importance of **balancing governance quality with entrepreneurial inclusiveness**.

Provides insights for:
- Provincial investment attraction strategies
- PCI reform and regulatory calibration
- SME support policies under high-FDI environments

---

## (vii). Repository Contents

- `/Stata_Script.do` – Full econometric workflow (OLS/FE/RE → FGLS → PCSE → interactions → regional analysis)
- `/Dataset.dta` – Provincial-level panel dataset
- `/Methods and Results.pdf` – Detailed methodology and empirical discussion
- `/README.md` – Project documentation

---

## (viii). Citation

> **Toan N.T.P., et al. (2024)**  
> *ENTREPRENEURSHIP AND REGIONAL ECONOMIC GROWTH IN VIETNAM: THE ROLE OF PRIVATE, PUBLIC AND FOREIGN INVESTMENTS AND ITS EFFICIENCY WITH INSIGHTS FROM THE PROVINCIAL COMPETITIVENESS INDEX.*  
> College of Economics, Law and Government - CELG 2024, University of Economics Ho Chi Minh City (UEH)

>  Based study: Nguyen, Phuc Hung, How Close Is Close? Spatial Spillover and Boundary Attenuation Effect of Inward FDI On Local Firm Births (April 01, 2024). Available at SSRN: https://ssrn.com/abstract=5680571 or http://dx.doi.org/10.2139/ssrn.5680571
---

## (ix). License

📜 MIT License

---

## (x). Acknowledgements

This research was conducted under the **CELG Student Awards 2024** framework.  
Special thanks to the CELG academic committee for methodological guidance and research support.

---

## (xi). Keywords

Entrepreneurship · Foreign direct investment · Institutional quality · PCI · Regional development · Vietnam · FGLS · PCSE



