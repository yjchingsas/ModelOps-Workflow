import numpy as np
import pickle
import pandas as pd
import settings

def computeScore(Delinquencies, DerogatoryMarks, Inquiries, JobType, CredLineAge, CredLines, DebtIncRatio, HomeValue, Income, LoanRequest, LoanToValue, YearsOnJob):
    "Output: P_Default0, P_Default1, I_Default"
    
    ## Load pickled model
    try:
        dm_model
    except NameError:
        model = open(settings.pickle_path+'/gboost_V3_8_8.pkl', 'rb')
        dm_model = pickle.load(model)
        model.close()

    ## Define input dataframe to score
    input_list=[Delinquencies, DerogatoryMarks, Inquiries, JobType, CredLineAge, CredLines, DebtIncRatio, HomeValue, Income, LoanRequest, LoanToValue, YearsOnJob]
    X = pd.DataFrame(input_list).T
    X.columns=(['Delinquencies', 'DerogatoryMarks', 'Inquiries', 'JobType', 'CredLineAge', 'CredLines', 'DebtIncRatio', 'HomeValue', 'Income', 'LoanRequest', 'LoanToValue', 'YearsOnJob'])

    ## dummy JobType
    if X['JobType'].item() == '':
        X['JobType'] = 'Other'
    jobtype = ''.join(list(pd.get_dummies(X['JobType'])))
    X = pd.concat([X, pd.get_dummies(X['JobType'])], axis = 1).drop('JobType', axis = 1)
    columns=['Other', 'Mgr', 'Office', 'Owner', 'ProfExe', 'Sales','Self']
    for i in columns:
        try:
            X[i].isnull()
        except KeyError:
            X[i] = 0
    
    ## predict
    P_Default0 = dm_model.predict_proba(X)[0,0]
    P_Default1 = dm_model.predict_proba(X)[0,1]
    I_Default = dm_model.predict(X)

    return float(P_Default0), float(P_Default1), str(float(I_Default))
