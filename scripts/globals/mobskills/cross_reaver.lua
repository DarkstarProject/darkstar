---------------------------------------------
--  Cross Reaver
--
--  Description: Deals high damage to players in a fan-shaped area. Additional effect: Stun
--  Type: Physical
--  ? ? ? (No data offered)
--  Range: Melee

-- Special weaponskill unique to Ark Angel HM. Deals ~500-900 damage. 
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

   -- TODO: Can skillchain?  Unknown property.

    local numhits = 2;
    local accmod = 1;
    local dmgmod = 4;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_2_SHADOW);

   MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_STUN, 1, 0, 4);

   target:delHP(dmg);
    return dmg;
end;
