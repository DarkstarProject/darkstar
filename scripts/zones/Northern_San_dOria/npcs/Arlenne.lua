-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Arlenne
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

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
    player:showText(npc,ARLENNE_SHOP_DIALOG);

    stock = {17051,1409,1,  --Yew Wand 
             17090,3245,1,  --Elm Staff  
             17097,16416,1, --Elm Pole 
             16835,15876,1, --Spear 
             16845,16578,1, --Lance 
             16770,11286,1, --Zaghnal 
            
             17050,333,2,   --Willow Wand 
             17089,571,2,   --Holly Staff 
             17096,4568,2,  --Holly Pole 
             16834,4680,2,  --Brass Spear  
             16769,2542,2,  --Brass Zaghnal 

             17049,46,3,    --Maple Wand 
             17088,57,3,    --Ash Staff 
             16833,792,3,   --Bronze Spear 
             16768,309,3}   --Bronze Zaghnal 
     
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



