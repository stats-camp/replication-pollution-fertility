# Replication: The Impact of Air Pollution and Information Access on Women's Fertility Decisions — Evidence from Thailand

Pasita Chaijaroen and Pallavi Panda (2025).

This repository is an adaptation of the paper's official replication package
for [stats.camp](https://stats.camp), so the analysis can be run directly in
the browser.

**Open in stats.camp:**
[Table_1a.do](https://stats.camp/app?open=https%3A%2F%2Fgithub.com%2Fstats-camp%2Freplication-pollution-fertility.git&file=Table_1a.do) ·
[Table_1bc.do](https://stats.camp/app?open=https%3A%2F%2Fgithub.com%2Fstats-camp%2Freplication-pollution-fertility.git&file=Table_1bc.do)

## The study

Combines Google search intensity for "PM 2.5" and "air purifier", satellite
PM2.5 and fire-hotspot data, and UNICEF MICS birth histories into two panels
for Thailand: a province-month panel and a woman-age panel. Fixed-effects and
IV regressions (fire counts instrument for pollution) estimate how pollution
information access affects fertility decisions.

## Contents

| Path | Description |
| --- | --- |
| `Table_1a.do` | Table 1 Panel A: province panel regressions |
| `Table_1bc.do` | Table 1 Panels B and C: woman-age panel regressions |
| `provincepanel.dta` | Province panel: search indices, PM2.5, controls |
| `womenpanel.dta` | Woman-age panel: births, fire counts, PM2.5 |
| `README_v1.1.txt` | Package README adapted for stats.camp, including all raw data sources |

## What runs

Both do-files run unchanged in stats.camp. On 2026-10-15 they were executed in
the native engine on scratch copies and compared with a reference run using
`xtivreg2`, `ivreg2`, `ranktest` and `estout` from SSC. Every coefficient, standard error,
first-stage statistic, Kleibergen–Paap and Cragg–Donald statistic and all three
`esttab` tables (with `p`, `indicate()`, `noomit`, `mtitle()`) are equal (1,462
result rows). The `eststo name:` prefix, `areg` with `cluster()`/`vce(cluster)`
and `absorb()`, `xtivreg2 ..., cluster() first fe` with `L.` operators, and
`tab ..., gen()` all work.

Remaining differences are in the transcript, not the estimates:

- In three of the twelve `xtivreg2` fits the second-stage model `F( 27, 16)`
  is `.` or a huge number where ivreg2 prints a finite value; with 17 clusters
  and 27 regressors the cluster-robust covariance is singular and ivreg2 uses
  `invsym`'s generalized inverse.
- The engine prints base-level rows (`2016b | 0 (base)`), which the reference output hides
  by default, and shows 8–9 significant digits for `areg`/`xtivreg2`
  coefficients where the reference output shows 7.
- `xtivreg2` abbreviates `area_sh_urban` as `area_sh_urba` (reference:
  `area_sh_ur~n`) and prints `L.search_PM25` on one row (reference: a
  `search_PM25` header with an `L1.` sub-row).

The package has no figures.

## Changes from the original package

The do-files and analysis data are unchanged. The scripts run with the data
at the repository root, as the authors instruct. The package README was
adapted as `README_v1.1.txt` for stats.camp; its original PDF is preserved
in the maintainer's external preparation archive.

## Source and attribution

Chaijaroen, Pasita, and Pallavi Panda. 2025. "Data and Code for: 'The Impact
of Air Pollution and Information Access on Women's Fertility Decisions:
Evidence from Thailand'." American Economic Association [publisher],
Inter-university Consortium for Political and Social Research [distributor].
[https://doi.org/10.3886/E229043V1](https://doi.org/10.3886/E229043V1)

The authors state that all data are publicly available, that they have
documented permission to redistribute the data in the package, and that the
data they collected are provided under a **Creative Commons Non-Commercial
(CC BY-NC)** license. This repository redistributes the analysis code and data unchanged,
with adapted documentation, for non-commercial, educational replication. Please cite the paper and the
replication package if you use these materials.
