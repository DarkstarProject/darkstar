-----------------------------------
--  Area: Kazham
--   NPC: Romaa Mihgo
--  Type: Standard NPC
-- @zone: 250
--  @pos 29.000 -13.023 -176.500
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") == 2) then
        player:startEvent(0x010A);
    elseif (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") == 3) then
        player:startEvent(0x010B);
    else
        player:startEvent(0x0107);
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
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    
    if (csid == 0x010A) then
        player:setVar("MissionStatus",3);
    end
    
end;

