-----------------------------------
-- Area: Abyssea - Grauberg
--  NPC: Cruor Prospector
-- Type: Cruor NPC
-- !pos ? ? ? 254 (missing from DSP database)
-----------------------------------
package.loaded["scripts/zones/Abyssea-Grauberg/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Abyssea-Grauberg/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/abyssea");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local Cruor = player:getCurrency("cruor");
    local Demilune = getDemiluneAbyssite(player);
    player:startEvent(2002, Cruor, Demilune);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;