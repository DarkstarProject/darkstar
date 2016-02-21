-----------------------------------
--    Area: Port San d'Oria
--    NPC: Teilsa
--    Adventurer's Assistant
--    Only recieving Adv.Coupon and simple talk event are scrited
--    This NPC participates in Quests and Missions
-------------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Port_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade) 
    if (trade:getItemCount() == 1 and trade:hasItemQty(0x218,1) == true) then
        player:startEvent(0x0264);
        player:addGil(GIL_RATE*50);
        player:tradeComplete();
    end
-- "Flyers for Regine" conditional script
count = trade:getItemCount();
MagicFlyer = trade:hasItemQty(532,1);

    if (MagicFlyer == true and count == 1) then
        FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);
        if (FlyerForRegine == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
    player:startEvent(0x023d);
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
    if (csid == 0x0264) then
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*50);
    end
end;




