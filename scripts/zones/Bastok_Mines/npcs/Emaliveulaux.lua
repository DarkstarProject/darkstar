-----------------------------------
-- Area: Bastok Mines
--  NPC: Emaliveulaux
-- Only sells when Bastok controls the Tavnazian Archipelago
-- Only available to those with CoP Ch. 4.1 or higher
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/events/harvest_festivals");
require("scripts/zones/Bastok_Mines/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
    onHalloweenTrade(player,trade,npc)
end;

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(TAVNAZIANARCH);
    local cop = 40; -- player:getVar("chainsOfPromathiaMissions");

    if (cop >= 40) then
        if (RegionOwner ~= NATION_BASTOK) then
            player:showText(npc,EMALIVEULAUX_CLOSED_DIALOG);
        else
            player:showText(npc,EMALIVEULAUX_OPEN_DIALOG);

            local stock =
            {
                1523,  290,  -- Apple Mint
                5164,  1945, -- Ground Wasabi
                17005, 99,   -- Lufaise Fly
                5195,  233   -- Misareaux Parsley
            }
            showShop(player,BASTOK,stock);
        end
    else
        player:showText(npc,EMALIVEULAUX_COP_NOT_COMPLETED);
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

