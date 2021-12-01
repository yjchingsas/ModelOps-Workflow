data sasep.out;
   dcl package pymas pm;
   dcl package logger logr('App.tk.MAS');
   dcl varchar(32767) character set utf8 pypgm;
   dcl double resultCode revision;
   dcl double "CredLineAge";
   dcl double "CredLines";
   dcl double "DebtIncRatio";
   dcl double "Delinquencies";
   dcl double "DerogatoryMarks";
   dcl double "HomeValue";
   dcl double "Income";
   dcl double "Inquiries";
   dcl varchar(100) "JobType";
   dcl double "LoanRequest";
   dcl double "LoanToValue";
   dcl double "YearsOnJob";
   dcl varchar(100) "I_Default";
   dcl double "P_Default0";
   dcl double "P_Default1";

   method score(
   double "Delinquencies",
   double "DerogatoryMarks",
   double "Inquiries",
   varchar(100) "JobType",
   double "CredLineAge",
   double "CredLines",
   double "DebtIncRatio",
   double "HomeValue",
   double "Income",
   double "LoanRequest",
   double "LoanToValue",
   double "YearsOnJob",
   in_out double resultCode,
   in_out double "P_Default0",
   in_out double "P_Default1",
   in_out varchar(100) "I_Default");

      resultCode = revision = 0;
      if null(pm) then do;
         pm = _new_ pymas();
         resultCode = pm.useModule('model_exec_c788a946-1936-4459-a0d9-ae8c55a97c4f', 1);
         if resultCode then do;
            resultCode = pm.appendSrcLine('import sys');
            resultCode = pm.appendSrcLine('sys.path.append("/models/resources/viya/68662c88-e78d-4b9a-90df-b6f6e7cdac11/")');
            resultCode = pm.appendSrcLine('import settings');
            resultCode = pm.appendSrcLine('settings.pickle_path = "/models/resources/viya/68662c88-e78d-4b9a-90df-b6f6e7cdac11/"');
            resultCode = pm.appendSrcLine('import gboost_score');
            resultCode = pm.appendSrcLine('def computeScore(Delinquencies, DerogatoryMarks, Inquiries, JobType, CredLineAge, CredLines, DebtIncRatio, HomeValue, Income, LoanRequest, LoanToValue, YearsOnJob):');
            resultCode = pm.appendSrcLine('    "Output: P_Default0, P_Default1, I_Default"');
            resultCode = pm.appendSrcLine('    return gboost_score.computeScore(Delinquencies, DerogatoryMarks, Inquiries, JobType, CredLineAge, CredLines, DebtIncRatio, HomeValue, Income, LoanRequest, LoanToValue, YearsOnJob)');

            revision = pm.publish(pm.getSource(), 'model_exec_c788a946-1936-4459-a0d9-ae8c55a97c4f');
            if ( revision < 1 ) then do;
               logr.log( 'e', 'py.publish() failed.');
               resultCode = -1;
               return;
            end;
         end;
      end;

      resultCode = pm.useMethod('computeScore');
      if resultCode then do;
         logr.log('E', 'useMethod() failed. resultCode=$s', resultCode);
         return;
      end;
      resultCode = pm.setDouble('Delinquencies', "Delinquencies");
      if resultCode then
         logr.log('E', 'setDouble for Delinquencies failed.  resultCode=$s', resultCode);
      resultCode = pm.setDouble('DerogatoryMarks', "DerogatoryMarks");
      if resultCode then
         logr.log('E', 'setDouble for DerogatoryMarks failed.  resultCode=$s', resultCode);
      resultCode = pm.setDouble('Inquiries', "Inquiries");
      if resultCode then
         logr.log('E', 'setDouble for Inquiries failed.  resultCode=$s', resultCode);
      resultCode = pm.setString('JobType', "JobType");
      if resultCode then
         logr.log('E', 'setString for JobType failed.  resultCode=$s', resultCode);
      resultCode = pm.setDouble('CredLineAge', "CredLineAge");
      if resultCode then
         logr.log('E', 'setDouble for CredLineAge failed.  resultCode=$s', resultCode);
      resultCode = pm.setDouble('CredLines', "CredLines");
      if resultCode then
         logr.log('E', 'setDouble for CredLines failed.  resultCode=$s', resultCode);
      resultCode = pm.setDouble('DebtIncRatio', "DebtIncRatio");
      if resultCode then
         logr.log('E', 'setDouble for DebtIncRatio failed.  resultCode=$s', resultCode);
      resultCode = pm.setDouble('HomeValue', "HomeValue");
      if resultCode then
         logr.log('E', 'setDouble for HomeValue failed.  resultCode=$s', resultCode);
      resultCode = pm.setDouble('Income', "Income");
      if resultCode then
         logr.log('E', 'setDouble for Income failed.  resultCode=$s', resultCode);
      resultCode = pm.setDouble('LoanRequest', "LoanRequest");
      if resultCode then
         logr.log('E', 'setDouble for LoanRequest failed.  resultCode=$s', resultCode);
      resultCode = pm.setDouble('LoanToValue', "LoanToValue");
      if resultCode then
         logr.log('E', 'setDouble for LoanToValue failed.  resultCode=$s', resultCode);
      resultCode = pm.setDouble('YearsOnJob', "YearsOnJob");
      if resultCode then
         logr.log('E', 'setDouble for YearsOnJob failed.  resultCode=$s', resultCode);
      resultCode = pm.execute();
      if (resultCode) then
         logr.log('E', 'Error: pm.execute failed.  resultCode=$s', resultCode);
      else do;
         "P_Default0" = pm.getDouble('P_Default0');
         "P_Default1" = pm.getDouble('P_Default1');
         "I_Default" = pm.getString('I_Default');
      end;
   end;

   method run();
      set SASEP.IN;
      score("Delinquencies","DerogatoryMarks","Inquiries","JobType","CredLineAge","CredLines","DebtIncRatio","HomeValue","Income","LoanRequest","LoanToValue","YearsOnJob", resultCode, "P_Default0","P_Default1","I_Default");
   end;
enddata;
