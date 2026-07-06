---
project: aliyun-solutions
type: patterns
updated: 2025-01-01
---

# 阿里云架构模式库

> 常见架构模式的标准化描述，方便快速组合。

## 模式 1: Web 应用高可用

```
DNS → SLB → ECS 集群 → RDS (主备)
                     ↘ Redis
                     ↘ OSS (静态资源)
```

**适用场景**：中等流量 Web 应用。
**关键产品**：SLB、ECS、RDS、Redis、OSS。
**成本区间**：（根据规格补充）。

## 模式 2: 大数据处理

```
数据源 → DataHub → MaxCompute → Quick BI
                    ↘ DataWorks (调度)
```

**适用场景**：海量数据分析与报表。
**关键产品**：DataHub、MaxCompute、DataWorks、Quick BI。

## 模式 3: AI 推理服务

```
API Gateway → 函数计算 → 模型服务
              ↘ NAS (模型存储)
```

**适用场景**：AI 模型推理 API。
**关键产品**：API Gateway、函数计算、NAS。

## 决策树

```
是否需要 GPU？
  → 是：PAI / GPU ECS
  → 否：是否需要弹性？
         → 是：函数计算 / ECI
         → 否：ECS
```
