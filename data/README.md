# 📦 Dataset

This project uses the **Brazilian E-Commerce Public Dataset by Olist**.

The dataset contains information about orders, customers, sellers, products, payments, reviews and geolocation.

## 📥 Download

The original dataset can be downloaded from Kaggle:

**Brazilian E-Commerce Public Dataset by Olist**

After downloading, extract the CSV files into the local `data/` directory.

Expected files include:

```text
olist_customers_dataset.csv
olist_geolocation_dataset.csv
olist_order_items_dataset.csv
olist_order_payments_dataset.csv
olist_order_reviews_dataset.csv
olist_orders_dataset.csv
olist_products_dataset.csv
olist_sellers_dataset.csv
product_category_name_translation.csv
```

## ⚠️ Repository Policy

The raw CSV files are **not stored in this GitHub repository**.

They are excluded using `.gitignore` because the dataset is relatively large and does not need to be version-controlled together with the analytical code.

Your local structure should look like:

```text
data/
├── README.md
├── olist_customers_dataset.csv
├── olist_geolocation_dataset.csv
├── olist_order_items_dataset.csv
├── olist_order_payments_dataset.csv
├── olist_order_reviews_dataset.csv
├── olist_orders_dataset.csv
├── olist_products_dataset.csv
├── olist_sellers_dataset.csv
└── product_category_name_translation.csv
```

The CSV files will remain available locally for running the notebooks and database scripts, but Git will not upload them to GitHub.
