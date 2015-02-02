-----------------------------------
-- Area: Throne Room
-- NPC:  Zeidpart2
-- Mission 9-2 BASTOK BCNM Fight
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/settings");
require("/scripts/globals/monstertpmoves");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)

end;

-----------------------------------
-- onMobEngaged
-----------------------------------

-----------------------------------
-- onMobFight
-----------------------------------
function onMobFight(mob, target)

local zeid = mob:getID();
local shadow1 = zeid+1;
local shadow2 = zeid+2;
		
	if(mob:getHPP() <= 77) then
		if (mob:getTP() >= 100)then
			if ((GetMobAction(shadow1) and GetMobAction(shadow2)) == 0)then
				mob:useMobAbility(728);
			end
		end
	end
end;

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob,killer)
DespawnMob(mob:getID()+1);
DespawnMob(mob:getID()+2);
end;
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("updateCSID: %u",csid);
--printf("RESULT: %u",GetMobAction(mob:getID()+1));
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
end;
