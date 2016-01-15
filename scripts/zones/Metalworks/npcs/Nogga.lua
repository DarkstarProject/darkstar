-----------------------------------
-- Area: Metalworks
--  NPC: Nogga
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
local text = require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    player:showText(npc, text.NOGGA_SHOP_DIALOG);

    local stock =
    {
    0x43A4,675,2,        -- Bomb Arm

     0x43A1,1083,3,        -- Grenade
     0x0ae8,92,3}        -- Catalytic Oil
 
showNationShop(player, BASTOK, stock);
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
