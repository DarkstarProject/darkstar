-----------------------------------------
-- Spell: Sage Etude
-- Static INT Boost, BRD 66
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

	local sLvl = caster:getSkillLevel(SKILL_SNG); -- Gets skill level of Singing
    local iLvl = caster:getWeaponSkillLevel(SLOT_RANGED);

	local power = 0;

    if (sLvl+iLvl <= 416) then
        power = 12;		
	elseif ((sLvl+iLvl >= 417) and (sLvl+iLvl <= 445)) then
		power = 13;
	elseif ((sLvl+iLvl >= 446) and (sLvl+iLvl <= 474)) then
		power = 14;
	elseif (sLvl+iLvl >= 475) then 
		power = 15;
    end
    
	local iBoost = caster:getMod(MOD_ETUDE_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    power = power + iBoost;
    
    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
    elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
        power = power * 1.5;
    end
    caster:delStatusEffect(EFFECT_MARCATO);
    
    local duration = 120;
    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);
    
    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end
    
	if not (target:addBardSong(caster,EFFECT_ETUDE,power,10,duration,caster:getID(), MOD_INT, 2)) then
        spell:setMsg(75);
    end
	   return EFFECT_ETUDE;
end;