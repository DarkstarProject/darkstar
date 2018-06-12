-----------------------------------
-- Area: Rolanberry Fields
--  NPC: Legion Tome
-- Legion NPC
-- !pos 238 24 469 110
-----------------------------------
package.loaded["scripts/zones/Rolanberry_Fields/TextIDs"] = nil;
-----------------------------------


require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/zones/Rolanberry_Fields/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- player:startEvent(8009);
end;

function onEventUpdate(player,csid,option,target)
end;

function onEventFinish(player,csid,option,target)
    -- print("CSID:",csid);
    -- print("RESULT:",option);
end;