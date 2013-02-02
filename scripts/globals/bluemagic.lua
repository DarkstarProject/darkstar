require("scripts/globals/status")

BLUE_SKILL = 43;

-- The type of spell.
SPELLTYPE_PHYSICAL = 0;
SPELLTYPE_MAGICAL = 1;
SPELLTYPE_RANGED = 2;
SPELLTYPE_BREATH = 3;
SPELLTYPE_DRAIN = 4;
SPELLTYPE_SPECIAL = 5;

-- The TP modifier
TPMOD_NONE = 0;
TPMOD_CRITICAL = 1;
TPMOD_DAMAGE = 2;
TPMOD_ACC = 3;

-- The damage type for the spell
DMGTYPE_BLUNT = 0;
DMGTYPE_PIERCE = 1;
DMGTYPE_SLASH = 2;
DMGTYPE_H2H = 3;

-- The SC the spell makes
SC_IMPACTION = 0;
SC_TRANSFIXION = 1;
SC_DETONATION = 2;
SC_REVERBERATION = 3;
SC_SCISSION = 4;
SC_INDURATION = 5;
SC_LIQUEFACTION = 6;
SC_COMPRESSION = 7;

SC_FUSION = 8;
SC_FRAGMENTATION = 9;
SC_DISTORTION = 10;
SC_GRAVITATION = 11;

SC_DARK = 12;
SC_LIGHT = 13;

-- Get the damage for a blue magic physical spell.
-- caster - The entity casting the spell.
-- target - The target of the spell.
-- spell - The blue magic spell itself.
-- params - The parameters for the spell. Broken down into:
--      .tpmod - The TP modifier for the spell (e.g. damage varies, critical varies with TP, etc). Should be a TPMOD_xxx enum.
--      .numHits - The number of hits in the spell.
--      .multiplier - The base multiplier for the spell (not under Chain Affinity) - Every spell must specify this. (equivalent to TP 0%)
--      .tp150 - The TP modifier @ 150% TP (damage multiplier, crit chance, etc. 1.0 = 100%, 2.0 = 200% NOT 100=100%). 
--               This value is interpreted as crit chance or dmg multiplier depending on the TP modifier (tpmod).
--      .tp300 - The TP modifier @ 300% TP (damage multiplier, crit chance, etc. 1.0 = 100%, 2.0 = 200% NOT 100=100%)
--               This value is interpreted as crit chance or dmg multiplier depending on the TP modifier (tpmod).
--      .azuretp - The TP modifier under Azure Lore (damage multiplier, crit chance, etc. 1.0 = 100%, 2.0 = 200% NOT 100=100%)
--                  This value is interpreted as crit chance or dmg multiplier depending on the TP modifier (tpmod).
--      .duppercap - The upper cap for D for this spell.
--      .str_wsc - The decimal % value for STR % (e.g. STR 20% becomes 0.2)
--      .dex_wsc - Same as above.
--      .vit_wsc - Same as above.
--      .int_wsc - Same as above.
--      .mnd_wsc - Same as above.
--      .chr_wsc - Same as above.
--      .agi_wsc - Same as above.
function BluePhysicalSpell(caster, target, spell, params)
    -- store related values
    local magicskill = caster:getSkillLevel(BLUE_SKILL) + caster:getMod(79 + BLUE_SKILL); -- Base skill + equip mods
    -- TODO: Under Chain affinity?
    -- TODO: Under Efflux?
    -- TODO: Merits.
    -- TODO: Under Azure Lore.
    
    ---------------------------------
    -- Calculate the final D value  -
    ---------------------------------
    -- worked out from http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- Final D value = floor(D+fSTR+WSC) * Multiplier
    
    local D =  math.floor((magicskill * 0.11)) * 2 + 3;
    -- cap D
    if (D > params.duppercap) then
        D = params.duppercap;
    end
    
    --print("D val is ".. D);
    
    local fStr = BluefSTR(caster:getStat(MOD_STR) - target:getStat(MOD_VIT));
    if (fStr > 22) then
        fStr = 22; -- TODO: Smite of Rage doesn't have this cap applied.
    end
    
    --print("fStr val is ".. fStr);
    
    local WSC = BlueGetWsc(caster, params);
    
    --print("wsc val is ".. WSC);
    
    -- TODO: If under CA, replace multiplier with fTP(multiplier, tp150, tp300)
    -- TODO: Modify multiplier to account for family bonus/penalty
    local finalD = math.floor(D + fStr + WSC) * params.multiplier;
    
    --print("Final D is ".. finalD);
    
    ----------------------------------------------
    -- Get the possible pDIF range and hit rate --
    ----------------------------------------------
    local cratio = BluecRatio(caster:getStat(MOD_ATT) / target:getStat(MOD_DEF), caster:getMainLvl(), target:getMainLvl());
	local hitrate = BlueGetHitRate(caster,target,true);
    
    --print("Hit rate "..hitrate);
    --print("pdifmin "..cratio[1].." pdifmax "..cratio[2]);
    
    -------------------------
    -- Perform the attacks --
    -------------------------
    local hitsdone = 0;
    local hitslanded = 0;
    local finaldmg = 0;
    
    while (hitsdone < params.numhits) do 
        local chance = math.random();
        if (chance <= hitrate) then -- it hit
            -- TODO: Check for shadow absorbs.
        
            -- Generate a random pDIF between min and max
            local double pdif = math.random((cratio[1]*1000),(cratio[2]*1000)); 
            pdif = pdif/1000;
        
            -- Apply it to our final D
            if (hitsdone == 0) then -- only the first hit benefits from multiplier
                finaldmg = finaldmg + (finalD * pdif);
            else
                finaldmg = finaldmg + ((math.floor(D + fStr + WSC)) * pdif); -- same as finalD but without multiplier (it should be 1.0)
            end
            
            hitslanded = hitslanded + 1;
            
            -- increment target's TP (10TP per hit landed)
            target:addTP(10);
        end
        
        hitsdone = hitsdone + 1;
    end
    
    --print("Hits landed "..hitslanded.."/"..hitsdone.." for total damage: "..finaldmg);
    
    return finaldmg;
