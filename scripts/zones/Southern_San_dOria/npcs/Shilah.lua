-----------------------------------
-- Area: Southern San dOria
-- NPC: Shilah
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        count = trade:getItemCount();
        MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    player:showText(npc,SHILAH_SHOP_DIALOG);

    stock = {0x1152,4500,1,    --Mushroom Risotto
             0x1143,6300,1,    --Mushroom Soup
             0x118e,2494,1,    --Sah d'Orian Tea

             0x1104,180,2,    --White Bread
             0x11b5,1080,2,    --Delicious Puls
             0x11d0,1355,2,    --Vegetable Soup
             0x11dc,1633,2,    --Beaugreen Sautee
             0x1159,837,2,    --Grape Juice

             0x110c,108,3,    --Black Bread
             0x118c,540,3,    --Puls
             0x1167,180,3,    --Pebble Soup
             0x119d,10,3,    --Distilled Water
             0x15a5,1260,3}    --Royal Grape

    showNationShop(player, SANDORIA, stock);

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




