# Resume Project Summary

## 中文简历版本

**共享单车需求预测与运营分析项目 | Python, SQL, Prophet, Tableau**

- 基于台北 YouBike 2024 年 10 月 525 万+ 条骑行日志，完成数据清洗、特征构建、小时级需求聚合和可视化分析。
- 构建 `net_flow` 与 `imbalance_score` 指标，识别站点潮汐流动方向和高峰期供需失衡风险。
- 将站点分为潮汐流入型、潮汐流出型、通勤型和稳定休闲型，并生成差异化补车、清车和车位预留策略。
- 使用 Prophet 预测未来 7 天需求趋势，结合 SQL 查询和 Tableau 风格 dashboard 输出运营分析结果。

## English Resume Version

**Bike-Sharing Demand Forecasting and Operations Analytics | Python, SQL, Prophet, Tableau**

- Analyzed 5.25M+ Taipei YouBike trip records from October 2024, covering data cleaning, feature engineering, hourly demand aggregation, and visualization.
- Built `net_flow` and `imbalance_score` metrics to identify tidal flow patterns and station-level supply-demand imbalance risks.
- Segmented stations into inflow, outflow, commuter, and stable leisure types, then generated targeted dispatch recommendations.
- Applied Prophet to forecast short-term demand and delivered SQL analysis outputs plus dashboard-ready visualizations for operational decision-making.

## 面试讲述框架

可以按以下顺序讲：

1. **业务背景**：共享单车高峰期经常出现无车可借或无位可还，本质是站点间供需时空错配。
2. **指标设计**：用小时级借车量、还车量和净流量刻画每个站点的流入流出方向。
3. **站点分层**：基于早晚高峰净流量和需求占比，将站点分为不同运营类型。
4. **风险识别**：用 `imbalance_score` 找出高风险站点，帮助运营团队确定调度优先级。
5. **策略输出**：针对不同站点类型给出补车、清车、预留车位或常规巡检建议。
6. **预测补充**：用 Prophet 预测未来短期需求，为调度提前量提供参考。

## GitHub 项目简介

An end-to-end bike-sharing analytics project using 5.25M+ Taipei YouBike trip records to identify demand peaks, station-level tidal flows, operational risk, dispatch strategies, and short-term demand forecasts.
