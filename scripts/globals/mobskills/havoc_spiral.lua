---------------------------------------------
--  Havoc Spiral
--
--  Description: Deals damage to players in an area of effect. Additional effect: Sleep
--  Type: Physical
--  2-3 Shadows
--  Range: Unknown

-- Special weaponskill unique to Ark Angel MR. Deals ~100-300 damage.
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

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 3;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_2_SHADOW);

   -- Witnessed 280 to a melee, 400 to a BRD, and 500 to a wyvern, so...
   target:delHP(dmg);
   MobStatusEffectMove(mob, target, EFFECT_SLEEP_I, 1, 0, math.random(30, 60));
   return dmg;
end;
