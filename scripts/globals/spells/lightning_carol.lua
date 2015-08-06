-----------------------------------------
-- Spell: Lightning Carol
-- Increases lightning resistance for party members within the area of effect.
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

	local power = 20;

    if (sLvl+iLvl > 200) then
        power = power + math.floor((sLvl+iLvl-200) / 10);
    end
    
	if (power >= 40) then
		power = 40;
	end
    
	local iBoost = caster:getMod(MOD_CAROL_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    power = power + iBoost*5;
    
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
    
	if not (target:addBardSong(caster,EFFECT_CAROL,power,0,duration,caster:getID(), ELE_LIGHTNING, 1)) then
        spell:setMsg(75);
    end

	return EFFECT_CAROL;
end;