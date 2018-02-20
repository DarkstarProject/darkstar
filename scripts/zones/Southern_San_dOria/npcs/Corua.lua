-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Corua
-- Only sells when San d'Oria controlls Ronfaure Region
-- !pos -66 2 -11 230
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/events/harvest_festivals");
require("scripts/globals/settings");
require("scripts/globals/conquest");
require("scripts/globals/quests");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == 1) then
        if (trade:hasItemQty(532,1) == true and trade:getItemCount() == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    else
        onHalloweenTrade(player,trade,npc);
    end
end;

function onTrigger(player,npc)

    local RegionOwner = GetRegionOwner(RONFAURE);
    -- player:startEvent(849) - are you the chicks owner
    if (RegionOwner ~= NATION_SANDORIA) then
        player:showText(npc,CORUA_CLOSED_DIALOG);
    else
        player:showText(npc,CORUA_OPEN_DIALOG);

        local stock =
        {
        4389,  29,  -- San d'Orian Carrot
        4431,  69,  -- San d'Orian Grape
        639,  110, -- Chestnut
        610,   55  -- San d'Orian Flour
        }
        showShop(player,SANDORIA,stock);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
