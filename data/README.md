# 來源資料及處理

## 會計項目
- 出處：[經濟部商業司全國商工行政服務入口網](https://gcis.nat.gov.tw/mainNew/subclassNAction.do?method=getFile&pk=708)[商業會計項目表](https://gcis.nat.gov.tw/mainNew/subclassNAction.do?method=getFile&pk=969)。
- 轉換為 SQL 
  ```
  make -f "account items.mk"     ### 將 SQL 輸出到畫面
  make -f "account items.mk" out ### 將 SQL 輸出到檔案 "account items.sql"
  ```
  - 註：轉換程式使用 [SWI-Prolog](https://swi-prolog.org/)
