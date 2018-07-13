-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Dabih Jajalioh
-- Standard Merchant NPC
-- Additional script for pereodical
-- goods needed.
-- Partitially implemented.
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/zones/RuLude_Gardens/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,DABIHJAJALIOH_SHOP_DIALOG);

    local stock =
    {
        948,60,    --Carnation
     636,119,    --Chamomile
     958,120,    --Marguerite
     949,96,    --Rain Lily
     941,80,    --Red Rose
     951,110}    --Wijnruit

--     Place for difficult script

    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

