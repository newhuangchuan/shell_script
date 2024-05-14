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
- setting
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