end;

function BlueFinalAdjustments(caster, target, spell, dmg, params)
    if(dmg<0) then
        dmg = 0;
    end

    dmg = dmg - target:getMod(MOD_PHALANX);
    if(dmg<0) then
        dmg = 0;
    end

    --handling stoneskin
    local skin = target:getMod(MOD_STONESKIN);
    if(skin>0) then
        if(skin >= dmg) then --absorb all damage
            target:delMod(MOD_STONESKIN,dmg);
            if(target:getMod(MOD_STONESKIN)==0) then
                target:delStatusEffect(EFFECT_STONESKIN);
            end
            return 0;
        else --absorbs some damage then wear
            target:delMod(MOD_STONESKIN,skin);
            target:delStatusEffect(EFFECT_STONESKIN);
            return dmg - skin;
        end
    end

    target:delHP(dmg);
    target:updateEnmityFromDamage(caster,dmg);
    -- TP has already been dealt with.
    return dmg;
end;

------------------------------
-- Utility functions below ---
------------------------------

function BlueGetWsc(attacker, params)
    wsc = (attacker:getStat(MOD_STR) * params.str_wsc + attacker:getStat(MOD_DEX) * params.dex_wsc + 
		 attacker:getStat(MOD_VIT) * params.vit_wsc + attacker:getStat(MOD_AGI) * params.agi_wsc + 
		 attacker:getStat(MOD_INT) * params.int_wsc + attacker:getStat(MOD_MND) * params.mnd_wsc + 
		 attacker:getStat(MOD_CHR) * params.chr_wsc) * BlueGetAlpha(attacker:getMainLvl());
    return wsc;
end;

--Given the raw ratio value (atk/def) and levels, returns the cRatio (min then max)
function BluecRatio(ratio,atk_lvl,def_lvl)
	--Level penalty...
	local double levelcor = 0;
	if (atk_lvl < def_lvl) then
		levelcor = 0.05 * (def_lvl - atk_lvl);
	end
	ratio = ratio - levelcor;
	
	--apply caps
	if(ratio<0) then
		ratio = 0;
	elseif(ratio>2) then
		ratio = 2;
	end
	
	--Obtaining cRatio_MIN
	local double cratiomin = 0;
	if (ratio<1.25) then
		cratiomin = 1.2 * ratio - 0.5;
	elseif (ratio>=1.25 and ratio<=1.5) then
		cratiomin = 1;
	elseif (ratio>1.5 and ratio<=2) then
		cratiomin = 1.2 * ratio - 0.8;
	end
	
	--Obtaining cRatio_MAX
	local double cratiomax = 0;
	if (ratio<0.5) then
		cratiomax = 0.4 + 1.2 * ratio;
	elseif (ratio<=0.833 and ratio>=0.5) then
		cratiomax = 1;
	elseif (ratio<=2 and ratio>0.833) then
		cratiomax = 1.2 * ratio;
	end
	cratio = {};
	if(cratiomin < 0) then 
		cratiomin = 0;
	end
	cratio[1] = cratiomin;
	cratio[2] = cratiomax;
	return cratio;
end;

-- Gets the fTP multiplier by applying 2 straight lines between ftp1-ftp2 and ftp2-ftp3
-- tp - The current TP
-- ftp1 - The TP 0% value
-- ftp2 - The TP 150% value
-- ftp3 - The TP 300% value
function BluefTP(tp,ftp1,ftp2,ftp3)
	if(tp>=0 and tp<150) then
		return ftp1 + ( ((ftp2-ftp1)/100) * tp);
	elseif(tp>=150 and tp<=300) then
		--generate a straight line between ftp2 and ftp3 and find point @ tp
		return ftp2 + ( ((ftp3-ftp2)/100) * (tp-150));
	else
		print("blue fTP error: TP value is not between 0-300!");
	end
	return 1; --no ftp mod
end;

function BluefSTR(dSTR)
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
    
	return fSTR2;
end;

function BlueGetHitRate(attacker,target,capHitRate)
	local int acc = attacker:getACC();
	local int eva = target:getEVA();
	
	if(attacker:getMainLvl() > target:getMainLvl()) then --acc bonus!
		acc = acc + ((attacker:getMainLvl()-target:getMainLvl())*4);
	elseif(attacker:getMainLvl() < target:getMainLvl()) then --acc penalty :(
		acc = acc - ((target:getMainLvl()-attacker:getMainLvl())*4);
	end
	
	local double hitdiff = 0;
	local double hitrate = 75;
	if (acc>eva) then
	hitdiff = (acc-eva)/2;
	end
	if (eva>acc) then
	hitdiff = ((-1)*(eva-acc))/2;
	end
	
	hitrate = hitrate+hitdiff;
	hitrate = hitrate/100;
	
	
	--Applying hitrate caps
	if(capHitRate) then --this isn't capped for when acc varies with tp, as more penalties are due
		if (hitrate>0.95) then
			hitrate = 0.95;
		end
		if (hitrate<0.2) then
			hitrate = 0.2;
		end
	end
	return hitrate;
end;

--obtains alpha, used for working out WSC
function BlueGetAlpha(level)
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