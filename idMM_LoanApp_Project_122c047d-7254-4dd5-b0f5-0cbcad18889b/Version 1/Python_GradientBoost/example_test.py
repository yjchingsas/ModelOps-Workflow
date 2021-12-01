import os
import os.path
import sys

sys.path.append('/models/resources/viya/68662c88-e78d-4b9a-90df-b6f6e7cdac11/')

import gboost_score

import settings

settings.pickle_path = '/models/resources/viya/68662c88-e78d-4b9a-90df-b6f6e7cdac11/'

def score_record(Delinquencies,DerogatoryMarks,Inquiries,JobType,CredLineAge,CredLines,DebtIncRatio,HomeValue,Income,LoanRequest,LoanToValue,YearsOnJob):
    "Output: P_Default0,P_Default1,I_Default"
    return gboost_score.computeScore(Delinquencies,DerogatoryMarks,Inquiries,JobType,CredLineAge,CredLines,DebtIncRatio,HomeValue,Income,LoanRequest,LoanToValue,YearsOnJob)

print(score_record(66.83,171.93,6.97,"",102.35,38.18,169.98,138.62,67.62,82.45,43.66,57.54))
