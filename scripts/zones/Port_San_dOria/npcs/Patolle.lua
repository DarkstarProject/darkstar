-----------------------------------
-- Area: Port San d'Oria
--  NPC: Patolle
-- Only sells when San d'Oria controlls Kuzotz Region
-- Working 100%
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

    local RegionOwner = GetRegionOwner(KUZOTZ);

    if (RegionOwner ~= NATION_SANDORIA) then
        player:showText(npc,PATOLLE_CLOSED_DIALOG);
    else
        player:showText(npc,PATOLLE_OPEN_DIALOG);

        local stock =
        {
            916,  855, -- Cactuar Needle
            4412, 299, -- Thundermelon
            4491, 184  -- Watermelon
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
