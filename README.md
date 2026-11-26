# UAE real estate trend prediction

A Streamlit app that uses 11 household and financial inputs to predict the dataset’s recorded 10-year trend label, **Increased** or **Dropped**. The dataset has no dated property prices to verify a 10-year market forecast.

## Run the app

Use Python 3.12. From the extracted project folder, create a virtual environment:

```sh
python -m venv .venv
```

Activate it with `source .venv/bin/activate` on macOS or Linux, or `.venv\Scripts\activate.bat` in Windows Command Prompt. Then run:

```sh
python -m pip install -r requirements.txt
python -m streamlit run app.py
```

Open the local URL printed in the terminal, fill in the profile, and select **Predict**. The app loads the included trained model immediately.

## Reproduce the analysis

From the same folder and environment:

```sh
python -m pip install -r requirements-notebook.txt
python -m jupyterlab real_estate.ipynb
```

Choose **Run All Cells**. The notebook reads the compressed CSV directly, compares five classifiers, tunes gradient boosting using training folds, evaluates on a held-out 20% split, and writes the evaluated pipeline to `model.pkl`. The final cells also regenerate the helper modules, app, and runtime requirements.

## Project files

| File | Purpose |
| --- | --- |
| `app.py` | Streamlit prediction form |
| `model.pkl` | Trained scikit-learn pipeline saved with joblib |
| `cleaning.py`, `financial_features.py` | Input cleaning and feature calculations used by the model |
| `real_estate.ipynb` | Analysis, training, evaluation, and model export |
| `real_estate_10yr_prediction.csv.gz` | Supplied CSV, compressed without changing its contents |
| `requirements.txt`, `requirements-notebook.txt` | App and notebook dependencies |

## Upload to GitHub

Extract the ZIP, open the project folder, and upload its contents to the root of your repository. Keep the filenames and layout together so imports and paths work. To deploy on Streamlit Community Cloud, select the repository, use `app.py` as the entry point, and select Python 3.12.

The supplied files do not specify the dataset source or redistribution license. Confirm permission before making the dataset or notebook previews public.
