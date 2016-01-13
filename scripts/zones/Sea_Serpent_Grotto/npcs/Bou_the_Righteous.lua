-----------------------------------
-- Area: Sea Serpent Grotto
--  NPC: Bou the Righteous
-- Type: Involved in the "Sahagin Key Quest"
-- @zone: 176
-- @pos -125.029 46.568 -334.778
-- 
-----------------------------------

require("scripts/globals/settings");
local text = require("scripts/zones/Sea_Serpent_Grotto/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x006c);
    player:setVar("SahaginKeyProgress",2);
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

