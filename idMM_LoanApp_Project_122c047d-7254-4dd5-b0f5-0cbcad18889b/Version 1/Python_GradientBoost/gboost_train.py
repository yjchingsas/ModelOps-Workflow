from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split

from sklearn.ensemble import GradientBoostingClassifier
import pandas as pd


def train(input_df, warmstart=False):
    """
    :param input_df: pandas.DataFrame
           warmstart: True/False to trigger warm_start option
    :return: sklearn.GradientBoostingClassifier
    """
    
    # declare target
    target       = input_df.columns[0]

    # impute data
    input_df_ABT = input_df.fillna(input_df.median())
        
    # drop target
    df_all_inputs = input_df_ABT.drop(target, axis=1)
    
    # Create training and validation sets
    X_train, X_valid, y_train, y_valid = train_test_split(
        df_all_inputs, input_df[target], test_size=0.33, random_state=54321)
    
    # Build sklearn Gradient Boost
    gb = GradientBoostingClassifier(random_state=54321, warm_start=warmstart)
    gb.fit(X_train, y_train)  
    return gb
