-----------------------------------
-- Area: Abyssea_Altepa
-- NPC:Hildith
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Abyssea-Altepa/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Abyssea-Altepa/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(342);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;