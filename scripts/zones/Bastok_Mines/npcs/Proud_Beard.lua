-----------------------------------
-- Area: Bastok Mines
-- NPC: Proud Beard
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");
require("scripts/globals/events/harvest_festivals");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    onHalloweenTrade(player,trade,npc)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,PROUDBEARD_SHOP_DIALOG);

    stock = {
        0x3157,   276,       --Hume Tunic
        0x3158,   276,       --Hume Vest
        0x31D2,   165,       --Hume M Gloves
        0x31D8,   165,       --Hume F Gloves
        0x3253,   239,       --Hume Slacks
        0x3254,   239,       --Hume Pants
        0x32CD,   165,       --Hume M Boots
        0x32D2,   165,       --Hume F Boots
        0x315D,   276,       --Galkan Surcoat
        0x31D6,   165,       --Galkan Bracers
        0x3258,   239,       --Galkan Braguette
        0x32D1,   165        --Galkan Sandals
    }
    showShop(player, STATIC, stock);

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
