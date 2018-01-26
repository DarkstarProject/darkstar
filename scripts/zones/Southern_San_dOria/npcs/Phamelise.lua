-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Phamelise
-- Only sells when San d'Oria controlls Zulkheim Region
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/events/harvest_festivals");
require("scripts/globals/conquest");
require("scripts/globals/settings");
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

    local RegionOwner = GetRegionOwner(ZULKHEIM);

    if (RegionOwner ~= NATION_SANDORIA) then
        player:showText(npc,PHAMELISE_CLOSED_DIALOG);
    else
        player:showText(npc,PHAMELISE_OPEN_DIALOG);

        local stock =
        {
            4372,    44, -- Giant Sheep Meat
            622,     44, -- Dried Marjoram
            610,     55, -- San d'Orian Flour
            611,     36, -- Rye Flour
            1840,  1840, -- Semolina
            4366,    22, -- La Theine Cabbage
            4378,    55  -- Selbina Milk
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
