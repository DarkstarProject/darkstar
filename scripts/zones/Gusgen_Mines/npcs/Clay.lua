-----------------------------------
-- Area: Gusgen Mines
--  NPC: Clay
-- Involved in Quest: A Potter's Preference
-- @pos 117 -21 432 196
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/settings");
local text = require("scripts/zones/Gusgen_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:addItem(569,1); --569 - dish_of_gusgen_clay
    player:messageSpecial(text.ITEM_OBTAINED,569); -- dish_of_gusgen_clay
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;