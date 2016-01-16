-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Pirvidiauce
-- Conquest depending medicine seller
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
    player:showText(npc,PIRVIDIAUCE_SHOP_DIALOG);

    stock = {0x32ba,9180,1, --Chestnut Sabbots
             0x1020,4445,1,    --Ether
             0x1010,837,1,    --Potion

             0x43b8,6,2,    --Crossbow bolt
             0x1037,720,2,    --Echo Drops
             0x32b9,1462,2,    --Holly Clogs

             0x1034,284,3,    --Antidote
             0x32b8,111,3,    --Ash Clogs
             0x00db,900,3,    --Ceramic Flowerpot
             0x1036,2335,3,    --Eye Drops
             0x06ee,1984,3,    --Red Gravel
             0x43a6,3,3,    --Wooden Arrow
             0x0b2e,9200,3}    --Kingdom Waystone

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



