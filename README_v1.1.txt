Package documentation adapted for stats.camp.

Data and Code for: The Impact of Air Pollution and Information Access on
Women's Fertility Decisions: Evidence from Thailand
Pasita Chaijaroen and Pallavi Panda (2025)

Data availability and provenance

The authors certify legitimate access and permission to use the study data,
and documented permission to redistribute the data in this package. They
state that all data are publicly available. Secondary data supporting the
study are deposited in the AEA repository, openICPSR project 229043. Data
collected by the authors are available under a Creative Commons
Non-Commercial license.

Raw source data are not supplied in this package; sources are documented
below. The combined, cleaned datasets used for analysis are supplied.
See the Supplemental Online Appendix for further construction details.

Files

- provincepanel.dta: province-level panel used for Table 1, Panel A. It
  combines the listed sources and contains Google search variables, PM2.5
  levels and provincial controls described in Table A1.
- womenpanel.dta: woman-age panel used for Table 1, Panels B and C. It
  combines the listed sources and includes births, fire counts and PM2.5.
- Table_1a.do: regressions for Table 1, Panel A.
- Table_1bc.do: regressions for Table 1, Panels B and C.

Computational workflow

The supplied .do files run in stats.camp with the two analysis datasets at
the repository root. The engine includes the xtivreg2 IV regression and
eststo/esttab functionality used by these scripts. Open and run Table_1a.do
for Panel A, then Table_1bc.do for Panels B and C. Results appear in the
output. Local working copies may need their default paths adjusted.

Upstream data cleaning also used R. Packages required for particular raw
sources are recorded below; raw data cleaning programs are not included.

Raw data sources

Search
- Source: https://trends.google.com/trends/
- Google search data for PM 2.5 and Air purifier.
- Each province's search index is its breakdown multiplied by the country's
  overall search.

PM2.5
- Source: https://gmao.gsfc.nasa.gov/reanalysis/MERRA-2/data_access/
- NASA MERRA2 tavgM_2d_aer_Nx.
- R packages: ncdf4, sp, raster, doSNOW, foreach, latticeExtra, doParallel.

Fire hotspots
- Source: https://firms.modaps.eosdis.nasa.gov/download/create.php
- MODIS hotspots from EARTHDATA.
- R packages sp and raster are used for projection.

Wind direction
- Source: https://downloads.psl.noaa.gov/Datasets/ncep/
- NCEP uwnd.sfc.YEAR and vwnd.sfc.YEAR datasets.
- R package netcdf.

Weather
- Source: https://www.ncdc.noaa.gov/cdo-web/search?datasetid=GHCND
- GHCN rainfall and average temperature.
- Download daily summaries for Thailand. Assign each province the station
  nearest its centroid; aggregate daily values to monthly and annual averages.

MICS data
- Source: https://mics.unicef.org/surveys
- UNICEF MICS Thailand, 2019 survey.
- Extract women's births information and combine it with the household
  roster to construct the woman-age panel.

Education
- Source: https://www.nso.go.th/nsoweb/nso/survey_detail/9u
- Labor Force Survey, National Statistical Office Thailand.
- Download Q4 data tables for 2016-2020. Calculate the share with at least
  high-school education from provincial population tables, ages 15 and above.

Share of non-agricultural land
- Source: https://www.nso.go.th/nsoweb/nso/statistics_and_indicators?impt_branch=319
- Statistics of Land Utilization by Region and Province, Office of
  Agricultural Economics.
- Divide each province's non-agricultural land area by its total land area.

Household expenditure
- Source: https://www.nso.go.th/nsoweb/nso/survey_detail/qC
- Household Socio-Economic Survey, National Statistical Office Thailand.
- Use average monthly household expenditures.

Average population age
- Source: https://www.nso.go.th/nsoweb/nso/statistics_and_indicators?impt_branch=300
- House Registration, Department of Provincial Administration.
- Download annual provincial population by age group for 2012-2022.
- Calculate the population-weighted average of age-group midpoints.

Population size
- Source: https://www.nso.go.th/nsoweb/nso/statistics_and_indicators?impt_branch=300
- House Registration, Department of Provincial Administration.
- Download annual provincial population by age group for 2012-2022 and
  extract each province's total population.

Adapted from the authors' README_v1.1.pdf in official AEA deposit 229043, V1.
The original PDF is preserved in the maintainer's external preparation archive.
