-----------------------------------------
-- Spell: Foe Requiem IV
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local effect = EFFECT_REQUIEM;
    local duration = 111;
    local power = 4;

    local pCHR = caster:getStat(MOD_CHR);
    local mCHR = target:getStat(MOD_CHR);
    local dCHR = (pCHR - mCHR);
    local params = {};
    params.diff = nil;
    params.attribute = MOD_CHR;
    params.skillType = SINGING_SKILL;
    params.bonus = 0;
    params.effect = nil;
    resm = applyResistance(caster, target, spell, params);
    if (resm < 0.5) then
        spell:setMsg(msgBasic.MAGIC_RESIST); -- resist message
        return 1;
    end

    local iBoost = caster:getMod(MOD_REQUIEM_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    power = power + iBoost;

    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
    elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
        power = power * 1.5;
    end
    caster:delStatusEffect(EFFECT_MARCATO);

    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end
    -- Try to overwrite weaker slow / haste
    if (canOverwrite(target, effect, power)) then
        -- overwrite them
        target:delStatusEffect(effect);
        target:addStatusEffect(effect,power,3,duration);
        spell:setMsg(msgBasic.MAGIC_ENFEEB);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- no effect
    end

    return effect;
end;
