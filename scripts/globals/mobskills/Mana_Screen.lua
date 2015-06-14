---------------------------------------------
--  Mana_Screen
--
--  Description: Magic Shield

---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
 local mobID = mob:getID();   --(16908295 ,16908302 ,16908309 =omega ,          16928966=proto-ultima   )
 local mobhp = mob:getHPP();
   if (mobID == 16928966)then
      if(mobhp < 40)then
	     return 0;
      end  
   end
   return 1;
end;	

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_SHELL;
    local power = 128;
    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, 180));
	return typeEffect;
end;
