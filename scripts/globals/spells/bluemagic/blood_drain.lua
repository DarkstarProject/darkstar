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
require("scripts/globals/bluemagic");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local dmg = 1 + (0.705 * caster:getSkillLevel(BLUE_SKILL));
    local params = {};
    params.diff = caster:getStat(MOD_MND)-target:getStat(MOD_MND);
    params.attribute = MOD_MND;
    params.skillType = BLUE_SKILL;
    params.bonus = 1.0;
    local resist = applyResistance(caster, target, spell, params);
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
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        return dmg;
    end

    if (target:getHP() < dmg) then
        dmg = target:getHP();
    end

    dmg = BlueFinalAdjustments(caster,target,spell,dmg);
    caster:addHP(dmg);

    return dmg;
end;
