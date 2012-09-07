-----------------------------------
-- Area: Dynamis San d'Oria
-- NPC:  Overlord's Tombstone
-----------------------------------
package.loaded["scripts/zones/Dynamis-San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-San_dOria/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	
	SpawnMob(17535350):updateEnmity(target); -- 110
	SpawnMob(17535351):updateEnmity(target); -- 111
	SpawnMob(17535352):updateEnmity(target); -- 112
	SpawnMob(17535354):updateEnmity(target); -- 114
	SpawnMob(17534978):updateEnmity(target); -- Battlechoir Gitchfotch
	SpawnMob(17534979):updateEnmity(target); -- Soulsender Fugbrag
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	if(killer:hasKeyItem(HYDRA_CORPS_COMMAND_SCEPTER) == false)then
		killer:addKeyItem(HYDRA_CORPS_COMMAND_SCEPTER);
		killer:messageSpecial(KEYITEM_OBTAINED,HYDRA_CORPS_COMMAND_SCEPTER);
	end
	
	--killer:launchDynamisSecondPart();
	
end;