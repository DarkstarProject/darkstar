-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Millechuca
-- Regional Marchant NPC
-- Only sells when San d'Oria controls Vollbow.
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/settings");
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

    local RegionOwner = GetRegionOwner(VOLLBOW);

    if (RegionOwner ~= NATION_SANDORIA) then
        player:showText(npc,MILLECHUCA_CLOSED_DIALOG);
    else
        player:showText(npc,MILLECHUCA_OPEN_DIALOG);

        local stock =
        {
            636,   119, -- Chamomile
            864,    88, -- Fish Scales
            936,    14, -- Rock Salt
            1410, 1656  -- Sweet William
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

