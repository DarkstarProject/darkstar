-----------------------------------
-- Area: Throne Room
-- NPC:  Zeidpart2
-- Mission 9-2 BASTOK BCNM Fight
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/monstertpmoves");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

end;

-----------------------------------
-- onMobRoam
-----------------------------------
function onMobRoam(mob)
mob:setLocalVar("2hourtime",math.random(20,50));
end;

-----------------------------------
-- onMobFight
-----------------------------------
function onMobFight(mob, target)

local zeid = mob:getID();
local shadow1 = zeid+1;
local shadow2 = zeid+2;

	if (mob:getHPP() <= mob:getLocalVar("2hourtime")) then
		if (mob:getLocalVar("2hour") == 0) then
			mob:useMobAbility(439);
			mob:setLocalVar("2hour",1);
		end
	elseif (mob:getHPP() <= 77) then
		if (mob:getTP() >= 100) then
			if ((GetMobAction(shadow1) and GetMobAction(shadow2)) == 0) then
				mob:useMobAbility(728);
			end
		end
	end
end;

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob,killer)
mob:setLocalVar("2hour",0);
mob:setLocalVar("2hourtime",0);
DespawnMob(mob:getID()+1);
DespawnMob(mob:getID()+2);
end;
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
end;
