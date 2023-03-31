   /*---------------------------------------------------------
     Generated SAS Scoring Code
     Date: 06Mar2023:08:04:14
     -------------------------------------------------------*/

   drop _badval_ _linp_ _temp_ _i_ _j_;
   _badval_ = 0;
   _linp_   = 0;
   _temp_   = 0;
   _i_      = 0;
   _j_      = 0;
   drop MACLOGBIG;
   MACLOGBIG= 7.0978271289338392e+02;

   array _xrow_66456013_0_{11} _temporary_;
   array _beta_66456013_0_{11} _temporary_ (    10.9023671851812
           -13.600069917758
          -13.0424333486775
          -12.0810221815229
          -13.3301154211293
          -12.1551301536766
           -10.055069324794
        -4.1095457568212E-9
         -4.268191757943E-9
                          0
                          0);

   length _Delinquencies_ $2; drop _Delinquencies_;
   _Delinquencies_ = left(trim(put(Delinquencies,BEST2.)));
   do _i_=1 to 11; _xrow_66456013_0_{_i_} = 0; end;

   _xrow_66456013_0_[1] = 1;

   _temp_ = 1;
   select (_Delinquencies_);
      when ('0') _xrow_66456013_0_[2] = _temp_;
      when ('1') _xrow_66456013_0_[3] = _temp_;
      when ('2') _xrow_66456013_0_[4] = _temp_;
      when ('3') _xrow_66456013_0_[5] = _temp_;
      when ('4') _xrow_66456013_0_[6] = _temp_;
      when ('5') _xrow_66456013_0_[7] = _temp_;
      when ('6') _xrow_66456013_0_[8] = _temp_;
      when ('7') _xrow_66456013_0_[9] = _temp_;
      when ('8') _xrow_66456013_0_[10] = _temp_;
      when ('10') _xrow_66456013_0_[11] = _temp_;
      otherwise do; _badval_ = 1; goto skip_66456013_0; end;
   end;

   do _i_=1 to 11;
      _linp_ + _xrow_66456013_0_{_i_} * _beta_66456013_0_{_i_};
   end;

   skip_66456013_0:
   length I_Default $12;
   label I_Default = 'Into: Default';
   array _levels_66456013_{2} $ 12 _TEMPORARY_ ('1'
   ,'0'
   );
   label P_Default1 = 'Predicted: Default=1';
   if (_badval_ eq 0) and not missing(_linp_) then do;
      if (_linp_ > 0) then do;
         P_Default1 = 1 / (1+exp(-_linp_));
      end; else do;
         P_Default1 = exp(_linp_) / (1+exp(_linp_));
      end;
      P_Default0 = 1 - P_Default1;
      if P_Default1 >= 0.5                  then do;
         I_Default = _levels_66456013_{1};
      end; else do;
         I_Default = _levels_66456013_{2};
      end;
   end; else do;
      _linp_ = .;
      P_Default1 = .;
      P_Default0 = .;
      I_Default = ' ';
   end;


   *------------------------------------------------------------*;
   * Initializing missing posterior and classification variables ;
   *------------------------------------------------------------*;
   label "P_Default1"n ='Predicted: Default=1';
   if "P_Default1"n = . then "P_Default1"n =0.0789224953;
   label "P_Default0"n ='Predicted: Default=0';
   if "P_Default0"n = . then "P_Default0"n =0.9210775047;
   label "I_Default"n ='Into: Default';
   if missing('I_Default'n) then do;
      drop _P_;
      _P_= 0.0 ;
      if 'P_Default1'n > _P_ then do;
      _P_ = 'P_Default1'n;
      'I_Default'n = '           1';
      end;
      if 'P_Default0'n > _P_ then do;
      _P_ = 'P_Default0'n;
      'I_Default'n = '           0';
      end;
   end;
