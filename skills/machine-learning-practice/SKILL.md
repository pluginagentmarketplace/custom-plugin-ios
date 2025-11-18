---
name: machine-learning-practice
description: Practical machine learning skills including data preprocessing, feature engineering, model evaluation, hyperparameter tuning, and production ML pipelines. Use when building ML models, optimizing performance, or deploying ML systems.
---

# Machine Learning Practice

Build production-ready machine learning systems from data to deployment.

## Quick Start

### Your First ML Pipeline
```python
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score, precision_score

# 1. Load and explore data
import pandas as pd
df = pd.read_csv('data.csv')
print(df.describe())  # Understand your data

# 2. Prepare data
X = df.drop('target', axis=1)
y = df['target']
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

# 3. Train model
model = RandomForestClassifier(n_estimators=100)
model.fit(X_train, y_train)

# 4. Evaluate
y_pred = model.predict(X_test)
print(f"Accuracy: {accuracy_score(y_test, y_pred):.4f}")
print(f"Precision: {precision_score(y_test, y_pred):.4f}")
```

## Core ML Workflow

### 1. Data Preparation (60% of ML work!)
```python
# Handle missing values
df.fillna(df.mean(), inplace=True)

# Remove outliers
Q1 = df.quantile(0.25)
Q3 = df.quantile(0.75)
IQR = Q3 - Q1
df = df[~((df < (Q1 - 1.5 * IQR)) | (df > (Q3 + 1.5 * IQR))).any(axis=1)]

# Encode categorical variables
df = pd.get_dummies(df, columns=['category_col'])

# Scale numerical features
from sklearn.preprocessing import StandardScaler
scaler = StandardScaler()
df_scaled = scaler.fit_transform(df)
```

### 2. Feature Engineering
The art of creating meaningful features that improve model performance.

```python
# Domain-specific features
df['price_per_sq_ft'] = df['price'] / df['square_feet']
df['age_group'] = pd.cut(df['age'], bins=5)

# Interaction features
df['feature_interaction'] = df['feature_a'] * df['feature_b']

# Polynomial features (for linear models)
from sklearn.preprocessing import PolynomialFeatures
poly = PolynomialFeatures(degree=2)
features_poly = poly.fit_transform(X)
```

### 3. Model Selection & Training
```python
from sklearn.ensemble import RandomForestClassifier, GradientBoostingClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC

# Different algorithms for different problems
models = {
    'LogisticRegression': LogisticRegression(),
    'RandomForest': RandomForestClassifier(),
    'GradientBoosting': GradientBoostingClassifier(),
    'SVM': SVC()
}

# Train and compare
for name, model in models.items():
    model.fit(X_train, y_train)
    score = model.score(X_test, y_test)
    print(f"{name}: {score:.4f}")
```

### 4. Hyperparameter Tuning
```python
from sklearn.model_selection import GridSearchCV

# Define parameter grid
param_grid = {
    'n_estimators': [50, 100, 200],
    'max_depth': [None, 10, 20],
    'min_samples_split': [2, 5, 10]
}

# Grid search
grid_search = GridSearchCV(RandomForestClassifier(), param_grid, cv=5)
grid_search.fit(X_train, y_train)

print(f"Best params: {grid_search.best_params_}")
print(f"Best score: {grid_search.best_score_:.4f}")
```

### 5. Comprehensive Evaluation
```python
from sklearn.metrics import (
    confusion_matrix, classification_report,
    roc_curve, auc, precision_recall_curve
)

# Classification metrics
print(classification_report(y_test, y_pred))

# ROC-AUC
fpr, tpr, _ = roc_curve(y_test, y_pred_proba)
roc_auc = auc(fpr, tpr)
print(f"ROC-AUC: {roc_auc:.4f}")

# Confusion matrix
cm = confusion_matrix(y_test, y_pred)
print(cm)
```

## Common ML Problems & Solutions

| Problem | Symptoms | Solutions |
|---------|----------|-----------|
| **Overfitting** | High train acc, low test acc | More data, regularization, simpler model |
| **Underfitting** | Low both train & test acc | More features, complex model, more training |
| **Class Imbalance** | Poor minority class performance | SMOTE, class weights, stratification |
| **Data Drift** | Model performance degrades over time | Retraining, monitoring, online learning |

## Production ML Checklist

- [ ] Data pipeline automated and monitored
- [ ] Train/test split properly implemented
- [ ] Cross-validation for robust evaluation
- [ ] Model versioning and tracking (MLflow, Weights & Biases)
- [ ] Performance monitoring in production
- [ ] Retraining strategy defined
- [ ] A/B testing setup for deployment
- [ ] Model card documentation

## Tools & Libraries

| Task | Tools |
|------|-------|
| **Data Analysis** | pandas, NumPy, Polars |
| **Visualization** | matplotlib, seaborn, Plotly |
| **ML Models** | scikit-learn, XGBoost, LightGBM |
| **Experiment Tracking** | MLflow, Weights & Biases |
| **Model Serving** | Flask, FastAPI, BentoML |

## Best Practices

1. **Start Simple**: Baseline with simple models first
2. **Data Quality**: Invest heavily in data preparation
3. **Reproducibility**: Fix random seeds, document everything
4. **Regular Evaluation**: Track metrics over time
5. **Business Context**: Optimize for business metrics, not just accuracy
6. **Monitor Drift**: Track data and prediction drift
7. **Explainability**: Understand why models make decisions

## Interview-Ready Concepts

- Bias-variance tradeoff
- Precision vs Recall tradeoffs
- Feature importance and SHAP values
- Cross-validation strategies
- How to handle imbalanced datasets
- Model evaluation metrics by problem type

---

**Key Insight**: Machine learning is 80% data, 20% model. Spend more time on data quality!
