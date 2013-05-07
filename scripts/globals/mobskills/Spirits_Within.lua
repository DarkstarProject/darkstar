---------------------------------------------
--  Spirits Within
--
--  Description: Delivers an unavoidable attack. Damage varies with HP and TP. 
--  Type: Magical/Breath
--  Ignores shadows and most damage reduction.
--  Range: Melee
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/utils");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

   local tp = skill:getTP();
   local hp = mob:getHP();
   local dmg = 0;

   -- Should produce 1000 - 3750 @ full HP using the player formula, assuming 8k HP for AA EV.
      -- This is probably lower than retail.  I'm sure players will be upset.
   if tp <= 200 then -- 100 - 200
      dmg = math.floor(hp * (math.floor(0.16 * tp) + 16) / 256);
   else -- 201 - 300
      dmg = math.floor(hp * (math.floor(0.72 * tp) - 96) / 256);
   end

   -- Believe it or not, it's been proven to be breath damage.
   dmg = utils.breathDmgTaken(target, dmg);

   target:delHP(dmg);
	return dmg;
end;
