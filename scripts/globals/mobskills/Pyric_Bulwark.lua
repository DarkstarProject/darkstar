---------------------------------------------
--  Pyric Bulwark
--
--  Description: Grants a Physical Shield effect for a time.
--  Type: Enhancing
--  
--  Range: Self
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)

  if(mob:getFamily() == 316) then
    local mobSkin = mob:getModelId();

    if (mobSkin == 1796) then
        return 0;
    else
        return 1;
    end
  end
   -- TODO: Used only when second/left head is alive (animationsub 0 or 1)
   if (mob:AnimationSub() <= 1) then
      return 0;
   else
      return 1;
   end
end;

function onMobWeaponSkill(target, mob, skill)

    -- addEx to pervent dispel
    mob:addStatusEffectEx(EFFECT_PHYSICAL_SHIELD,0,1,0,45)
    skill:setMsg(MSG_BUFF)
    if (mob:getFamily() == 313) then -- Tinnin follows this up immediately with Nerve Gas
        mob:useMobAbility(1580);
    end
   
    return EFFECT_PHYSICAL_SHIELD;
end;