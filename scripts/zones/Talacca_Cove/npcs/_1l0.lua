-----------------------------------
-- Area: Talacca_Cove
-- NPC:  rock slab (corsair job flag quest)
-- !pos -99 -7 -91 57
-----------------------------------
package.loaded["scripts/zones/Talacca_Cove/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-----------------------------------
require("scripts/zones/Talacca_Cove/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/bcnm");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    LuckOfTheDraw = player:getVar("LuckOfTheDraw");

    if (LuckOfTheDraw ==4) then
        player:startEvent(3);
    elseif (EventTriggerBCNM(player,npc)) then
        return;
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);

    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);


    if (csid == 3) then -- complete corsair job flag quest
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,5493);
        else
            player:setVar("LuckOfTheDraw",5); -- var will remain for af quests
            player:addItem(5493);
            player:messageSpecial(ITEM_OBTAINED,5493);
            player:delKeyItem(FORGOTTEN_HEXAGUN);
            player:unlockJob(JOBS.COR);
            player:messageSpecial(YOU_CAN_NOW_BECOME_A_CORSAIR);
            player:completeQuest(AHT_URHGAN,LUCK_OF_THE_DRAW);
        end
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end

end;
