-----------------------------------
-- Area: Windurst Walls
--  Location: X:-81  Y:-9  Z:103
--  NPC: Raamimi
-- Working 100%
--  Involved in Quest: To Bee or Not to Bee?
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local ToBee = player:getQuestStatus(WINDURST,TO_BEE_OR_NOT_TO_BEE);
    local ToBeeOrNotStatus = player:getVar("ToBeeOrNot_var");

    if (ToBeeOrNotStatus == 10 and ToBee == QUEST_AVAILABLE) then
        player:startEvent(67); -- Quest Started - He gives you honey
    elseif (ToBee == QUEST_ACCEPTED) then
        player:startEvent(68); -- After honey is given to player...... but before 5th hondy is given to Zayhi
    elseif (ToBee == QUEST_COMPLETED and ToBeeOrNotStatus == 5) then
        player:startEvent(80); -- Quest Finish - Gives Mulsum
    elseif (ToBee == QUEST_COMPLETED and ToBeeOrNotStatus == 0 and player:needToZone()) then
        player:startEvent(79); -- After Quest but before zoning "it's certainly gotten quiet around here..."
    else
        player:startEvent(296);
    end
end;

-- Event ID List for NPC
--  player:startEvent(296); -- Standard Conversation
--  player:startEvent(67); -- Quest is kicked off already, he gives you honey
-- player:startEvent(68); -- After honey is given to player...... before given to Zayhi????
--  player:startEvent(80); -- Quest Finish - Gives Mulsum
--  player:startEvent(79); -- After Quest but before zoning: "it's certainly gotten quiet around here..."


function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);

    if (csid == 67) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4370); -- Cannot give Honey because player Inventory is full
        else
            player:addQuest(WINDURST,TO_BEE_OR_NOT_TO_BEE);
            player:addItem(4370);
            player:messageSpecial(ITEM_OBTAINED, 4370); -- Gives player Honey x1
        end
    elseif (csid == 80) then -- After Honey#5: ToBee quest Finish (tooth hurts from all the Honey)
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4156); -- Cannot give Mulsum because player Inventory is full
        else
            player:setVar("ToBeeOrNot_var",0);
            player:addItem(4156,3); -- Mulsum x3
            player:messageSpecial(ITEMS_OBTAINED, 4156,3);
            player:needToZone(true);
        end
    end
end;



