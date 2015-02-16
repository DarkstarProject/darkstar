-----------------------------------
-- Area: Abyssea-Vunkeral
-- NPC:  ??? (Spawn Sedna)
-----------------------------------
package.loaded["scripts/zones/Abyssea-Vunkerl/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Abyssea-Vunkerl/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	
		
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local KI1 = GLOSSY_SEA_MONK_SUCKER;
	local KI2 = SHIMMERING_PUGIL_SCALE;
	local MOB = 17666508;
	if player:hasKeyItem(KI1) and player:hasKeyItem(KI2) then
		if (GetMobByID(MOB):getStatus() == STATUS_DISAPPEAR) then
			player:startEvent(1115,KI1,KI2);
		else
			player:startEvent(1101,KI1,KI2);
		end
		
	elseif (player:hasKeyItem(KI1) == false) and (player:hasKeyItem(KI2) == false) then
		player:startEvent(1101,KI1,KI2);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
		local KI1 = GLOSSY_SEA_MONK_SUCKER;
		local KI2 = SHIMMERING_PUGIL_SCALE;
		local MOB = 17666508;
		
		if (option == 1) then
			SpawnMob(MOB,180):updateEnmity(player);
			player:delKeyItem(KI1);
			player:delKeyItem(KI2);
		end

printf("CSID: %u",csid);
printf("RESULT: %u",option);
end;