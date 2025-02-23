# Hotmart Technical Case: Analysis about Sales Recovery

Backgroud:

Sales recovery refers to the strategy or tools that help complete sales for those who, for some reason, did not complete them. It is a resource that should be applied to any online business. This is because it allows you to rescue people who did not complete the purchase for different reasons: lack of limit on the card, balance in the account, objections to the purchase, among others. One of Hotmart tools recovers sales when the customer does not have a sufficient limit on their credit card. When an attempt to purchase in installments is denied due to insufficient balance on the part of the Buyer, the tool transforms the transaction into a recurring one to prevent the sale from being lost. Thus, the buyer will receive monthly charges from the Hotmart Payment System until the total purchase amount is paid.

- **Problem**: The main problem is sales that are not complete, it can be for sales cancelled and refund. 
- **Goals**: Analysis of the data to recognize stands that will help to identify the main reasons that the people are not completely yours shopping. Besides, find other ways to improve the sales rate completed, in addition to the recovery tool shown in case text.
- **Database**: There are three tables (producers, products and sales)

---

## 📂 Repository Structure

```
├── data
|   ├── Producer.csv                            # Table Producer in format .csv
|   ├── Products.csv                            # Table Products in format .csv
|   ├── Sales.csv                               # Table Sales in format .csv
|   └── sales.db                                # Tables cited above in SQLite database, after data cleaning and validation
|
├── docs  
|   └── Processo Seletivo - Technical Case.pdf  # File with content for case development 
|                                        
├── src                                         # Prinpal directory about analysis and notebook
│   ├── analysis
│   │   ├── 1_top_products_sales.sql            # SQL code for first case question
│   │   ├── 2_top_producer.sql                  # SQL code for second case question
│   │   ├── 3_sales_per_week.sql                # SQL code for third case question
│   │   ├── 4_loss_performance.sql              # SQL code for fourth case question
│   │   ├── 5_retention.sql                     # SQL code for Fifth case question
│   │   ├── 6_top_producer2.sql                 # SQL code for sixth case question
│   │   └── complete_table.sql                  # SQL code for select all table with respective join
│   ├── notebook
│   │   ├── 1_data_ingestion.ipynb              # Script for data cleaning and validation, and create db in SQLite
│   │   └── 2_data_analysis.ipynb               # Script for detail analysis about case questions
|
├── .gitignore                                  # File for informe folders/files ignore
└── README.md                                   # Project principal documentation
```
---

## 📜 Project Escope

### 1. Case Questions

1. The top product with most valid purchases (without refund, cancellation or chargeback), in each niche with deactivated membership area and activated recovery.
2. The top 5 producers who joined Hotmart from 2019 onwards and achieved the highest commission using recovery.
3. List the number of completed sales from Brazilian producers in each weekday for the years 2020, 2021 and 2022 and the variation between the weekday sales from 2021/2020 and 2022/2021.
4. List each country's loss performance for each producer country, considering only products from type ‘Assinatura’. loss_performance = (cancelations+refunds)/total_sales
5. Looking at the products registered after 01/2019, with at least one cancellation and from the product type ‘Curso’, calculate the average retention performance for commission, of all products, with recovery active and without recovery active. Is there any difference for product performance considering products with the recovery tool activated? average_commission_retention = commission_received/total_comission
6. If you need to create a ranking of the top creators of 2023, which variables you consider crucial for ranking them? You can also create variables from the data. You must explain your reasoning and your choice of variables and show how this reflect in your SQL code.

### 2. Data Ingestion

1. Data exploration and data cleaning, necessary to explore the data and to work SQL after that.
2. Create database in SQLite

### 3. Data Analysis

1. Create and generate queries for response the case questions in SQL Code.
2. Use the queries built with SQL for details analysis, generate insights and recomentations.

---

## 💻 Technologies Used

- **Jupyter Notebook**: Interactive environments for producing form framework python code.
- **SQLite**: Used with database locally to create tables after data cleaning.
- **SQL Language**: Program Language used for create queries
- **Python 3.12.2**: Program language used for detailed analysis

    - **pandas**: Manipulation and organization data.
    - **sqlalchemy**: Create and open SQL files form SQLite
    - **matplotlib** and **seaborn**: Para visualizações gráficas.
---

## 📜 Key insights and recommendations

1. In according with analysis realized, it was noticed very crucial to increase use the recovery active tool, because it is related with comission received rate.
2. Analyze culture and habits of comsumer in diferent regions (benchmark), because it was sow South American Countries is more effective then North American Countries.
3. Try work when possible with sales of signature products type, because amost all products have recovery active, and this to improve a lot of with sales.
4. Get more data about payment types, because I could analyze the best. It could make promotion or incentivate the people payment with the best payment types, or mescle this with other in the sales moment.
---

## 📞 Contato

Alisson Aragão dos Santos | [E-mail](alissonaragao1@gmail.com) | [LinkedIn](https://www.linkedin.com/in/alisson-arag%C3%A3o-dos-santos-459297120/)
e=o0ekZb">clique aqui</a>

## Se quiser começar a explorar o projeto, <a href="https://github.com/alisson-as/HotmartCase/blob/main/src/notebook/1.%20data_ingestion.ipynb">clique aqui</a>
