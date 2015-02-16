-----------------------------------------
-- Spell: Fowl Aubade
-- Increases Sleep Resistance to 
-- Party Members within target AoE
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	-- Mostly Guestimate ??
	local duration = 120;
	local power = 20;
	local sItem = caster:getEquipID(SLOT_RANGED);
	local sLvl = caster:getSkillLevel(SINGING_SKILL); -- Gets skill level of Singing
	local weapon = caster:getEquipID(SLOT_MAIN);
	local weapon2 = caster:getEquipID(SLOT_SUB);
	
	if (caster:getEquipID(SLOT_BODY) == 11093) then -- Aoidos Hongreline +2
		duration = duration * 1.1;
	elseif(caster:getEquipID(SLOT_BODY) == 11193) then -- Aoidos Hongreline +1
		duration = duration * 1.05;
	end
	if (caster:getEquipID(SLOT_NECK) == 11618) then -- Aoidos Matinee
		duration = duration * 1.1;
	end
	if (caster:getEquipID(SLOT_LEGS) == 28074) then -- Marduks Shalwar +1
		duration = duration * 1.1;
	end
	if (weapon == 19000 or weapon2 == 19000) then -- Carnwenhan Lvl 75
		duration = duration * 1.1;
	elseif (weapon == 19069 or weapon2 == 19069) then -- Carnwenhan Lvl 80
		duration = duration * 1.2;
	elseif (weapon == 19089 or weapon2 == 19089) then -- Carnwenhan Lvl 85
		duration = duration * 1.3;
	elseif (weapon == 19089 or weapon2 == 19089) then -- Carnwenhan Lvl 90
		duration = duration * 1.4;
	elseif (weapon == 19719 or weapon2 == 19719) then -- Carnwenhan Lvl 95
		duration = duration * 1.4;
	elseif (weapon == 19828 or weapon2 == 19828) then -- Carnwenhan Lvl 99
		duration = duration * 1.5;
	elseif (weapon == 19957 or weapon2 == 19957) then -- Carnwenhan Lvl 99 - 2
		duration = duration * 1.4;
	end
	if(sItem == 18342 or sItem == 18577 or sItem == 18578) then -- Gjallarhorn Lvl 75 - 80 - 85
		power = power + 4;
	elseif(sItem == 18579 or sItem == 18580) then -- Gjallarhorn Lvl 90 - 95
		power = power + 6;
	elseif(sItem == 18840 or sItem == 18572) then -- Gjallarhorn Lvl 99 - 99-2
		power = power + 8;
	end
	if (sItem == 18575) then -- Daurdabla Lvl 90
		duration = duration * 1.25;
	elseif (sItem == 18576 or sItem == 18839 or sItem == 18571) then -- Daurdabla Lvl 95 - 99 - 99-2
		duration = duration * 1.3;
	end
	
    -- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
    -- Since all the tiers use the same effect buff it is hard to delete a specific one.
    target:delStatusEffect(EFFECT_AUBADE);
    target:addStatusEffect(EFFECT_AUBADE,power,0,duration);
    spell:setMsg(230);
    return EFFECT_AUBADE;
end;