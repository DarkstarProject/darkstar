-----------------------------------
-- Area: Windurst Waters
-- NPC:  Upih Khachla
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/events/harvest_festivals")
require("scripts/globals/shop");
require("scripts/globals/conquest");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    onHalloweenTrade(player,trade,npc);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,UPIHKHACHLA_SHOP_DIALOG);

    stock = {
        0x43A1,  1107,1,     --Grenade
        0x1010,   837,1,     --Potion
        0x03B7,   108,1,     --Wijnruit

        0x027C,   119,2,     --Chamomile
        0x1037,   736,2,     --Echo Drops
        0x1020,  4445,2,     --Ether

        0x1034,   290,3,     --Antidote
        0x0764,  3960,3,     --Desalinator
        0x026E,    44,3,     --Dried Marjoram
        0x1036,  2387,3,     --Eye Drops
        0x025D,   180,3,     --Pickaxe
        0x0765,  3960,3,     --Salinator
        0x03FC,   276,3,     --Sickle
        0x04D9,   354,3      --Twinkle Powder
    }               

    rank = getNationRank(WINDURST);
    if (rank ~= 1) then
        table.insert(stock,0x03fe); --Thief's Tools
        table.insert(stock,3643);
        table.insert(stock,3);
    end
    if (rank == 3) then
        table.insert(stock,0x03ff); --Living Key
        table.insert(stock,5520);
        table.insert(stock,3);
    end
    showNationShop(player, WINDURST, stock);

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;
