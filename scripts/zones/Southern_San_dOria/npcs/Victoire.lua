-----------------------------------
-- Area: Southern San d'Oria
-- NPC: Victoire
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
    player:showText(npc,CARAUTIA_SHOP_DIALOG);

    local stock =
    {
        0x3090, 1450,    -- Faceguard
        0x30B0, 1936,    -- Headgear
        0x3110, 2230,    -- Scale Mail
        0x3130, 2745,    -- Doublet
        0x3190, 1190,    -- Scale Fng. Gnt.
        0x31B0, 1515,    -- Gloves
        0x3210, 1790,    -- Scale Cuisses
        0x3230, 2110,    -- Brais
        0x3290, 1085,    -- Scale Greaves
        0x32B0, 1410,    -- Gaiters
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
