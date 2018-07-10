-----------------------------------
-- Area: Carautia
--  NPC: Southern San d'Oria
-- Standard Merchant NPC
-- @zone 230
-- !pos 70 0 39
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

function onTrigger(player,npc)

    player:showText(npc,CARAUTIA_SHOP_DIALOG);

    local stock = {12808,11340,1,    --Chain Hose
             12936,6966,1,        --Greaves
             12306,10281,1,     --Kite Shield

             12292,4482,2,     --Mahogany Shield
             12826,16552,2,     --Studded Trousers
             12954,10054,2,     --Studded Boots

             12290,544,3,      --Maple Shield
             12832,187,3,      --Bronze Subligar
             12833,1800,3,     --Brass Subligar
             12824,482,3,         --Leather Trousers
             12960,115,3,         --Bronze Leggings
             12961,1116,3,     --Brass Leggings
             12952,302,3}         --Leather Highboots

    dsp.shop.nation(player, stock, dsp.nation.SANDORIA);

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
