#!/bin/bash

# Arabic Sentiment Analysis - Automated Setup Script
# This script automates the project setup process

set -e  # Exit on error

echo "========================================="
echo "🚀 Arabic Sentiment Analysis Setup"
echo "========================================="
echo ""

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check Python version
echo "📌 Step 1: Checking Python version..."
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}❌ Python 3 is not installed. Please install Python 3.7+${NC}"
    exit 1
fi

PYTHON_VERSION=$(python3 --version | cut -d' ' -f2 | cut -d'.' -f1,2)
echo -e "${GREEN}✓ Found Python $PYTHON_VERSION${NC}"
echo ""

# Create virtual environment
echo "📌 Step 2: Creating virtual environment..."
if [ -d "venv" ]; then
    echo -e "${YELLOW}⚠ Virtual environment already exists, skipping...${NC}"
else
    python3 -m venv venv
    echo -e "${GREEN}✓ Virtual environment created${NC}"
fi
echo ""

# Activate virtual environment
echo "📌 Step 3: Activating virtual environment..."
source venv/bin/activate
echo -e "${GREEN}✓ Virtual environment activated${NC}"
echo ""

# Upgrade pip
echo "📌 Step 4: Upgrading pip..."
pip install --upgrade pip --quiet
echo -e "${GREEN}✓ pip upgraded${NC}"
echo ""

# Install requirements
echo "📌 Step 5: Installing required packages..."
echo "This may take a few minutes..."
pip install -r requirements.txt --quiet
echo -e "${GREEN}✓ All packages installed${NC}"
echo ""

# Download NLTK data
echo "📌 Step 6: Downloading NLTK stopwords..."
python3 << EOF
import nltk
import ssl

try:
    _create_unverified_https_context = ssl._create_unverified_context
except AttributeError:
    pass
else:
    ssl._create_default_https_context = _create_unverified_https_context

nltk.download('stopwords', quiet=True)
print("✓ NLTK data downloaded")
EOF
echo ""

# Check for dataset
echo "📌 Step 7: Checking for dataset..."
if [ -f "data/arabic_sentiment_reviews.csv" ]; then
    echo -e "${GREEN}✓ Dataset found!${NC}"
else
    echo -e "${YELLOW}⚠ Dataset not found${NC}"
    echo ""
    echo "Please download the dataset manually:"
    echo "1. Visit: https://www.kaggle.com/datasets/abdallaellaithy/330k-arabic-sentiment-reviews"
    echo "2. Download 'arabic_sentiment_reviews.csv'"
    echo "3. Place it in the 'data/' folder"
    echo ""
    echo "OR use Kaggle API:"
    echo "  kaggle datasets download -d abdallaellaithy/330k-arabic-sentiment-reviews"
    echo "  unzip 330k-arabic-sentiment-reviews.zip -d data/"
fi
echo ""

# Final instructions
echo "========================================="
echo "✨ Setup Complete!"
echo "========================================="
echo ""
echo "Next steps:"
echo "1. Activate virtual environment: source venv/bin/activate"
echo "2. Download dataset (if not already done)"
echo "3. Run Jupyter: jupyter notebook FINAL_NLP_PROJECT.ipynb"
echo ""
echo "For help, see QUICKSTART.md"
echo ""
