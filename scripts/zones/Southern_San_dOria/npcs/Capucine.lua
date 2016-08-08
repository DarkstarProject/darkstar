-----------------------------------
-- Area: Southern San d'Oria
-- NPC: Capucine
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/shop");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,CAPUCINE_SHOP_DIALOG);

    local stock =
    {
        0x30B9, 1904,    -- Poet's Circlet
        0x3140, 1288,    -- Tunic
        0x3139, 2838,    -- Linen Robe
        0x31C0, 602,     -- Mitts
        0x31B9, 1605,    -- Linen Cuffs
        0x3240, 860,     -- Slacks
        0x3239, 2318,    -- Linen Slops
        0x32C0, 556,     -- Solea
        0x32B9, 1495,    -- Holly Clogs
    };

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
