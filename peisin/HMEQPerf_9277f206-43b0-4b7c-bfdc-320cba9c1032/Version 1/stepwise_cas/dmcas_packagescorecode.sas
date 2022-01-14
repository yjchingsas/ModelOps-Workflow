/*----------------------------------------------------------------------------------*/
/* Product:            Visual Data Mining and Machine Learning                      */
/* Release Version:    V2021.1.6                                                    */
/* Component Version:  V2021.1.6                                                    */
/* CAS Version:        V.04.00M0P10172021                                           */
/* SAS Version:        V.04.00M0P101721                                             */
/* Site Number:        70180938                                                     */
/* Host:               sas-cas-server-default-client                                */
/* Encoding:           utf-8                                                        */
/* Java Encoding:      UTF8                                                         */
/* Locale:             en_US                                                        */
/* Project GUID:       bddfa17c-4629-4a45-8560-fed825627811                         */
/* Node GUID:          84879fcb-1a22-4f5c-bb58-3b9b79590d73                         */
/* Node Id:            7UGIVYRQB3TIZ9LHXJI6ELT9V                                    */
/* Algorithm:          Logistic Regression                                          */
/* Generated by:       Jacky.Long@sas.com                                           */
/* Date:               08NOV2021:00:18:22                                           */
/*----------------------------------------------------------------------------------*/
package MS_84879fcb1a224f5cbb583b9b79590d73_08NOV2021001822013 / overwrite=yes;
   dcl double "Delinquencies";
   dcl double "P_Default0" having label n'Predicted: Default=0';
   dcl double "P_Default1" having label n'Predicted: Default=1';
   dcl nchar(12) "I_Default" having label n'Into: Default';
   dcl double "EM_EVENTPROBABILITY";
   dcl nchar(12) "EM_CLASSIFICATION";
   dcl double "EM_PROBABILITY";
   varlist allvars [_all_];
 
   method _7UGIVYRQB3TIZ9LHXJI6ELT9V();
      dcl double _P_;
      dcl double MACLOGBIG;
      dcl double _J_;
      dcl double _I_;
      dcl double _TEMP_;
      dcl double _LINP_;
      dcl double _BADVAL_;
      dcl nchar(2) _DELINQUENCIES_;
      dcl nchar(12) _LEVELS_57892509_[2];
      dcl double _BETA_57892509_0_[11];
      dcl double _XROW_57892509_0_[11];
       
      _LEVELS_57892509_:=('1', '0');
      _BETA_57892509_0_:=(10.9023671857731, -13.6000699183499, -13.0424333492693,
      -12.0810221821147, -13.3301154217211, -12.1551301542684, -10.0550693253859,
      -4.7889957347781E-9, -4.8598226695899E-9, 0, 0);
      _BADVAL_ = 0.0;
      _LINP_ = 0.0;
      _TEMP_ = 0.0;
      _I_ = 0.0;
      _J_ = 0.0;
      MACLOGBIG = 7.0978271289338392E+02;
      _DELINQUENCIES_ = LEFT(TRIM(put(DELINQUENCIES, BEST2.)));
      do _I_ = 1.0 to 11.0;
      _XROW_57892509_0_[_I_] = 0.0;
      end;
      _XROW_57892509_0_[1.0] = 1.0;
      _TEMP_ = 1.0;
      select (_DELINQUENCIES_);
      when ('0') _XROW_57892509_0_[2.0] = _TEMP_;
      when ('1') _XROW_57892509_0_[3.0] = _TEMP_;
      when ('2') _XROW_57892509_0_[4.0] = _TEMP_;
      when ('3') _XROW_57892509_0_[5.0] = _TEMP_;
      when ('4') _XROW_57892509_0_[6.0] = _TEMP_;
      when ('5') _XROW_57892509_0_[7.0] = _TEMP_;
      when ('6') _XROW_57892509_0_[8.0] = _TEMP_;
      when ('7') _XROW_57892509_0_[9.0] = _TEMP_;
      when ('8') _XROW_57892509_0_[10.0] = _TEMP_;
      when ('10') _XROW_57892509_0_[11.0] = _TEMP_;
      otherwise do ;
      _BADVAL_ = 1.0;
      goto SKIP_57892509_0;
      end;
      end;
      do _I_ = 1.0 to 11.0;
      _LINP_ + _XROW_57892509_0_[_I_] * _BETA_57892509_0_[_I_];
      end;
      SKIP_57892509_0: if (_BADVAL_ = 0.0) & ^MISSING(_LINP_) then do ;
      if (_LINP_ > 0.0) then do ;
      P_DEFAULT1 = 1.0 / (1.0 + EXP(-_LINP_));
      end;
      else do ;
      P_DEFAULT1 = EXP(_LINP_) / (1.0 + EXP(_LINP_));
      end;
      P_DEFAULT0 = 1.0 - P_DEFAULT1;
      if P_DEFAULT1 >= 0.5 then do ;
      I_DEFAULT = _LEVELS_57892509_[1.0];
      end;
      else do ;
      I_DEFAULT = _LEVELS_57892509_[2.0];
      end;
      end;
      else do ;
      _LINP_ = .;
      P_DEFAULT1 = .;
      P_DEFAULT0 = .;
      I_DEFAULT = ' ';
      end;
      if "P_DEFAULT1" = . then "P_DEFAULT1" = 0.0789224953;
      if "P_DEFAULT0" = . then "P_DEFAULT0" = 0.9210775047;
      if MISSING("I_DEFAULT") then do ;
      _P_ = 0.0;
      if "P_DEFAULT1" > _P_ then do ;
      _P_ = "P_DEFAULT1";
      "I_DEFAULT" = '           1';
      end;
      if "P_DEFAULT0" > _P_ then do ;
      _P_ = "P_DEFAULT0";
      "I_DEFAULT" = '           0';
      end;
      end;
      EM_EVENTPROBABILITY = "P_DEFAULT1";
      EM_CLASSIFICATION = "I_DEFAULT";
      EM_PROBABILITY = MAX("P_DEFAULT1", "P_DEFAULT0");
    
   end;
    
 
   method score(
      double "Delinquencies",
      IN_OUT char(12) "EM_CLASSIFICATION",
      IN_OUT double "EM_EVENTPROBABILITY",
      IN_OUT double "EM_PROBABILITY",
      IN_OUT char(12) "I_Default",
      IN_OUT double "P_Default0",
      IN_OUT double "P_Default1"
   );
      this."Delinquencies"= "Delinquencies";
 
      _7UGIVYRQB3TIZ9LHXJI6ELT9V();
 
      "EM_CLASSIFICATION"= this."EM_CLASSIFICATION";
      "EM_EVENTPROBABILITY"= this."EM_EVENTPROBABILITY";
      "EM_PROBABILITY"= this."EM_PROBABILITY";
      "I_Default"= this."I_Default";
      "P_Default0"= this."P_Default0";
      "P_Default1"= this."P_Default1";
   end;
 
 
   method predictedscore(
      double "Delinquencies",
      IN_OUT char(12) "EM_CLASSIFICATION",
      IN_OUT double "EM_EVENTPROBABILITY",
      IN_OUT double "EM_PROBABILITY",
      IN_OUT char(12) "I_Default",
      IN_OUT double "P_Default0",
      IN_OUT double "P_Default1"
   );
      this."Delinquencies"= "Delinquencies";
 
      _7UGIVYRQB3TIZ9LHXJI6ELT9V();
 
      "EM_CLASSIFICATION"= this."EM_CLASSIFICATION";
      "EM_EVENTPROBABILITY"= this."EM_EVENTPROBABILITY";
      "EM_PROBABILITY"= this."EM_PROBABILITY";
      "I_Default"= this."I_Default";
      "P_Default0"= this."P_Default0";
      "P_Default1"= this."P_Default1";
   end;
 
endpackage;
