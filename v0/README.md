# 會計應用程式
會計是獨立的應用程式，對外提供介面以供外部程式要求填入帳項，以及索取歷史紀錄，並且，系統內以限制的操作動作，保證不由本應用程式發生不適當的行為：如變更紀錄等。

### 介面
以 RESTful 介面表示，包括以下幾個呼叫點

- `PUT /firm/{:VALUE}` 登記組織單位
- `PUT /entry/{:ACCOUNT}` `BODY {:ENTRY}` 登記帳項

### 帳項
帳項為雙帳格式，概括格式如下

```
{ "firm": "Apex enterprise, CO",
  "pass key": {:PASSKEY},
  "timestamp in seconds": 1623324596,
  "debt": [
    { "account": "1101001", "value": 100.0 },
    { "account": "1110101", "value":  50.0 }
  ],
  "credit": [
    { "account": "2010001", "value": 140.0 },
    { "account": "4201001", "value":  10.0 }
  ]
}
```
