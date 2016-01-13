-----------------------------------
-- Area: Selbina
--  NPC: Mendoline
-- Guild Merchant NPC: Fishing Guild 
-- @pos -13.603 -7.287 10.916 248
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
local text = require("scripts/zones/Selbina/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:sendGuild(5182,3,18,5)) then
        player:showText(npc, text.FISHING_SHOP_DIALOG);
    end
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
