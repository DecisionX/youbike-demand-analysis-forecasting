-- 0.查询数据库中拥有的所有table
SELECT name
FROM sqlite_master
WHERE type='table';

-- 1.识别全天需求高峰期
SELECT
    hour,
    SUM(borrow_demand) AS total_borrow,
    SUM(return_demand) AS total_return
FROM flow_hourly
GROUP BY hour
ORDER BY hour;

-- 2.工作日vs周末需求分析：分析通勤与休闲的需求差异
SELECT
    CASE
        WHEN weekday IN (5, 6)
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    SUM(borrow_demand) AS total_borrow
FROM flow_hourly
GROUP BY day_type;

-- 3.识别核心区域：即TOP20的热门站点
SELECT
    station,
    SUM(borrow_demand) AS total_borrow
FROM flow_hourly
GROUP BY station
ORDER BY total_borrow DESC
LIMIT 20;

-- 4.查询站点类型的数量分布：用于分析站点结构
SELECT
    station_type,
    COUNT(*) AS station_count
FROM station_profile
GROUP BY station_type
ORDER BY station_count DESC;

-- 5.查询不同站点类型的平均风险：判断那一类站点的风险最大
SELECT
    p.station_type,
    AVG(r.imbalance_score) AS avg_risk
FROM station_profile p
JOIN station_risk r
ON p.station = r.station
GROUP BY p.station_type
ORDER BY avg_risk DESC;

-- 6.查询TOP20的高风险站点：找出调度压力最大的区域
SELECT
    station,
    imbalance_score,
    risk_level
FROM station_risk
ORDER BY imbalance_score DESC
LIMIT 20;

-- 7.查询风险等级分布：查看整体的风险结构
SELECT
    risk_level,
    COUNT(*) AS station_count
FROM station_risk
GROUP BY risk_level
ORDER BY station_count DESC;

-- 8.查询不同站点对应的调度策略：用于运营策略分析
SELECT
    p.station_type,
    d.dispatch_strategy,
    COUNT(*) AS station_count
FROM station_profile p
JOIN dispatch_strategy d
ON p.station = d.station
GROUP BY
    p.station_type,
    d.dispatch_strategy
ORDER BY station_count DESC;

-- 9.联合查询站点的站点类型，风险指数imbalance_score，风险等级以及调度策略
SELECT
    r.station,
    p.station_type,
    r.imbalance_score,
    r.risk_level,
    d.dispatch_strategy
FROM station_risk r
JOIN station_profile p
ON r.station = p.station
JOIN dispatch_strategy d
ON r.station = d.station
WHERE r.risk_level = 'High'
ORDER BY r.imbalance_score DESC;

-- 10.查询不同类型的站点
SELECT *
FROM station_profile
WHERE station_type = '潮汐流入型';

SELECT *
FROM station_profile
WHERE station_type = '通勤型';

SELECT *
FROM station_profile
WHERE station_type = '稳定休闲型';

-- 11.查询早高峰净流出的TOP20：用于识别早高峰大量出车的区域
SELECT
    station,
    morning_net_flow_sum
FROM station_profile
ORDER BY morning_net_flow_sum DESC
LIMIT 20;

-- 12.查询晚高峰净流入的TOP20：用于识别下班回流区域
SELECT
    station,
    evening_net_flow_sum
FROM station_profile
ORDER BY evening_net_flow_sum ASC
LIMIT 20;

-- 13.查询需求波动最大的TOP20站点：用于识别需求不稳定的区域
SELECT
    station,
    volatility
FROM station_profile
ORDER BY volatility DESC
LIMIT 20;

-- 14.查看整体数据规模
SELECT
    COUNT(*) AS total_records
FROM flow_hourly;

-- 15，查看总站点的数量
SELECT
    COUNT(DISTINCT station) AS total_stations
FROM flow_hourly;