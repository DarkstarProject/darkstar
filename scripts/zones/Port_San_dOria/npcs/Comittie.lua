-----------------------------------
-- Area: Port San d'Oria
--  NPC: Comittie
-- Type: Standard NPC
-- @zone: 232
-- @pos -6.570 -9.8 -147.952
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
local text = require("scripts/zones/Port_San_dOria/TextIDs");
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc, text.ITEM_DELIVERY_DIALOG);
    player:openSendBox();
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

