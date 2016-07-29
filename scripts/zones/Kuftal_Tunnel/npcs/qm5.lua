-----------------------------------
-- Area: Kuftal Tunnel
-- NPC:  ???
-- Involved in Mission: Bastok 8-2
-----------------------------------
package.loaded["scripts/zones/Kuftal_Tunnel/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Kuftal_Tunnel/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local missionStatus = player:getVar("MissionStatus");

    if (player:getCurrentMission(BASTOK) == ENTER_THE_TALEKEEPER and missionStatus == 1) then
        player:startEvent(0x00c);
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
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);

    if (option == 0) then
        if (csid == 0x00c) then
            player:setVar("MissionStatus",2);
            player:messageSpecial(FELL);
        end    
    end
end;