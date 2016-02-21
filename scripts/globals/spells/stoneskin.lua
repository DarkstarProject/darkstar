-----------------------------------------
-- Spell: Stoneskin
-----------------------------------------
-- http://wiki.ffxiclopedia.org/wiki/Stoneskin
-- Max 350 damage absorbed

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
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

    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    local final = pAbs + pEquipMods;
    if (target:addStatusEffect(EFFECT_STONESKIN,final,0,duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(MMSG_BUFF_FAIL);
    end

    return EFFECT_STONESKIN;
end;