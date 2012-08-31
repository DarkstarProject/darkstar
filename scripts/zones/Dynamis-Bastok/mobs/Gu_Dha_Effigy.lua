-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Vanguard Beasttender + Vanguard's Scorpion
-----------------------------------
package.loaded["scripts/zones/Dynamis-Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Bastok/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	killer:addTimeToDynamis(30); -- Add + 30min
	
	if(killer:hasKeyItem(HYDRA_CORPS_EYEGLASS) = false)then
		killer:addKeyItem(HYDRA_CORPS_EYEGLASS);
		killer:messageSpecial(KEYITEM_OBTAINED,HYDRA_CORPS_EYEGLASS);
	end
	
end;