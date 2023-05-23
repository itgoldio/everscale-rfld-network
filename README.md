# How to develop in rfld

## dapp

UI explorer in [https://rfld.ever.live](https://rfld.ever.live)

graphQl query endpoint [https://rfld-dapp.itgold.io/graphql](https://rfld-dapp.itgold.io/graphql)

monitoring in [https://grafana.itgold.io](https://grafana.itgold.io/d/y8TkYMO7k/rfld-monitoring?orgId=1)

RFLD network config can be obtained [at Custler repo](https://github.com/Custler/main.evs.dev/blob/main/configs/rfld.ton.dev/ton-global.config.json)

```bash
curl -X POST https://rfld-dapp.itgold.io/graphql -H "Content-Type: application/json" -d '{"operationName":null,"variables":{},"query":"{  blocks(    filter: {workchain_id: {eq: -1}}    orderBy: {path: \"gen_utime\", direction: DESC}    limit: 1  ) {    gen_utime\n  }}"}'
```

## Get tokens

Use a Marvin contract

Marvin.abi.json

address: ``0:deda155da7c518f57cb664be70b9042ed54a92542769735dfb73d3eef85acdaf``

### How to get tokens use CLI

IMPORTANT: Fill **Your_Addr**

```bash
export Marvin_Addr="0:deda155da7c518f57cb664be70b9042ed54a92542769735dfb73d3eef85acdaf" 
export Your_Addr="0:0000000000000000000000000000000000000000000000000000000000000000"
tonos-cli config endpoint reset
tonos-cli config --url itgold.io
tonos-cli config endpoint add itgold.io "https://rfld-dapp.itgold.io"
tonos-cli -u 'itgold.io' call 0:deda155da7c518f57cb664be70b9042ed54a92542769735dfb73d3eef85acdaf grant "{\"addr\":\"$Your_Addr\"}" --abi Marvin.abi.json  
```

You get 100 000 rfld coins
