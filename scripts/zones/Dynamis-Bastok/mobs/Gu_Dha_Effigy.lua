-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Gu'Dha Effigy
-- Mega Boss
-----------------------------------
package.loaded["scripts/zones/Dynamis-Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
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
	
	if(alreadyReceived(killer,8) == false) then
		killer:addTimeToDynamis(30); -- Add + 30min
		addDynamisList(killer,128);
	end
	
	if(killer:hasKeyItem(HYDRA_CORPS_EYEGLASS) = false)then
		killer:addKeyItem(HYDRA_CORPS_EYEGLASS);
		killer:messageSpecial(KEYITEM_OBTAINED,HYDRA_CORPS_EYEGLASS);
	end
	
end;