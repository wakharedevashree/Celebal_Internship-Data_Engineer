# Shopping Dataset Analysis — Assignment 1

## 📌 Objective
This project performs **data exploration, cleaning, and visualization** on an e-commerce shopping dataset using Python and Pandas, as part of the Data Engineering course Assignment 1.

1. **Data Exploration & Cleaning** — loading, exploring, cleaning, univariate, bivariate, and multivariate analysis with saved chart images and saving the dataset.
 .

---

## 📂 Project Structure

```
shopping-analysis/
│
├── data/
│   └── Combined_dataset.csv                  # Original raw dataset (1000 rows × 24 columns)
│
├── Notebook/
│   ├── Data_Analysis.ipynb   # Step 1-7: load, explore, clean, save
│   
│
├── Cleaned_Dataset (output)/
│   ├── cleaned_dataset.csv                   # Focused, analysis-ready cleaned dataset
│   └── cleaned_dataset_full.csv              # Full cleaned dataset (all columns + derived columns)
│
├── images/                                   # All saved chart images (.png)
│   ├── 01_univariate_rating_histogram.png
│   ├── 02_univariate_price_histogram.png
│   ├── 03_univariate_top_categories_bar.png
│   ├── 04_bivariate_rating_vs_ratingscount.png
│   ├── 05_bivariate_price_vs_discount.png
│   ├── 06_bivariate_price_by_category_boxplot.png
│   ├── 07_multivariate_rating_price_quantity.png
│   ├── 08_multivariate_correlation_heatmap.png
│   ├── 09_multivariate_category_ratingband_totalamount.png
│   
│
└── README.md
```

---

## 📊 Dataset Description

The dataset (`Combined_dataset.csv`) contains **1000 product listings** scraped from an e-commerce platform, with **24 columns**, including:

| Column | Description |
|---|---|
| `product_id` | Unique identifier for each product |
| `title` | Brand / product title |
| `category` | Product category (e.g. backpacks, tshirts, sarees) |
| `rating` | Average customer rating (0–5) |
| `ratings_count` | Number of ratings received |
| `initial_price` | Original listed price |
| `discount` | Discount percentage |
| `final_price` | Selling price after discount |
| `seller_name`, `seller_information` | Seller details |
| `product_details`, `product_specifications`, `breadcrumbs`, etc. | Additional metadata (JSON-style text fields) |

> **Note:** This is **product catalog data**, not transactional/order data — it does not include a real `quantity` column. A `quantity` column (1–5 units) was simulated with a fixed random seed to fulfill the assignment's `total_amount = price * quantity` requirement. This is clearly documented in the notebook.

---

## 🛠️ Steps Performed

### Notebook 1 — Data Exploration & Cleaning
1. **Load** the CSV into a Pandas DataFrame
2. **Explore** the data — `.head()`, `.tail()`, `.shape`, `.columns`, `.dtypes`, `.info()`, `.describe()`
3. **Handle missing values** — identified missing % per column, filled `discount` with 0 and text columns (`seller_name`, `variations`, `videos`, etc.) with placeholders
4. **Basic operations** — column selection and row filtering (e.g. high-rated products, category filters, combined conditions)
5. **Remove duplicates** — checked for duplicate rows and duplicate `product_id`s
6. **Derived column** — cleaned `final_price` to numeric, simulated `quantity`, and computed `total_amount = price * quantity`
7. **Univariate analysis** — distribution of ratings, prices, total amount, and top categories
8. **Bivariate analysis** — rating vs ratings count, price vs discount, price by category, rating vs total amount
9. **Multivariate analysis** — rating/price/quantity scatter, correlation heatmap, category × rating-band
10. **Save cleaned dataset** — exported `cleaned_dataset.csv` and `cleaned_dataset_full.csv`





---

## 🔍 Key Insights

- Ratings are left-skewed — most products cluster between 3.5 and 4.5.
- Final price is right-skewed, with a long tail of higher-priced items.
- `tops`, `dresses`, and `shirts` are the dominant categories by product count.
- `final_price` and `total_amount` are strongly correlated (~0.81), as expected since `total_amount` is derived from price.
- `rating` shows little to no correlation with price, quantity, or total amount — rating alone doesn't predict order value in this dataset.
- Discount percentage doesn't follow a strong pattern relative to price — discounts appear spread fairly evenly across price points.

---
