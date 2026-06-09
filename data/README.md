# Data Notes

本项目使用台北 YouBike 2024 年 10 月公开骑行日志。由于原始 CSV、清洗后 CSV 和 SQLite 数据库体积较大，默认不提交到 GitHub。

## 本地数据文件

以下文件保留在本地用于完整复现，但已被 `.gitignore` 排除：

```text
data/raw/202410_youbike.csv
data/raw/202410_youbike_clean.csv
data/youbike_warehouse.db
```

以下大型中间表也默认不提交：

```text
data/processed/borrow_hourly.csv
data/processed/return_hourly.csv
data/processed/demand_hourly.csv
data/processed/flow_hourly.csv
data/processed/station_type_hourly.csv
```

仓库中建议保留体积较小、适合展示的汇总结果，例如：

```text
data/processed/station_profile.csv
data/processed/station_risk.csv
data/processed/top20_risk_stations.csv
data/processed/dispatch_strategy.csv
data/processed/forecast_7days.csv
reports/tables/*.csv
reports/figures/*.png
dashboard/*.png
```

## 复现流程

1. 将原始 YouBike CSV 放入 `data/raw/`。
2. 从项目根目录启动 Jupyter Notebook。
3. 按 README 中的 Notebook 顺序运行。
4. 如需 SQL 分析，运行 `notebooks/ps_create_database_for_sql.ipynb` 生成本地 SQLite 数据库。

## GitHub 上传建议

GitHub 普通仓库不适合直接上传 GB 级数据文件。如果需要分享完整数据，可以使用：

- GitHub Releases
- Google Drive / OneDrive
- Kaggle Dataset
- Hugging Face Dataset
- Git LFS

作品集仓库本身建议聚焦代码、方法、图表、核心结果和业务解释。
