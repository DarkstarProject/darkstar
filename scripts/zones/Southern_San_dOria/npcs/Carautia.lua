-----------------------------------
-- Area: Carautia
-- NPC: Southern San d'Oria
-- Standard Merchant NPC
-- @zone 230 
-- @pos 70 0 39
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

    player:showText(npc,CARAUTIA_SHOP_DIALOG);

    stock = {0x3208,11340,1,    --Chain Hose
             0x3288,6966,1,        --Greaves
             0x3012,10281,1,     --Kite Shield

             0x3004,4482,2,     --Mahogany Shield
             0x321a,16552,2,     --Studded Trousers
             0x329a,10054,2,     --Studded Boots

             0x3002,544,3,      --Maple Shield
             0x3220,187,3,      --Bronze Subligar
             0x3221,1800,3,     --Brass Subligar
             0x3218,482,3,         --Leather Trousers
             0x32a0,115,3,         --Bronze Leggings 
             0x32a1,1116,3,     --Brass Leggings
             0x3298,302,3}         --Leather Highboots
     
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




