-----------------------------------
-- Area: Abyssea - Grauberg
--  NPC: Cruor Prospector
-- Type: Cruor NPC
-- @pos ? ? ? 254 (missing from DSP database)
-----------------------------------
package.loaded["scripts/zones/Abyssea-Grauberg/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Abyssea-Grauberg/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/abyssea");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local Cruor = player:getCurrency("cruor");
    local Demilune = getDemiluneAbyssite(player);
    player:startEvent(2002, Cruor, Demilune);
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
end;