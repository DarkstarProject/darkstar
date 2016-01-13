-----------------------------------
-- Area: Pashhow Marshlands
--  NPC: Luck Rune
-- Involved in Quest: Mhaura Fortune
-- @pos 573.245 24.999 199.560 109
-------------------------------------

local text = require("scripts/zones/Pashhow_Marshlands/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(text.NOTHING_OUT_OF_THE_ORDINARY);
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