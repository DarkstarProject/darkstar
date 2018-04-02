---------------------------------------------
-- Demonic Flower
-- Deals magic damage to a single target.
-- Effect varies with HP and inflicts caster with weakness.
-- Deals souleater like damage to the user.
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.WEAKNESS;
    local dmg1 = mob:getHP()*0.24;
    local dmg2 = dmg1*0.5;
    -- The dmg amounts and duration are guesstimated based on wiki info.
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 90));

    mob:delHP(dmg1);
    target:delHP(dmg2);

    return dmg2;
end;
