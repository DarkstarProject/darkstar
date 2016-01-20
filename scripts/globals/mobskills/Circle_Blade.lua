---------------------------------------------
--  Circle Blade
--
--  Description: Delivers an area of effect attack. Attack radius varies with TP.
--  Type: Physical
--  ? ? ?
--  Range: Melee range radial
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    mob:messageBasic(43, 0, 682+256);
    skill:setSkillchain(38);

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_1_SHADOW);

    -- About 200-300
   target:delHP(dmg);
    return dmg;
end;
