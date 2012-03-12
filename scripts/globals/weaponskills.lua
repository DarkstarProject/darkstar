--Contains all common weaponskill calculations including but not limited to:
-- fSTR
-- Alpha
-- Ratio -> cRatio
-- min/max cRatio
-- applications of fTP
-- applications of critical hits ('Critical hit rate varies with TP.')
-- applications of duration mods ('Duration of effect varies with TP.')
-- applications of damage mods ('Damage varies with TP.')
-- performance of the actual WS (rand numbers, etc)


--Given the attacker's str and the mob's vit, fSTR is calculated
function fSTR(atk_str,def_vit)
	local dSTR = atk_str - def_vit;
	if (dSTR >= 12) then
		fSTR2 = ((dSTR+4)/2);
	elseif (dSTR >= 6) then
		fSTR2 = ((dSTR+6)/2);
	elseif (dSTR >= 1) then
		fSTR2 = ((dSTR+7)/2);
	elseif (dSTR >= -2) then
		fSTR2 = ((dSTR+8)/2);
	elseif (dSTR >= -7) then
		fSTR2 = ((dSTR+9)/2);
	elseif (dSTR >= -15) then
		fSTR2 = ((dSTR+10)/2);
	elseif (dSTR >= -21) then
		fSTR2 = ((dSTR+12)/2);
	else
		fSTR2 = ((dSTR+13)/2);
	end
	--No Weapon Ranks yet.
	fSTR = (fSTR2/2);
	return fSTR;
end;

--obtains alpha, used for working out WSC
function getAlpha(level)
alpha = 1.00; 
if (level <= 5) then
	alpha = 1.00;
elseif (level <= 11) then
	alpha = 0.99;
elseif (level <= 17) then
	alpha = 0.98;
elseif (level <= 23) then
	alpha = 0.97;
elseif (level <= 29) then
	alpha = 0.96;
elseif (level <= 35) then
	alpha = 0.95;
elseif (level <= 41) then
	alpha = 0.94;
elseif (level <= 47) then
	alpha = 0.93;
elseif (level <= 53) then
	alpha = 0.92;
elseif (level <= 59) then
	alpha = 0.91;
elseif (level <= 61) then
	alpha = 0.90;
elseif (level <= 63) then
	alpha = 0.89;
elseif (level <= 65) then
	alpha = 0.88;
elseif (level <= 67) then
	alpha = 0.87;
elseif (level <= 69) then
	alpha = 0.86;
elseif (level <= 71) then
	alpha = 0.85;
elseif (level <= 73) then
	alpha = 0.84;
elseif (level <= 75) then
	alpha = 0.83;
elseif (level <= 99) then
	alpha = 0.85;
end
return alpha;
 end; 