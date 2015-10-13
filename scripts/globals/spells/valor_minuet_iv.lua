-----------------------------------------
-- Spell: Valor Minuet IV
-- Grants Attack bonus to all allies.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	local sLvl = caster:getSkillLevel(SKILL_SNG); -- Gets skill level of Singing
    local iLvl = caster:getWeaponSkillLevel(SLOT_RANGED);

	local power = 31;

    if (sLvl+iLvl > 300) then
        power = power + math.floor((sLvl+iLvl-300) / 6);
    end
    
	if (power >= 56) then
		power = 56;
	end
    
	local iBoost = caster:getMod(MOD_MINUET_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    if (iBoost > 0) then
        power = power + 1 + (iBoost-1)*4;
    end

    power =  power + caster:getMerit(MERIT_MINUET_EFFECT);
    
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
    
	if not (target:addBardSong(caster,EFFECT_MINUET,power,0,duration,caster:getID(), 0, 4)) then
        spell:setMsg(75);
    end

	return EFFECT_MINUET;
end;