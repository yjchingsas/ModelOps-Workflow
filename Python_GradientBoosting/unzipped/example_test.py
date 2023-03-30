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

print(score_record(169.31,7.31,165.52,"",30.90,89.82,67.66,152.02,82.53,49.13,139.32,197.10))
