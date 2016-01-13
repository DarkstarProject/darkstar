-----------------------------------
-- Area: Bastok Mines
--  NPC: Odoba
-- Guild Merchant NPC: Alchemy Guild 
-- @pos 108.473 5.017 1.089 234
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
local text = require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:sendGuild(526,8,23,6)) then
        player:showText(npc, text.ODOBA_SHOP_DIALOG);
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

