-----------------------------------
-- Area: Windurst Waters
--  NPC: Prestapiq
-- Only sells when Windurst controls Movalpolos
-- Confirmed shop stock, August 2013
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Waters/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(dsp.region.MOVALPOLOS);
    if (RegionOwner ~= dsp.nation.WINDURST) then
        player:showText(npc,PRESTAPIQ_CLOSED_DIALOG);
    else
        player:showText(npc,PRESTAPIQ_OPEN_DIALOG);

        local stock =
        {
            0x0280,    11,   --Copper Ore
            0x1162,   694,   --Coral Fungus
            0x1117,  4032,   --Danceshroom
            0x0672,  6500,   --Kopparnickel Ore
            0x142D,   736    --Movalpolos Water
        }
        dsp.shop.general(player, stock, WINDURST);

    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
