-----------------------------------------
-- Spell: Drain
-- Drain functions only on skill level!!
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    --calculate raw damage (unknown function  -> only dark skill though) - using http://www.bluegartr.com/threads/44518-Drain-Calculations
    -- also have small constant to account for 0 dark skill
    local dmg = 10 + (1.035 * (caster:getSkillLevel(DARK_MAGIC_SKILL)) + caster:getMod(79 + DARK_MAGIC_SKILL));
    
    if (dmg > (caster:getSkillLevel(DARK_MAGIC_SKILL) + 20)) then
        dmg = (caster:getSkillLevel(DARK_MAGIC_SKILL) + 20);
    end
    
    --get resist multiplier (1x if no resist)
    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT)-target:getStat(MOD_INT),DARK_MAGIC_SKILL,1.0);
    --get the resisted damage
    dmg = dmg*resist;
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster,spell,target,dmg);
    --add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement());
    --add in final adjustments

    if (dmg < 0) then
        dmg = 0
    end

    if (target:getHP() < dmg) then
        dmg = target:getHP();
    end
    
    if (target:isUndead()) then
        spell:setMsg(75); -- No effect
        return dmg;
    end

    dmg = finalMagicAdjustments(caster,target,spell,dmg);

    caster:addHP(dmg);
    return dmg;

end;
