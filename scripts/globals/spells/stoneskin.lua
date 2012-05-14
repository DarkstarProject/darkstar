-----------------------------------------
-- Spell: Stoneskin
-----------------------------------------
-- http://wiki.ffxiclopedia.org/wiki/Stoneskin
-- Max 350 damage absorbed

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	effect = target:getStatusEffect(EFFECT_STONESKIN);
	pMod = (caster:getSkillLevel(ENHANCING_MAGIC_SKILL)/3)+caster:getStat(MOD_MND);
	pAbs = 0;
	pEquipMods = 0;
	if (pMod < 80) then
		pAbs = pMod;
	elseif (pMod <= 130) then
		pAbs = 2*pMod - 60;
	elseif (pMod > 130) then
		pAbs = 3*pMod - 190;
	end
	if (pAbs > 350) then -- hard cap of 350 from natural power
		pAbs = 350;
	end
	-- equipment mods
	if (caster:getEquipID(9) == 13177) then -- stone gorget
		pEquipMods = pEquipMods + 30;
	end
	if (caster:getEquipID(6) == 15034) then -- stone mufflers
		pEquipMods = pEquipMods + 30;
	end
	if (caster:getEquipID(10) == 15960) then -- siegel sash
		pEquipMods = pEquipMods + 20;
	end
	if (caster:getEquipID(7) == 11949) then -- haven hose
		pEquipMods = pEquipMods + 20;
	end
	final = pAbs + pEquipMods;
	if (effect == nil) then
		target:addStatusEffect(EFFECT_STONESKIN,final,0,300);
		spell:setMsg(0);
	else
		spell:setMsg(75);
	end
end;