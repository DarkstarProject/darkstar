-----------------------------------
-- Area: Port Bastok
--  NPC: Ilita
-- Linkshell merchant
-- @pos -142 -1 -25 236
-----------------------------------

require("scripts/globals/shop");
local text = require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)

    player:showText(npc, text.PAUNELIE_SHOP_DIALOG,513);

    local stock = 
{
    0x0200,8000, -- Linkshell
    0x3f9d,375   -- Pendant Compass
}
    showShop(player, STATIC, stock);
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
