-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Aveline
-- Standard Merchant NPC
-- @zone 230
-- !pos -139 -6 46
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

    player:showText(npc,AVELINE_SHOP_DIALOG);

    local stock = {625,79,1,    --Apple Vinegar
             623,117,1,    --Bay Leaves
             4382,28,1,    --Frost Turnip
             4392,28,1,    --Saruta Orange

             4363,39,2,    --Faerie Apple
             4366,21,2,    --La Theine Cabbage

             633,14,3,    --Olive Oil
             638,166,3,    --Sage
             4389,28,3,    --San d'Orian Carrot
             4431,68,3}    --San d'Orian Grape

    dsp.shop.nation(player, stock, dsp.nation.SANDORIA);

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
