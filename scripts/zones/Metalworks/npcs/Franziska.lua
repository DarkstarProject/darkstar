-----------------------------------
-- Area: Metalworks
--  NPC: Franziska
-- Type: Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
if (player:getVar("OptionalcsCornelia") ==1) then
player:startEvent(777);
else
player:startEvent(620);
end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
if (csid == 777) then
player:setVar("OptionalcsCornelia",0);
end
end;

