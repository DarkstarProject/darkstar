-----------------------------------------
-- Spell: Fire Carol II
-- Increases resistance against fire and
-- sometimes nullifies fire damage for
-- party members within area of effect. 
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
        return 0;
end;

function onSpellCast(caster,target,spell)

	local sLvl = caster:getSkillLevel(SKILL_SNG); -- Gets skill level of Singing
	local iLvl = caster:getWeaponSkillLevel(SLOT_RANGED);

	local power = 50;

	if (sLvl+iLvl > 200) then
		power = power + math.floor((sLvl+iLvl-200) / 10);
	end
   
	if(power >= 60) then
		power = 60;
	end
   
	local iBoost = caster:getMod(MOD_CAROL) + caster:getMod(MOD_ALL_SONGS);
	power = power + iBoost*5;

	if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
		power = power * 2;
	elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
		power = power * 1.5;
	end
	caster:delStatusEffect(EFFECT_MARCATO);
   
	local duration = 120;
	duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION)/100) + 1);
   
	if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
		duration = duration * 2;
	end

	if not (target:addBardSong(caster,EFFECT_CAROL,power,0,duration,caster:getID(), ELE_FIRE, 2)) then
		spell:setMsg(75);
	end

	return EFFECT_CAROL;
end;