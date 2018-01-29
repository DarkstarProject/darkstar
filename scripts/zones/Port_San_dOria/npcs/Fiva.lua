-----------------------------------
-- Area: Port San d'Oria
--  NPC: Fiva
-- only sells when San d'Oria controls Kolshushu
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_San_dOria/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/quests");
require("scripts/globals/shop");
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

    local RegionOwner = GetRegionOwner(KOLSHUSHU);

    if (RegionOwner ~= NATION_SANDORIA) then
        player:showText(npc,FIVA_CLOSED_DIALOG);
    else
        player:showText(npc,FIVA_OPEN_DIALOG);

        local stock =
        {
            4503,  184, -- Buburimu Grape
            1120, 1620, -- Casablanca
            4359,  220, -- Dhalmel Meat
            614,    72, -- Mhaura Garlic
            4445,   40  -- Yagudo Cherry
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
