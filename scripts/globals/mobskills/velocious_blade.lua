---------------------------------------------
--  Velocious Blade
--
--  Description: Deals a fivefold attack against the target.
--  Type: Physical
--  Range: Unknown
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if (mob:AnimationSub() == 1) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

    local numhits = 5;
    local accmod = 1;
    local dmgmod = 1;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_2_SHADOW);

    target:delHP(dmg);
    return dmg;
end;
