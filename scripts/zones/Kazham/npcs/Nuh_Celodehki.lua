-----------------------------------
-- Area: Kazham
--  NPC: Nuh Celodehki
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
local text = require("scripts/zones/Kazham/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    player:showText(npc, text.NUHCELODENKI_SHOP_DIALOG);

    local stock =
    {
    0x112E,993,  --Fish Mithkabob
         0x11B8,3133, --Blackened Frog
         0x113A,316,  --Roast Mushroom
         0x1169,2700} --Eel Kabob
 
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
