---------------------------------------------
--  Polar Bulwark
--
--  Description: Grants a Magic Shield effect for a time.
--  Type: Enhancing
--  
--  Range: Self
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

   -- addEx to pervent dispel
   mob:addStatusEffectEx(EFFECT_MAGIC_SHIELD,1,0,45,0)
   skill:setMsg(MSG_BUFF)
   return EFFECT_MAGIC_SHIELD;

end;
