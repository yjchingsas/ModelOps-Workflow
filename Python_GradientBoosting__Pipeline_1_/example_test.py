import os
import os.path
import sys

sys.path.append('/models/resources/viya/bded23e3-0744-4136-9f8b-205452133a61/')

import _4eciaroqodklgq7s8o0p6y4r5

import settings_bded23e3_0744_4136_9f8b_205452133a61

settings_bded23e3_0744_4136_9f8b_205452133a61.pickle_path = '/models/resources/viya/bded23e3-0744-4136-9f8b-205452133a61/'

def score_record(Delinquencies,DerogatoryMarks,Inquiries,JobType,CredLineAge,CredLines,DebtIncRatio,LoanRequest,HomeValue,Income,LoanToValue,YearsOnJob):
    "Output: P_Default0,P_Default1,I_Default"
    return _4eciaroqodklgq7s8o0p6y4r5.score_method(Delinquencies,DerogatoryMarks,Inquiries,JobType,CredLineAge,CredLines,DebtIncRatio,LoanRequest,HomeValue,Income,LoanToValue,YearsOnJob)

print(score_record(41.09,66.58,190.08,"",182.28,14.32,40.50,38.20,168.64,70.99,48.51,167.79))
