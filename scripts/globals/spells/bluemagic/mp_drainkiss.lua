-----------------------------------------
-- Spell: MP Drainkiss
-- Steals an enemy's MP. Ineffective against undead
-- Spell cost: 20 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 4
-- Stat Bonus: MP+5
-- Level: 42
-- Casting Time: 4 seconds
-- Recast Time: 90 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: None
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

    -- also have small constant to account for 0 dark skill
    local dmg = 5 + 0.375 * (caster:getSkillLevel(BLUE_SKILL) + caster:getMod(79 + BLUE_SKILL));
    --get resist multiplier (1x if no resist)
    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT)-target:getStat(MOD_INT),BLUE_SKILL,1.0);
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
    
    if (target:isUndead()) then
        spell:setMsg(75); -- No effect
        return dmg;
    end

    if (target:getMP() > dmg) then
        caster:addMP(dmg);
        target:delMP(dmg);
    else
        dmg = target:getMP();
        caster:addMP(dmg);
        target:delMP(dmg);
    end

    spell:setMsg(228); --change msg to 'xxx mp drained from the yyyy.'
    
    return dmg;
end;