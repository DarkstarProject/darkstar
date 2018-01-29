-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Pourette
-- Only sells when San d'Oria controlls Derfland Region
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
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

    local RegionOwner = GetRegionOwner(DERFLAND);

    if (RegionOwner ~= NATION_SANDORIA) then
        player:showText(npc,POURETTE_CLOSED_DIALOG);
    else
        player:showText(npc,POURETTE_OPEN_DIALOG);

        local stock =
        {
            4352,   128, -- Derfland Pear
            617,    142, -- Ginger
            4545,    62, -- Gysahl Greens
            1412,  1656, -- Olive Flower
            633,     14, -- Olive Oil
            951,    110  -- Wijnruit
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
