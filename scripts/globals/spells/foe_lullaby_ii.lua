-----------------------------------------
-- Spell: Foe Lullaby II
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
    local duration = 60;
    local pCHR = caster:getStat(MOD_CHR);
    local mCHR = target:getStat(MOD_CHR);
    local dCHR = (pCHR - mCHR);
    local params = {};
    params.diff = nil;
    params.attribute = MOD_CHR;
    params.skillType = SINGING_SKILL;
    params.bonus = 0;
    params.effect = EFFECT_LULLABY;
    resm = applyResistanceEffect(caster, target, spell, params);

    if (resm < 0.5) then
        spell:setMsg(85);--resist message
    else
        local iBoost = caster:getMod(MOD_LULLABY_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);

        duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

        if (target:addStatusEffect(EFFECT_LULLABY,1,0,duration)) then
            spell:setMsg(237);
        else
            spell:setMsg(75);
        end
    end

    return EFFECT_LULLABY;
end;