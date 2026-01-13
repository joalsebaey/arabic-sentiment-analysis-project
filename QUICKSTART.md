# Quick Start Guide

This guide will help you get started with the Arabic Sentiment Analysis project in 5 minutes.

## Prerequisites

- Python 3.7 or higher
- pip package manager
- 4GB RAM minimum (dataset is large)

## Step-by-Step Setup

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/arabic-sentiment-analysis.git
cd arabic-sentiment-analysis
```

### 2. Create Virtual Environment (Recommended)

**On Windows:**
```bash
python -m venv venv
venv\Scripts\activate
```

**On Mac/Linux:**
```bash
python3 -m venv venv
source venv/bin/activate
```

### 3. Install Dependencies

```bash
pip install -r requirements.txt
```

### 4. Download NLTK Data

Run Python and execute:
```python
import nltk
nltk.download('stopwords')
```

Or run this one-liner:
```bash
python -c "import nltk; nltk.download('stopwords')"
```

### 5. Download the Dataset

**Option A: Using Kaggle API (Recommended)**

1. Install Kaggle CLI:
   ```bash
   pip install kaggle
   ```

2. Set up Kaggle credentials:
   - Go to [Kaggle Account Settings](https://www.kaggle.com/settings)
   - Click "Create New API Token"
   - Save `kaggle.json` to `~/.kaggle/` (Mac/Linux) or `C:\Users\<YourUsername>\.kaggle\` (Windows)

3. Download dataset:
   ```bash
   kaggle datasets download -d abdallaellaithy/330k-arabic-sentiment-reviews
   unzip 330k-arabic-sentiment-reviews.zip -d data/
   ```

**Option B: Manual Download**

1. Visit [Dataset Link](https://www.kaggle.com/datasets/abdallaellaithy/330k-arabic-sentiment-reviews)
2. Download `arabic_sentiment_reviews.csv`
3. Create `data/` folder and place the file there

### 6. Update File Path

Edit the notebook or script and update the `FILE_PATH` variable:

```python
FILE_PATH = 'data/arabic_sentiment_reviews.csv'
```

### 7. Run the Notebook

```bash
jupyter notebook FINAL_NLP_PROJECT.ipynb
```

Or use JupyterLab:
```bash
jupyter lab
```

### 8. Execute All Cells

In Jupyter:
- Click **Cell** → **Run All**
- Or press **Shift + Enter** to run cell by cell

## Expected Results

After running all cells, you should see:

✅ Dataset loaded successfully  
✅ Text preprocessing completed  
✅ Models trained (Standard and Advanced)  
✅ Performance metrics displayed  
✅ Confusion matrices visualized  

## Troubleshooting

### Issue: `ModuleNotFoundError: No module named 'tashaphyne'`
**Solution**: Install the package
```bash
pip install tashaphyne
```

### Issue: `FileNotFoundError` for dataset
**Solution**: Check the `FILE_PATH` variable matches your file location

### Issue: Memory Error
**Solution**: If you have limited RAM, reduce the dataset size:
```python
df = df.sample(n=50000, random_state=42)  # Use 50K samples instead of 330K
```

### Issue: NLTK stopwords not found
**Solution**: Download NLTK data
```python
import nltk
nltk.download('stopwords')
```

## Next Steps

- 📊 Experiment with different hyperparameters
- 🔬 Try additional preprocessing techniques
- 🤖 Add more machine learning models
- 📈 Visualize feature importance

## Need Help?

- 📖 Read the full [README.md](README.md)
- 🐛 Report bugs in [Issues](https://github.com/YOUR_USERNAME/arabic-sentiment-analysis/issues)
- 💬 Ask questions in [Discussions](https://github.com/YOUR_USERNAME/arabic-sentiment-analysis/discussions)

---

Happy Analyzing! 🚀
