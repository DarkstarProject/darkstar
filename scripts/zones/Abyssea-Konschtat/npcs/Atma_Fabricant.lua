-----------------------------------
-- Zone: Abyssea - Konschtat
--  NPC: Atma Fabricant
--
-----------------------------------
package.loaded["scripts/zones/Abyssea-Konschtat/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/abyssea");
require("scripts/zones/Abyssea-Konschtat/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(2182);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;