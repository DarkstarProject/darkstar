-----------------------------------
-- Area: Metalworks
-- Door: _6lg (Cornelia's Room)
-- @pos 114 -20 -7 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:hasCompletedMission(BASTOK,ON_MY_WAY) and player:getVar("[B7-2]Cornelia") == 0) then
        player:startEvent(0x026e);
    else
        player:messageSpecial(ITS_LOCKED);
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    
    if (csid == 0x026e) then
        player:setVar("[B7-2]Cornelia", 1);
    end
    
end;