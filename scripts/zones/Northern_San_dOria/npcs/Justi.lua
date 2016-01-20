-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Justi
-- Conquest depending furniture seller
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
    
    player:showText(npc,JUSTI_SHOP_DIALOG);

    stock = {0x0037,69888,1,  --Cabinet
             0x003b,57333,1,  --Chiffonier
             0x0020,170726,1, --Dresser

             0x0031,35272,2,  --Coffer

             0x002e,8376,3,      --Armor Box
             0x0679,92,3,      --Bundling Twine
             0x0039,15881,3,  --Cupboard
             0x0018,129168,3, --Oak Table
             0x005d,518,3}    --Water Cask

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



