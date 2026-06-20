# 🛒 Amazon Shopping Dataset — EDA & Data Cleaning

**Assignment 1 | Basic Data Exploration and Cleaning using Pandas**

---

##  Objective
Perform exploratory data analysis (EDA), data cleaning, and derive meaningful insights
from a combined Amazon product dataset spanning 9 categories.

---

##  Folder Structure

```
Assignment1/
│── data/
│   ├── combined_dataset.csv     ← raw combined file
|__ Cleaned_Dataset/     
│   └── cleaned_amazon_dataset.xls  ← cleaned + feature-engineered file
│── Notebook/        ← full Jupyter Notebook
    |__Data_Analysis
│── README.md
```

---

##  Dataset

| Category | Source File |
|---|---|
| Audio / Video | amazon_audio_video.csv |
| Camera | amazon_camra.csv |
| Car Accessories | amazon_car_accessories.csv |
| Laptop | amazon_laptop.csv |
| Men's Clothing | amazon_men.csv |
| Men's Shoes | amazon_men_shoe.csv |
| Mobile | amazon_mobile.csv |
| Movies | amazon_movies.csv |
| Toys | amazon_toys_1.csv |

**Raw combined rows:** ~1,00,678  
**After cleaning:** ~29,000 unique products

---

##  Steps Performed

### Step 1 — Load Data
- Loaded all 9 CSV files using `pandas`
- Standardised column names across files
- Combined into a single DataFrame

### Step 2 — Understand Data
- Used `.head()`, `.tail()`, `.shape`, `.info()`, `.describe()`
- Identified missing values and data type issues

### Step 3 — Data Cleaning
- Converted price columns from string/mixed to `float`
- Removed commas from `num_reviews` (e.g. `"53,617"` → `53617`)
- Filled missing values appropriately
- Removed rows with no price or no product name
- Removed duplicate product entries

### Step 4 — Feature Engineering
- `price_difference` = real_price − price (discount amount in $)
- `discount_pct` = (price_difference / real_price) × 100
- `popularity_score` = log(num_reviews + 1)
- `price_tier` = Budget / Mid-Range / Premium
- `has_discount` = True/False flag

### Step 5 — Analysis
- **Univariate:** price distribution, category counts, discount distribution
- **Bivariate:** correlation matrix, price vs popularity scatter
- **Category-level:** avg price, avg discount, top reviewed products

### Step 6 — Visualizations (9 Charts)
1. Bar chart — Products per category
2. Histogram — Price distribution
3. Bar chart — Average price per category
4. Boxplot — Price spread per category
5. Bar chart — Average discount % per category
6. Histogram — Discount % distribution
7. Stacked bar — Price tier per category
8. Heatmap — Correlation matrix
9. Scatter — Price vs Popularity Score

### Step 7 — Key Insights
- Men's Clothing & Shoes dominate product count
- Laptops and Mobiles are the priciest categories
- Camera & Car Accessories offer the highest average discounts
- Price is NOT strongly correlated with popularity
- Majority of products are priced under $100

---

##  Libraries Used
- `pandas` — data loading, cleaning, analysis
- `numpy` — numeric operations
- `matplotlib` — plotting
- `seaborn` — statistical visualizations

---

