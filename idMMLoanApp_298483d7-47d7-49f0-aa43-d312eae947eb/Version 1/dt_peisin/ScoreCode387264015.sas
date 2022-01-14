   length _strfmt_25082634_ $12; drop _strfmt_25082634_;
   _strfmt_25082634_ = ' ';

   array _tlevname_25082634_{2} $12 _temporary_ ( '           1'
   '           0');

   array _dt_fi_25082634_{2} _temporary_;

   _node_id_ =  0;
   _new_id_  = -1;
   nextnode_25082634:
   if _node_id_ eq 0 then do;
         _strfmt_25082634_ = left(trim(put(Delinquencies,BEST12.)));
         if missing(Delinquencies) then do;
            _new_id_ = -1;
            _numval_ = CredLineAge;
            if not (missing(_numval_)) then do;if (_numval_ ge 0 and _numval_ lt 0) or (_numval_ ge
            0 and _numval_ lt 27.626428934) or (_numval_ ge
            27.626428934 and _numval_ lt 62.10152742) or (_numval_ ge
            62.10152742 and _numval_ lt 73.306054956) or (_numval_ ge
            73.306054956 and _numval_ lt 80.84321682) or (_numval_ ge
            80.84321682 and _numval_ lt 86.527027004) or (_numval_ ge
            86.527027004 and _numval_ lt 91.588848446) or (_numval_ ge
            91.588848446 and _numval_ lt 97.05776925) or (_numval_ ge
            97.05776925 and _numval_ lt 101.5748796) or (_numval_ ge
            101.5748796 and _numval_ lt 106.486237) or (_numval_ ge
            106.486237 and _numval_ lt 110.66597878) or (_numval_ ge
            110.66597878 and _numval_ lt 114.97718688) or (_numval_ ge
            114.97718688 and _numval_ lt 118.42077648) or (_numval_ ge
            118.42077648 and _numval_ lt 121.60062908) or (_numval_ ge
            121.60062908 and _numval_ lt 125.3854461) or (_numval_ ge
            125.3854461 and _numval_ lt 128.4412555) or (_numval_ ge
            128.4412555 and _numval_ lt 132.84267686) or (_numval_ ge
            132.84267686 and _numval_ lt 137.75837172) or (_numval_ ge
            137.75837172 and _numval_ lt 144.11440544) or (_numval_ ge
            144.11440544 and _numval_ lt 149.0647448) or (_numval_ ge
            149.0647448 and _numval_ lt 155.43475476) or (_numval_ ge
            155.43475476 and _numval_ lt 160.73126134) or (_numval_ ge
            160.73126134 and _numval_ lt 166.85625206) or (_numval_ ge
            166.85625206 and _numval_ lt 171.61409702) or (_numval_ ge
            171.61409702 and _numval_ lt 175.5425655) or (_numval_ ge
            175.5425655 and _numval_ lt 178.65516502) or (_numval_ ge
            178.65516502 and _numval_ lt 182.68331064) or (_numval_ ge
            182.68331064 and _numval_ lt 186.94189736) or (_numval_ ge
            186.94189736 and _numval_ lt 190.69194586) or (_numval_ ge
            190.69194586 and _numval_ lt 195.4513312) or (_numval_ ge
            195.4513312 and _numval_ lt 199.71874516) or (_numval_ ge
            199.71874516 and _numval_ lt 203.64236292) or (_numval_ ge
            203.64236292 and _numval_ lt 207.20489094) or (_numval_ ge
            207.20489094 and _numval_ lt 212.14800992) or (_numval_ ge
            212.14800992 and _numval_ lt 217.4805423) or (_numval_ ge
            217.4805423 and _numval_ lt 223.4515072) or (_numval_ ge
            223.4515072 and _numval_ lt 229.15885092) or (_numval_ ge
            229.15885092 and _numval_ lt 235.48835152) or (_numval_ ge
            235.48835152 and _numval_ lt 241.50955708) or (_numval_ ge
            241.50955708 and _numval_ lt 246.7969491) or (_numval_ ge
            246.7969491 and _numval_ lt 253.21499462) or (_numval_ ge
            253.21499462 and _numval_ lt 260.21406772) or (_numval_ ge
            260.21406772 and _numval_ lt 269.49299654) or (_numval_ ge
            269.49299654 and _numval_ lt 279.89083788) or (_numval_ ge
            279.89083788 and _numval_ lt 290.0805914) or (_numval_ ge
            290.0805914 and _numval_ lt 301.2160331) or (_numval_ ge
            301.2160331 and _numval_ lt 309.5001353) or (_numval_ ge
            309.5001353 and _numval_ lt 324.20083068) or (_numval_ ge
            324.20083068 and _numval_ lt 352.43496456) or (_numval_ ge
            352.43496456 and _numval_ lt 649.7471044) then do;

               _new_id_ = 1;
               goto ruleend_25082634_node_0;
            end;
            else if (_numval_ lt 0) then do;
               _new_id_ = 1;
               goto ruleend_25082634_node_0;
            end;
            else if (_numval_ ge 649.7471044) then do;
               _new_id_ = 1;
               goto ruleend_25082634_node_0;
            end;
            end;
            if (_new_id_ eq -1) then do;
            _new_id_ = 1;
            goto ruleend_25082634_node_0;
            end;
            ruleend_25082634_node_0:
             _node_id_ = _new_id_;
            goto nextnode_25082634;
         end;
         if _strfmt_25082634_ in ('5',
         '4',
         '1',
         '0',
         '3',
         '2') then do;

         _new_id_ = 1;
         end;
         else if _strfmt_25082634_ in ('10',
         '7',
         '6') then do;

         _new_id_ = 2;
         end;
         else if MISSING(Delinquencies) then do;
         _new_id_ = 1;
         end;
         else do;
         _new_id_ = 1;
         end;
   end;
   else if _node_id_ eq 1 then do;
         _strfmt_25082634_ = left(trim(put(DerogatoryMarks,BEST12.)));
         if missing(DerogatoryMarks) then do;
            _new_id_ = -1;
            _numval_ = CredLineAge;
            if not (missing(_numval_)) then do;if (_numval_ ge 0 and _numval_ lt 0) then do;

               _new_id_ = 3;
               goto ruleend_25082634_node_1;
            end;
            else if (_numval_ lt 0) then do;
               _new_id_ = 3;
               goto ruleend_25082634_node_1;
            end;
            else if (_numval_ ge 649.7471044) then do;
               _new_id_ = 4;
               goto ruleend_25082634_node_1;
            end;
            end;
            _numval_ = CredLineAge;
            if not (missing(_numval_)) then do;if (_numval_ ge 0 and _numval_ lt 27.626428934) or (_numval_ ge
            27.626428934 and _numval_ lt 62.10152742) or (_numval_ ge
            62.10152742 and _numval_ lt 73.306054956) or (_numval_ ge
            73.306054956 and _numval_ lt 80.84321682) or (_numval_ ge
            80.84321682 and _numval_ lt 86.527027004) or (_numval_ ge
            86.527027004 and _numval_ lt 91.588848446) or (_numval_ ge
            91.588848446 and _numval_ lt 97.05776925) or (_numval_ ge
            97.05776925 and _numval_ lt 101.5748796) or (_numval_ ge
            101.5748796 and _numval_ lt 106.486237) or (_numval_ ge
            106.486237 and _numval_ lt 110.66597878) or (_numval_ ge
            110.66597878 and _numval_ lt 114.97718688) or (_numval_ ge
            114.97718688 and _numval_ lt 118.42077648) or (_numval_ ge
            118.42077648 and _numval_ lt 121.60062908) or (_numval_ ge
            121.60062908 and _numval_ lt 125.3854461) or (_numval_ ge
            125.3854461 and _numval_ lt 128.4412555) or (_numval_ ge
            128.4412555 and _numval_ lt 132.84267686) or (_numval_ ge
            132.84267686 and _numval_ lt 137.75837172) or (_numval_ ge
            137.75837172 and _numval_ lt 144.11440544) or (_numval_ ge
            144.11440544 and _numval_ lt 149.0647448) or (_numval_ ge
            149.0647448 and _numval_ lt 155.43475476) or (_numval_ ge
            155.43475476 and _numval_ lt 160.73126134) or (_numval_ ge
            160.73126134 and _numval_ lt 166.85625206) or (_numval_ ge
            166.85625206 and _numval_ lt 171.61409702) or (_numval_ ge
            171.61409702 and _numval_ lt 175.5425655) or (_numval_ ge
            175.5425655 and _numval_ lt 178.65516502) or (_numval_ ge
            178.65516502 and _numval_ lt 182.68331064) or (_numval_ ge
            182.68331064 and _numval_ lt 186.94189736) or (_numval_ ge
            186.94189736 and _numval_ lt 190.69194586) or (_numval_ ge
            190.69194586 and _numval_ lt 195.4513312) or (_numval_ ge
            195.4513312 and _numval_ lt 199.71874516) or (_numval_ ge
            199.71874516 and _numval_ lt 203.64236292) or (_numval_ ge
            203.64236292 and _numval_ lt 207.20489094) or (_numval_ ge
            207.20489094 and _numval_ lt 212.14800992) or (_numval_ ge
            212.14800992 and _numval_ lt 217.4805423) or (_numval_ ge
            217.4805423 and _numval_ lt 223.4515072) or (_numval_ ge
            223.4515072 and _numval_ lt 229.15885092) or (_numval_ ge
            229.15885092 and _numval_ lt 235.48835152) or (_numval_ ge
            235.48835152 and _numval_ lt 241.50955708) or (_numval_ ge
            241.50955708 and _numval_ lt 246.7969491) or (_numval_ ge
            246.7969491 and _numval_ lt 253.21499462) or (_numval_ ge
            253.21499462 and _numval_ lt 260.21406772) or (_numval_ ge
            260.21406772 and _numval_ lt 269.49299654) or (_numval_ ge
            269.49299654 and _numval_ lt 279.89083788) or (_numval_ ge
            279.89083788 and _numval_ lt 290.0805914) or (_numval_ ge
            290.0805914 and _numval_ lt 301.2160331) or (_numval_ ge
            301.2160331 and _numval_ lt 309.5001353) or (_numval_ ge
            309.5001353 and _numval_ lt 324.20083068) or (_numval_ ge
            324.20083068 and _numval_ lt 352.43496456) or (_numval_ ge
            352.43496456 and _numval_ lt 649.7471044) then do;

               _new_id_ = 4;
               goto ruleend_25082634_node_1;
            end;
            else if (_numval_ lt 0) then do;
               _new_id_ = 3;
               goto ruleend_25082634_node_1;
            end;
            else if (_numval_ ge 649.7471044) then do;
               _new_id_ = 4;
               goto ruleend_25082634_node_1;
            end;
            end;
            if (_new_id_ eq -1) then do;
            _new_id_ = 4;
            goto ruleend_25082634_node_1;
            end;
            ruleend_25082634_node_1:
             _node_id_ = _new_id_;
            goto nextnode_25082634;
         end;
         if _strfmt_25082634_ in ('5',
         '7',
         '6',
         '9',
         '8') then do;

         _new_id_ = 3;
         end;
         else if _strfmt_25082634_ in ('4',
         '1',
         '0',
         '3',
         '2') then do;

         _new_id_ = 4;
         end;
         else if MISSING(DerogatoryMarks) then do;
         _new_id_ = 4;
         end;
         else do;
         _new_id_ = 4;
         end;
   end;
   else if _node_id_ eq 2 then do;
         _leaf_id_ = 2;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =                    1;
         _dt_fi_25082634_{1} =                    1;
         _dt_fi_25082634_{2} =                    0;
   end;
   else if _node_id_ eq 3 then do;
         _leaf_id_ = 3;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =                    1;
         _dt_fi_25082634_{1} =                    1;
         _dt_fi_25082634_{2} =                    0;
   end;
   else if _node_id_ eq 4 then do;
         _leaf_id_ = 4;
         _new_id_ = -1;
         _dt_pred_lev_ = 1;
         _dt_pred_prob_ =     0.92560348239018;
         _dt_fi_25082634_{1} =     0.07439651760981;
         _dt_fi_25082634_{2} =     0.92560348239018;
   end;
   if _new_id_ >= 0 then do;
       _node_id_ = _new_id_;
      goto nextnode_25082634;
   end;

   length I_Default $12;
   I_Default = _tlevname_25082634_{_dt_pred_lev_+1};
   label I_Default = 'Into: Default';
   _i_ = 1;
   _dt_predp_ = _dt_fi_25082634_{_i_};
   P_Default1 = _dt_predp_;
   label P_Default1 = 'Predicted: Default=1';
   _i_+1;
   _dt_predp_ = _dt_fi_25082634_{_i_};
   P_Default0 = _dt_predp_;
   label P_Default0 = 'Predicted: Default=0';
   _i_+1;
   drop _dt_predp_;
   drop _i_;
   drop _dt_pred_lev_;
   drop _dt_pred_prob_;
   drop _node_id_;
   drop _new_id_;



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
