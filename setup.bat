@echo off
REM Arabic Sentiment Analysis - Windows Setup Script
REM This script automates the project setup process on Windows

echo =========================================
echo Arabic Sentiment Analysis Setup
echo =========================================
echo.

REM Check Python version
echo Step 1: Checking Python version...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Python is not installed. Please install Python 3.7+
    pause
    exit /b 1
)
python --version
echo.

REM Create virtual environment
echo Step 2: Creating virtual environment...
if exist venv (
    echo Virtual environment already exists, skipping...
) else (
    python -m venv venv
    echo Virtual environment created
)
echo.

REM Activate virtual environment
echo Step 3: Activating virtual environment...
call venv\Scripts\activate.bat
echo Virtual environment activated
echo.

REM Upgrade pip
echo Step 4: Upgrading pip...
python -m pip install --upgrade pip --quiet
echo pip upgraded
echo.

REM Install requirements
echo Step 5: Installing required packages...
echo This may take a few minutes...
pip install -r requirements.txt --quiet
echo All packages installed
echo.

REM Download NLTK data
echo Step 6: Downloading NLTK stopwords...
python -c "import nltk; nltk.download('stopwords', quiet=True); print('NLTK data downloaded')"
echo.

REM Check for dataset
echo Step 7: Checking for dataset...
if exist data\arabic_sentiment_reviews.csv (
    echo Dataset found!
) else (
    echo WARNING: Dataset not found
    echo.
    echo Please download the dataset manually:
    echo 1. Visit: https://www.kaggle.com/datasets/abdallaellaithy/330k-arabic-sentiment-reviews
    echo 2. Download 'arabic_sentiment_reviews.csv'
    echo 3. Place it in the 'data' folder
    echo.
    echo OR use Kaggle API:
    echo   kaggle datasets download -d abdallaellaithy/330k-arabic-sentiment-reviews
    echo   tar -xf 330k-arabic-sentiment-reviews.zip -C data
)
echo.

REM Final instructions
echo =========================================
echo Setup Complete!
echo =========================================
echo.
echo Next steps:
echo 1. Activate virtual environment: venv\Scripts\activate
echo 2. Download dataset (if not already done)
echo 3. Run Jupyter: jupyter notebook FINAL_NLP_PROJECT.ipynb
echo.
echo For help, see QUICKSTART.md
echo.
pause
