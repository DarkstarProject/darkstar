-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Phillone
-- Involved in Quest: A Timely Visit
-------------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

function onTrade(player,npc,trade)

    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if FlyerForRegine == QUEST_ACCEPTED then
        local count = trade:getItemCount()
        local MagicFlyer = trade:hasItemQty(532,1)

        if MagicFlyer and count == 1 then
            player:messageSpecial(ID.text.FLYER_REFUSED)
        end
    end

end

function onTrigger(player,npc)

    local aTimelyVisit = player:getQuestStatus(SANDORIA, A_TIMELY_VISIT)
    local aTimelyVisitStep = player:getVar("aTimelyVisitStep")

    if aTimelyVisit == QUEST_ACCEPTED then
        if aTimelyVisitStep <= 2 then
            player:startEvent(29)
        elseif aTimelyVisitStep == 3 or aTimelyVisitStep == 4 then
            player:startEvent(26);  -- sorry I was crazy
        elseif aTimelyVisitStep == 5 then
            player:startEvent(78);  -- START: my house!
        elseif aTimelyVisitStep == 6 then
            player:startEvent(91);  -- find knight to save my family
        elseif aTimelyVisitStep == 7 or aTimelyVisitStep == 8 then
            player:startEvent(48);  -- go get scepter in forest
        elseif aTimelyVisitStep == 9 then
            player:startEvent(21);  -- figuring everything out
        elseif aTimelyVisitStep == 10 then
            player:startEvent(49);  -- save my family at ordelles
        elseif aTimelyVisitStep == 11 then
            player:startEvent(14)  -- quest completion
        end
    elseif aTimelyVisit == QUEST_COMPLETED then
        player:startEvent(28)  -- after quest complete
    else
        player:startEvent(29)
    end
    
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    --printf("onEventFinish CSID: %u",csid)
    --printf("onEventFinish OPTION: %u",option)

    if csid == 78 then
        player:setVar("aTimelyVisitStep", 6)
    elseif csid == 21 then
        player:setVar("aTimelyVisitStep", 10)
    elseif csid == 14 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 13163)
        else
            player:addItem(13163)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 13163)
            player:addTitle(dsp.title.OBSIDIAN_STORM)
            player:setVar("aTimelyVisitStep", 0)
            player:completeQuest(SANDORIA, A_TIMELY_VISIT)
        end
    end

end
