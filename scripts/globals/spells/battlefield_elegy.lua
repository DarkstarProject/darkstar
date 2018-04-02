-----------------------------------------
-- Spell: Battlefield Elegy
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local duration = 120;
    local power = 256;

    local pCHR = caster:getStat(MOD_CHR);
    local mCHR = target:getStat(MOD_CHR);
    local dCHR = (pCHR - mCHR);
    local params = {};
    params.diff = nil;
    params.attribute = MOD_CHR;
    params.skillType = SINGING_SKILL;
    params.bonus = 0;
    params.effect = dsp.effects.ELEGY;
    resm = applyResistanceEffect(caster, target, spell, params);

    if (resm < 0.5) then
        spell:setMsg(msgBasic.MAGIC_RESIST); -- resist message
    else
        local iBoost = caster:getMod(MOD_ELEGY_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
        power = power + iBoost*10;

        if (caster:hasStatusEffect(dsp.effects.SOUL_VOICE)) then
            power = power * 2;
        elseif (caster:hasStatusEffect(dsp.effects.MARCATO)) then
            power = power * 1.5;
        end
        caster:delStatusEffect(dsp.effects.MARCATO);

        duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

        if (caster:hasStatusEffect(dsp.effects.TROUBADOUR)) then
            duration = duration * 2;
        end

        -- Try to overwrite weaker elegy
        if (target:addStatusEffect(dsp.effects.ELEGY,power,0,duration)) then
            spell:setMsg(msgBasic.MAGIC_ENFEEB);
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- no effect
        end

    end

    return dsp.effects.ELEGY;
end;
