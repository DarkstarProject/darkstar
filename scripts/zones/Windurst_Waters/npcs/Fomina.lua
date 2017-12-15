-----------------------------------
-- Area: Windurst Waters
--  NPC: Fomina
-- Only sells when Windurst controlls Elshimo Lowlands
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
    local RegionOwner = GetRegionOwner(ELSHIMOLOWLANDS);
    if (RegionOwner ~= NATION_WINDURST) then
        player:showText(npc,FOMINA_CLOSED_DIALOG);
    else
        player:showText(npc,FOMINA_OPEN_DIALOG);

        local stock =
        {
            612,     55,  -- Kazham Peppers
            4432,    55,  -- Kazham Pineapple
            4390,    36,  -- Mithran Tomato
            626,    234,  -- Black Pepper
            630,     88,  -- Ogre Pumpkin
            632,    110,  -- Kukuru Bean
            1411,  1656   -- Phalaenopsis
        }
        showShop(player,WINDURST,stock);

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
