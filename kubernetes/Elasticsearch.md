## setting routing allocation

transient.cluster.routing.allocation.enable 是 Elasticsearch（ES）中用来控制分片分配的一个配置参数。通过设定不同的值，可以限制或启用分片在节点之间的重新分配。对于需要确保集群稳定性、在维护期间减少负载等情况时特别有用。这个配置通常通过ES的集群API动态设置。

可配置的值包括：
all

分片分配的默认设置。允许对所有类型的分片（主分片和副本分片）进行分配。
primaries

只允许主分片的分配。这意味着，仅原有的主分片可以在节点间移动或重新分配，副本分片的分配将会被阻止。
new_primaries

仅允许新的主分片分配。这主要应用于索引时，允许新创建的索引的主分片被分配，但是已有的主分片和所有副本分片的分配都将被阻止。这个选项常用于集群数据回流或迁移时，限制旧数据分片的分配。
none

禁止所有分片的分配。这意呀着无论是新的或者现有的主分片和副本分片都不能在集群中的节点间重新分配。这通常在集群维护期间使用，以避免由于节点重启等操作导致的分片重新分配。
配置的原因：
维护集群稳定性：在进行集群升级、重启或其他维护活动时，限制分片重新分配可以减少额外负载，保持集群稳定。
控制资源使用：在某些情况下，可能需要限制分片移动来控制网络带宽使用，或者避免额外的I/O开销，这对于大规模集群特别重要。
故障恢复：在出现硬件故障或节点不可用的情况下，可能需要手动管理分片分配来确保数据的可用性和恢复。
数据重平衡和优化：在数据迁移或集群扩展时，合理控制分片分配策略可以有效地平衡数据和负载，优化集群性能。
在实际操作中，通过调整这个参数值，管理员可以根据集群的实际情况和需求，进行灵活的管理和调整。调整这些配置时，需要谨慎操作，并充分理解其对集群健康状态和性能的影响。
- setting routing allocation = none
```shell

curl -XPUT 'http://$ecs_ip:9200/_cluster/settings?pretty' -H 'Content-Type: application/json' -d'
{
  "transient": {
    "cluster.routing.allocation.enable": "none"
  }
}
```
- setting routing allocation为all
```shell
curl -XPUT 'http://$ecs_ip:9200/_cluster/settings?pretty' -H 'Content-Type: application/json' -d'
{
  "transient": {
    "cluster.routing.allocation.enable": "all"
  }
}
```
- setting master number
```shell
curl -XPUT localhost:9200/_cluster/settings -d '{
    "transient" : {
        "discovery.zen.minimum_master_nodes" : 2
    }
}'
```

- setting index replace number
```shell
curl -XPUT 'localhost:9200/twitter/_settings?pretty' -H 'Content-Type: application/json' -d'
{
    "index" : {
        "number_of_replicas" : 2
    }
}
'
```
reroute 这个接口没有副作用，任意时刻你看到有未分配分片都可以执行,甚至没有未分配分片时你也可以执行.
```shell
POST _cluster/reroute?retry_failed=true
```
## 查询集群状态

- 查询nodes信息

```
curl -XGET 'http://$ecs_ip:9200/_cat/nodes?pretty'
```

- 查询master信息

```
curl -XGET 'http://$ecs_ip:9200/_cat/master?pretty'
```

- 查询allocation信息

```
curl -XGET 'http://$ecs_ip:9200/_cat/allocation?pretty'
```

- 查询health信息

```
curl -XGET 'http://$ecs_ip:9200/_cat/health?pretty'
```

- 查询indices信息

```
curl -XGET 'http://$ecs_ip:9200/_cat/indices?pretty'
```

