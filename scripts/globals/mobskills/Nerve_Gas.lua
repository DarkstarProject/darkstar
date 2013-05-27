---------------------------------------------
--  Nerve Gas
--
--  Description: Inflicts curse and powerful poison effect.
--  Type: Magical
--  Wipes Shadows
--  Range: 10' Radial
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
   -- TODO: Used only when third/right head is alive (animationsub 0)
   return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

   MobStatusEffectMove(mob, target, EFFECT_CURSE_I, 25, 0, 420);
   MobStatusEffectMove(mob, target, EFFECT_POISON, 20, 3, 60);

end;
