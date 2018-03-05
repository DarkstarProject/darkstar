-----------------------------------
-- Area: Port Windurst
--  NPC: Alizabe
-- Only sells when Windurst controls the Tavnazian Archipelago
-- Only available to those with CoP Ch. 4.1 or higher
-- Confirmed shop stock, August 2013
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Windurst/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(TAVNAZIANARCH);
    local cop = 40; --player:getVar("chainsOfPromathiaMissions");

    if (cop >= 40) then
        if (RegionOwner ~= NATION_WINDURST) then
            player:showText(npc,ALIZABE_CLOSED_DIALOG);
        else
            player:showText(npc,ALIZABE_OPEN_DIALOG);

            local stock =
            {
                1523,   290,  -- Apple Mint
                5164,  1945,  -- Ground Wasabi
                17005,   99,  -- Lufaise Fly
                5195,   233   -- Misareaux Parsley
            }
            showShop(player,WINDURST,stock);
        end
    else
        player:showText(npc,ALIZABE_COP_NOT_COMPLETED);
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
