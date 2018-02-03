-----------------------------------
-- Area: Port Bastok
--  NPC: Zoby Quhyo
-- Only sells when Bastok controlls Elshimo Lowlands
-- Confirmed shop stock, August 2013
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Bastok/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(ELSHIMOLOWLANDS);
    if (RegionOwner ~= NATION_BASTOK) then
        player:showText(npc,ZOBYQUHYO_CLOSED_DIALOG);
    else
        player:showText(npc,ZOBYQUHYO_OPEN_DIALOG);

        local stock =
        {
            626,    234,  -- Black Pepper
            612,     55,  -- Kazham Peppers
            4432,    55,  -- Kazham Pineapple
            632,    110,  -- Kukuru Bean
            4390,    36,  -- Mithran Tomato
            630,     88,  -- Ogre Pumpkin
            1411,  1656   -- Phalaenopsis
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
