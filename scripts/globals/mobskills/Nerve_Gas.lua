---------------------------------------------
--  Nerve Gas
--
--  Description: Inflicts curse and powerful poison effect.
--  Type: Magical
--  Wipes Shadows
--  Range: 10' Radial
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
   if (mob:AnimationSub() == 0) then
      return 0;
   else
      return 1;
   end
end;

function onMobWeaponSkill(target, mob, skill)

   MobStatusEffectMove(mob, target, EFFECT_CURSE_I, 25, 0, 420);
   MobStatusEffectMove(mob, target, EFFECT_POISON, 20, 3, 60);

end;
