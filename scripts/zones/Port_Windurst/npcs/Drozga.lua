-----------------------------------
-- Area: Port Windurst
--  NPC: Drozga
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/zones/Port_Windurst/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,DROZGA_SHOP_DIALOG);

    stock = {
        12432,   1493,       -- Faceguard
        12560,   2296,       -- Scale Mail
        12688,   1225,       -- Scale Fng. Gnt.
        12816,   1843,       -- Scale Cuisses
        12944,   1117,       -- Scale Greaves
        13192,    437,       -- Leather Belt
        13327,   1287,       -- Silver Earring
        13469,   1287,       -- Leather Ring
    }
    showShop(player, WINDURST, stock);

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
