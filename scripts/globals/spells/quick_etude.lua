-----------------------------------------
-- Spell: Quick Etude
-- Static AGI Boost, BRD 28
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local sLvl = caster:getSkillLevel(SKILL_SNG); -- Gets skill level of Singing
    local iLvl = caster:getWeaponSkillLevel(SLOT_RANGED);

    local power = 0;

    if (sLvl+iLvl <= 181) then
        power = 3;
    elseif ((sLvl+iLvl >= 182) and (sLvl+iLvl <= 235)) then
        power = 4;
    elseif ((sLvl+iLvl >= 236) and (sLvl+iLvl <= 288)) then
        power = 5;
    elseif ((sLvl+iLvl >= 289) and (sLvl+iLvl <= 342)) then
        power = 6;
    elseif ((sLvl+iLvl >= 343) and (sLvl+iLvl <= 396)) then
        power = 7;
    elseif ((sLvl+iLvl >= 397) and (sLvl+iLvl <= 449)) then
        power = 8;
    elseif (sLvl+iLvl >= 450) then
        power = 9;
    end

    local iBoost = caster:getMod(MOD_ETUDE_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    power = power + iBoost;

    if (caster:hasStatusEffect(dsp.effects.SOUL_VOICE)) then
        power = power * 2;
    elseif (caster:hasStatusEffect(dsp.effects.MARCATO)) then
        power = power * 1.5;
    end
    caster:delStatusEffect(dsp.effects.MARCATO);

    local duration = 120;
    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(dsp.effects.TROUBADOUR)) then
        duration = duration * 2;
    end

    if not (target:addBardSong(caster,dsp.effects.ETUDE,power,0,duration,caster:getID(), MOD_AGI, 1)) then
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end

    return dsp.effects.ETUDE;
end;
