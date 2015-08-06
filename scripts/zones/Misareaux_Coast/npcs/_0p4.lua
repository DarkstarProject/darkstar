-----------------------------------
--  Area: Misareaux Coast
--  NPC: Storage Compartment 
--  COP spawn Boggelmann.
-----------------------------------
package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Misareaux_Coast/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == CALM_BEFORE_THE_STORM and GetMobAction(16879897) == 0 and player:getVar("COP_Boggelmann_KILL") == 0) then
	  SpawnMob(16879897,180):updateClaim(player);
	elseif (player:getCurrentMission(COP) == CALM_BEFORE_THE_STORM and player:getVar("COP_Boggelmann_KILL") == 1) then
	  player:startEvent(0x000D);
	else
	   player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
	end	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
   if (csid == 0x000D) then
      player:setVar("COP_Boggelmann_KILL",2);
	  player:addKeyItem(VESSEL_OF_LIGHT);
	  player:messageSpecial(KEYITEM_OBTAINED,VESSEL_OF_LIGHT);
   end
end;