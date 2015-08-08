-----------------------------------------
-- Spell: Blood Drain
-- Steals an enemy's HP. Ineffective against undead
-- Spell cost: 10 MP
-- Monster Type: Giant Bats
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 2
-- Stat Bonus: HP-5, MP+5
-- Level: 20
-- Casting Time: 4 seconds
-- Recast Time: 90 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: None
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/bluemagic");

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

    local dmg = 1 + (0.705 * (caster:getSkillLevel(BLUE_SKILL)) + caster:getMod(1 + BLUE_SKILL));
    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_MND)-target:getStat(MOD_MND),BLUE_SKILL,1.0);
    dmg = dmg*resist;
    dmg = addBonuses(caster,spell,target,dmg);
    dmg = adjustForTarget(target,dmg,spell:getElement());
    if (dmg > (caster:getSkillLevel(BLUE_SKILL) + 20)) then
        dmg = (caster:getSkillLevel(BLUE_SKILL) + 20);
    end

    if (dmg < 0) then
        dmg = 0
    end
    
    if (target:isUndead()) then
        spell:setMsg(75); 
        return dmg;
    end

    dmg = finalMagicAdjustments(caster,target,spell,dmg);
    dmg = (dmg * DRAIN_POWER);
    spell:setMsg(227);
    caster:addHP(dmg);
    
    return dmg;
end;