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

    local stock = {0x0271,79,1,    --Apple Vinegar
             0x026f,117,1,    --Bay Leaves
             0x111e,28,1,    --Frost Turnip
             0x1128,28,1,    --Saruta Orange

             0x110b,39,2,    --Faerie Apple
             0x110E,21,2,    --La Theine Cabbage

             0x0279,14,3,    --Olive Oil
             0x027e,166,3,    --Sage
             0x1125,28,3,    --San d'Orian Carrot
             0x114f,68,3}    --San d'Orian Grape

    showNationShop(player, NATION_SANDORIA, stock);

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
