---------------------------------------------
--  Spinning Scythe
--
--  Description: Delivers an area of effect attack. Attack radius varies with TP.
--  Type: Physical
--  ? ? ?
--  Range: Melee range radial
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/msg");

function onMobSkillCheck(target,mob,skill)
    mob:messageBasic(msgBasic.READIES_WS, 0, 688+256);
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_1_SHADOW);

    -- 150-200 damage
    target:delHP(dmg);
    return dmg;
end;
