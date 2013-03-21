-----------------------------------
-- Spell: Metallic Body
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------
-- onSpellcast
-----------------------------------

function OnMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster, target, spell)
    local blueskill = caster:getSkillLevel(BLUE_SKILL);

    local power = (blueskill/3) + (caster:getMainLvl()/3) + 10;

    if(power > 150) then
        power = 150;
    end

    if(target:addStatusEffect(EFFECT_STONESKIN,power,0,300)) then
        spell:setMsg(230);
    else
        spell:setMsg(75);
    end

    return EFFECT_STONESKIN;
end;