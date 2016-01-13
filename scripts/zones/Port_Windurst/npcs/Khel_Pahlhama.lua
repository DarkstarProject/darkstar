-----------------------------------
-- Area: Port Bastok
--  NPC: Khel Pahlhama
-- Linkshell merchant
-- @pos 21 -2 -20 240
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/shop");
local text = require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc, text.KHEL_PAHLHAMA_SHOP_DIALOG,513);

    local stock =
    {
    
        0x0200,  8000,       --Linkshell
        0x3f9d,   375        --Pendant Compass
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
