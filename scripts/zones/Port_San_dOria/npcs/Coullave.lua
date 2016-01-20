-----------------------------------
-- Area: Port San d'Oria
-- NPC: Coullave
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Port_San_dOria/TextIDs");

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
    
player:showText(npc,COULLAVE_SHOP_DIALOG);

stock = {0x1020,4445,1, --Ether
         0x43a1,1107,1, --Grenade 
         0x30a8,552,1,  --Hachimaki 
         0x3128,833,1,  --Kenpogi
         0x32a8,424,1,  --Kyahan 
         0x1010,837,1,  --Potion
         0x31a8,458,1,  --Tekko
         0x3228,666,1,  --Sitabaki
         
         0x02c0,96,2,   --Bamboo Stick
         0x1037,736,2,  --Echo Drops
         
         0x1034,290,3,  --Antidote
         0x1036,2387,3, --Eye Drops
         0x349d,1150,3} --Leather Ring
 
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




