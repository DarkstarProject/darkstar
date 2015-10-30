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
require("scripts/zones/Throne_Room/TextIDs");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
if (mob:getFamily() == 482) then
	target:showText(mob,YOUR_ANSWER);
    return 0;
else
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
if (mob:getFamily() == 482) then
	target:showText(mob,RETURN_TO_THE_DARKNESS);
else
	mob:messageBasic(43, 0, 686+256);
end
   local tp = skill:getTP();
   local hp = mob:getHP();
   local dmg = 0;

   -- Should produce 1000 - 3750 @ full HP using the player formula, assuming 8k HP for AA EV.
      -- dmg * 2.5, as wiki claims ~2500 at 100% HP, until a better formula comes along.
   if tp <= 200 then -- 100 - 200
      dmg = math.floor(hp * (math.floor(0.16 * tp) + 16) / 256);
   else -- 201 - 300
      dmg = math.floor(hp * (math.floor(0.72 * tp) - 96) / 256);
   end

   dmg = dmg * 2.5;

    -- Believe it or not, it's been proven to be breath damage.
    dmg = target:breathDmgTaken(dmg);

    --handling phalanx
    dmg = dmg - target:getMod(MOD_PHALANX);

    if (dmg < 0) then
        return 0;
    end

	dmg = utils.stoneskin(target, dmg);

    if (dmg > 0) then
        target:wakeUp();
        target:updateEnmityFromDamage(mob,dmg);
    end

   target:delHP(dmg);
	return dmg;
	end
end;
