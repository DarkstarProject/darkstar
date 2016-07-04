-----------------------------------------
-- Spell: Sentinel's Scherzo
-- Mitigates the impact of severely damaging attacks for party members within an area of effect.
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

    local power = math.floor((sLvl+iLvl-350) / 10);
    
    if (power >= 45) then
        power = 45;
    end
    
    local iBoost = caster:getMod(MOD_SCHERZO_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    power = power + iBoost;
    
    local duration = 120;
    
    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);
    
    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        duration = duration * 2;
    elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
        duration = duration * 1.5;
    end
    caster:delStatusEffect(EFFECT_MARCATO);
    
    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end
    
    if not (target:addBardSong(caster,EFFECT_SCHERZO,power,0,duration,caster:getID(), 0, 1)) then
        spell:setMsg(75);
    end

    return EFFECT_SCHERZO;
end;
