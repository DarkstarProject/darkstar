-----------------------------------
-- Area: Bastok Mines
--  NPC: Tibelda
-- Only sells when Bastok controlls Valdeaunia Region
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Mines/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(VALDEAUNIA);
    if (RegionOwner ~= NATION_BASTOK) then
        player:showText(npc,TIBELDA_CLOSED_DIALOG);
    else
        player:showText(npc,TIBELDA_OPEN_DIALOG);
        local stock =
        {
            0x111e,    29,   --Frost Turnip
            0x027e,   170    --Sage
        }
        showShop(player,BASTOK,stock);

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
