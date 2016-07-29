-----------------------------------
-- Area: Southern San d'Oria
-- NPC: Ferdoulemiont
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
    
    player:showText(npc,FERDOULEMIONT_SHOP_DIALOG);

    stock = {0x034d,1125,1,  --Black Chocobo Feather

             0x439b,9,2,     --Dart 
            
             0x45c6,680,3,   --Bug Broth
             0x45ca,680,3,   --Carrion Broth
             0x45c4,81,3,    --Carrot Broth 
             0x45c8,124,3,   --Herbal Broth
             0x0348,7,3,     --Chocobo Feather
             0x11c1,61,3,    --Gysahl Greens
             0x4278,10,3,    --Pet Food Alpha Biscuit
             0x4279,81,3,    --Pet Food Beta Biscuit
             0x13d1,49680,3, --Scroll of Chocobo Mazurka
             0x1385,16,3,    --Scroll of Knight's Minne
             0x1386,864,3,   --Scroll of Knight's Minne II
             0x1387,5148,3,  --Scroll of Knight's Minne III
             0x0927,1984,3}  --La Theine Millet
     
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




