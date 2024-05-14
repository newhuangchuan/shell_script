## setting routing allocation
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

