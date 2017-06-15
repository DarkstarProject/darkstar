---------------------------------------------
-- Circle Blade
--
-- Description: Delivers an area of effect attack. Attack radius varies with TP.
-- Type: Physical
-- Utsusemi/Blink absorb: ???
-- Range: Melee range radial
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    mob:messageBasic(43, 0, 38);
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_1_SHADOW);

    skill:setSkillchain(38);

    -- About 200-300
    target:delHP(dmg);
    return dmg;
end;
