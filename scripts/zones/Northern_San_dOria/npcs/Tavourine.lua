-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Tavourine
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
    player:showText(npc,TAVOURINE_SHOP_DIALOG);

    stock = {16584,37800,1, --Mythril Claymore 
             16466,2182,1,  --Knife
             17060,2386,1,  --Rod 

             16640,284,2,   --Bronze Axe
             16465,147,2,   --Bronze Knife 
             17081,621,2,   --Brass Rod
             16583,2448,2,  --Claymore 
             17035,4363,2,  --Mace 

             17059,90,3,    --Bronze Rod
             17034,169,3}   --Bronze Mace 
     
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



