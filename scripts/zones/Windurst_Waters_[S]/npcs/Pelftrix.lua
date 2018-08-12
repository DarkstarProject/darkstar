-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Pelftrix
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/zones/Windurst_Waters_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,PELFTRIX_SHOP_DIALOG);

    local stock =
    {
        4116,4500,        -- Hi-Potion
        4132,28000,        -- Hi-Ether
        1020,300,            -- Sickle
        1021,500}            -- Hatchet

    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

