-----------------------------------
-- Area: Lower Jeuno
--  NPC: Morefie
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
local text = require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    player:showText(npc, text.MOREFIE_SHOP_DIALOG);

    local stock =
    {
    0x340F,1250, -- Silver Earring
     0x3490,1250, -- Silver Ring
     0x3410,4140} -- Mythril Earring 
 
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
