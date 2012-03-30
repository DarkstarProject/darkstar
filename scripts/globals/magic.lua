
-- USED FOR DAMAGING MAGICAL SPELLS (Stages 1 and 2 in Calculating Magic Damage on wiki)
--Calculates magic damage using the standard magic damage calc.
--Does NOT handle resistance.
-- Inputs:
-- V - The base damage of the spell
-- M - The INT multiplier of the spell
-- skilltype - The skill ID of the spell.
-- atttype - The attribute type (usually MOD_INT , except for things like Banish which is MOD_MND)
-- hasMultipleTargetReduction - true if damage is reduced on AoE. False otherwise (e.g. Charged Whisker vs -ga3 spells)
--
-- Output:
-- The total damage, before resistance and before equipment (so no HQ staff bonus worked out here).
SOFT_CAP = 60; --guesstimated
HARD_CAP = 120; --guesstimated
function calculateMagicDamage(V,M,player,spell,target,skilltype,atttype,hasMultipleTargetReduction)
	dint = player:getStat(atttype) - target:getStat(atttype);
	dmg = V;
	if(dint<=0) then --If dINT penalises, it's always M=1
		dmg = dmg + dint;
	elseif(dint > 0 and dint <= SOFT_CAP) then --The standard calc, most spells hit this
		dmg = dmg + (dint*M);
	elseif(dint > 0 and dint > SOFT_CAP and dint < HARD_CAP) then --After SOFT_CAP, INT is only half effective
		dmg = dmg + SOFT_CAP*M + ((dint-SOFT_CAP)*M)/2;
	elseif(dint > 0 and dint > SOFT_CAP and dint >= HARD_CAP) then --After HARD_CAP, INT has no effect.
		dmg = dmg + HARD_CAP*M;
	end
	
	--TODO: Handle multiple target reduction (no LUA methods exist for this yet)
	
	return dmg;
end

-- USED FOR DAMAGING MAGICAL SPELLS. Stage 3 of Calculating Magic Damage on wiki
--Reduces damage if it resists.
-- 
-- Output:
-- The factor to multiply down damage (1/2 1/4 1/8 1/16) - In this format so this func can be used for enfeebs on duration.
function applyResistance(player,spell,target)
	--TODO:
	--Resist calc (account for gear etc)
	-- Apply on dmg, 1/2 1/4 1/8 1/16
	return 1;
end

-- USED FOR DAMAGING MAGICAL SPELLS. Stages 4,5,6,7,8 of Calculating Magic Damage on Wiki
function applyBonuses(dmg,player,spell,target)
	--TODO:
	--Staff Bonus
	--Day of the week / Weather bonus
	--MB bonus
	--MAB/MDB
	--Target adjustment %
	return dmg;
end