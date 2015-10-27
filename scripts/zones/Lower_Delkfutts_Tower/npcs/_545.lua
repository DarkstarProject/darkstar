-----------------------------------
-- Area:  Lower Delkfutt's Tower
-- NPC:   Cermet Door
-- Notes: Involved in Missions: THREE_PATHS
-----------------------------------
package.loaded["scripts/zones/Lower_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Lower_Delkfutts_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == THREE_PATHS  and  player:getVar("COP_Tenzen_s_Path") == 6 and player:hasKeyItem(DELKFUTT_RECOGNITION_DEVICE)) then
	    SpawnMob(17531121,180):updateClaim(player);
	elseif (player:getCurrentMission(COP) == THREE_PATHS  and  player:getVar("COP_Tenzen_s_Path") == 7 and player:hasKeyItem(DELKFUTT_RECOGNITION_DEVICE)) then
	    player:startEvent(0x0019);
	end

	return 1;
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
--print("CSID:",csid);
--print("RESULT:",option);
     if (csid == 0x0019) then
	     player:setVar("COP_Tenzen_s_Path",8);
	 end
end;