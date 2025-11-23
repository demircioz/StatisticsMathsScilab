# Exercise 1 – Data Analysis and Manipulation

## Table of Contents

1. Question 1 – Descriptive statistics of numerical variables
2. Question 2 – Frequencies of qualitative variables

---

## Question 1 – Descriptive Statistics

For all numerical variables, present in a table:

* the mean
* the standard deviation
* the minimum
* the maximum
* the quartiles

**To be executed in Scilab, from the root of the git repository:**
**[Scilab Script](scripts/ex1-question1.sce):**

```scilab
--> exec("EXERCICE1/scripts/ex1-question1.sce");
Variable                        Mean      Std Dev      Min   Q1   Median    Q3      Max
----------------------------------------------------------------------------------------------
Student_ID                          353  203.66026        1 176.75      353 529.25      705
Age                           20.659574  1.3992175       18     19       21     22       24
Avg_Daily_Usage_Hours         4.9187234  1.2573945      1.5    4.1      4.8    5.8      8.5
Sleep_Hours_Per_Night         6.8689362   1.126848      3.8      6      6.9    7.7      9.6
Mental_Health_Score           6.2269504  1.1050555        4      5        6      7        9
Conflicts_Over_Social_Media   2.8496454  0.9579678        0      2        3      4        5
Addicted_Score                6.4368794  1.5871649        2      5        7      8        9
--------------------------------------------------------------------------------------------
```

---

## Question 2 – Frequencies of Qualitative Variables

For all other variables (gender, academic level, country, etc.), provide the frequencies of each category, sorted in descending order.

**[Scilab Script](scripts/ex1-question2.sce):**

```scilab
--> exec("EXERCICE1/scripts/ex1-question2.sce");

--- Gender ---
Female : 353
Male : 352

--- Academic_Level ---
Undergraduate : 353
Graduate : 325
High School : 27

--- Country ---
India : 53
USA : 40
Canada : 34
Denmark : 27
France : 27
Ireland : 27
Mexico : 27
Spain : 27
Switzerland : 27
Turkey : 27
UK : 22
Italy : 21
Japan : 21
Russia : 21
Bangladesh : 20
Maldives : 19
Nepal : 19
Pakistan : 19
Sri Lanka : 19
China : 16
Poland : 16
Australia : 14
Germany : 14
South Korea : 13
Brazil : 8
Finland : 8
Malaysia : 8
Netherlands : 8
New Zealand : 8
Singapore : 8
UAE : 8
Afghanistan : 1
Albania : 1
Andorra : 1
Argentina : 1
Armenia : 1
Austria : 1
Azerbaijan : 1
Bahamas : 1
Bahrain : 1
Belarus : 1
Belgium : 1
Bhutan : 1
Bolivia : 1
Bosnia : 1
Bulgaria : 1
Chile : 1
Colombia : 1
Costa Rica : 1
Croatia : 1
Cyprus : 1
Czech Republic : 1
Ecuador : 1
Egypt : 1
Estonia : 1
Georgia : 1
Ghana : 1
Greece : 1
Hong Kong : 1
Hungary : 1
Iceland : 1
Indonesia : 1
Iraq : 1
Israel : 1
Jamaica : 1
Jordan : 1
Kazakhstan : 1
Kenya : 1
Kosovo : 1
Kuwait : 1
Kyrgyzstan : 1
Latvia : 1
Lebanon : 1
Liechtenstein : 1
Lithuania : 1
Luxembourg : 1
Malta : 1
Moldova : 1
Monaco : 1
Montenegro : 1
Morocco : 1
Nigeria : 1
North Macedonia : 1
Norway : 1
Oman : 1
Panama : 1
Paraguay : 1
Peru : 1
Philippines : 1
Portugal : 1
Qatar : 1
Romania : 1
San Marino : 1
Serbia : 1
Slovakia : 1
Slovenia : 1
South Africa : 1
Sweden : 1
Syria : 1
Taiwan : 1
Tajikistan : 1
Thailand : 1
Trinidad : 1
Ukraine : 1
Uruguay : 1
Uzbekistan : 1
Vatican City : 1
Venezuela : 1
Vietnam : 1
Yemen : 1

--- Most_Used_Platform ---
Instagram : 249
TikTok : 154
Facebook : 123
WhatsApp : 54
Twitter : 30
LinkedIn : 21
WeChat : 15
Snapchat : 13
KakaoTalk : 12
LINE : 12
VKontakte : 12
YouTube : 10

--- Affects_Academic_Performance ---
Yes : 453
No : 252

--- Relationship_Status ---
Single : 384
In Relationship : 289
Complicated : 32

--------------------------------------------------------------------------------------------
```

---

## Folder Content

* **`scripts/`**
  Contains the Scilab `.sce` files used to automate the calculations for Q1 and Q2.

* **`img/`**
  Contains screenshots or graphs generated to illustrate the results.

* **`README.md`**
  This file: plan, exercise statement, and links to scripts/images.