-----------------------------------
-- Area: Bastok Mines
-- NPC:  Boytz
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,BOYTZ_SHOP_DIALOG);

    stock = {
        0x1020,  4445,1,     --Ether

        0x1037,   736,2,     --Echo Drops
        0x1010,   837,2,     --Potion
        0x43A6,     3,2,     --Wooden Arrow

        0x00D9,   900,3,     --Brass Flowerpot
        0x025D,   180,3,     --Pickaxe
        0x1036,  2387,3,     --Eye Drops
        0x1034,   290,3,     --Antidote
        0x43A8,     7,3,     --Iron Arrow
        0x43B8,     5,3      --Crossbow Bolt
    }

    rank = getNationRank(BASTOK);
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

    showNationShop(player, BASTOK, stock);

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
