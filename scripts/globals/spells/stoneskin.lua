-----------------------------------------
-- Spell: Stoneskin
-----------------------------------------
-- http://wiki.ffxiclopedia.org/wiki/Stoneskin
-- Max 350 damage absorbed
-- (before cap bonus gear, with no settings.lua adjustment)
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local pMod = (caster:getSkillLevel(ENHANCING_MAGIC_SKILL)/3)+caster:getStat(MOD_MND);
    local pAbs = 0;
    local pEquipMods = (caster:getMod(MOD_STONESKIN_BONUS_HP));
    local duration = 300;
    if (pMod < 80) then
        pAbs = pMod;
    elseif (pMod <= 130) then
        pAbs = 2*pMod - 60;
    elseif (pMod > 130) then
        pAbs = 3*pMod - 190;
    end

    -- hard cap of 350 from natural power
    -- pAbs = utils.clamp(1, STONESKIN_CAP); This just always sets it to 350, let's use the actual value, shall we?
    pAbs = utils.clamp(pAbs, 1, STONESKIN_CAP);

    if (caster:hasStatusEffect(dsp.effects.COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    local final = pAbs + pEquipMods;
    if (target:addStatusEffect(dsp.effects.STONESKIN,final,0,duration)) then
        spell:setMsg(msgBasic.MAGIC_GAIN_EFFECT);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end

    return dsp.effects.STONESKIN;
end;
