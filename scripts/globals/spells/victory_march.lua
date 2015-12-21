-----------------------------------------
-- Spell: Victory March
-- Gives party members Haste
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

    local power = 43;

    if (sLvl+iLvl > 300) then
        power = power + math.floor((sLvl+iLvl-300) / 7);
    end
    
    if (power >= 96) then
        power = 96;
    end
    
    local iBoost = caster:getMod(MOD_MARCH_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    power = power + iBoost*16;
    
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
    
    if not (target:addBardSong(caster,EFFECT_MARCH,power,0,duration,caster:getID(), 0, 2)) then
        spell:setMsg(75);
    end

    return EFFECT_MARCH;
end;