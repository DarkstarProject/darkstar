---------------------------------------------------
-- Dissipation.lua
-- Dispels a single buff add terror effect
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
 local mobID = mob:getID();   --(16908295 ,16908302 ,16908309 =omega ,          16928966=proto-ultima   )
 local mobhp = mob:getHPP();
   if (mobID == 16928966)then
      if(mobhp > 40)then
	     return 0;
	  end  
   end
   return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_TERROR;
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 10);
	
    local dispel =  target:dispelStatusEffect();

    if(dispel == EFFECT_NONE) then
        -- no effect
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    else
        skill:setMsg(MSG_DISAPPEAR);
    end

    return dispel;
end