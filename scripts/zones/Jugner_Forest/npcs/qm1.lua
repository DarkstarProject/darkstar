-----------------------------------
-- Area: Jugner Forest
--  NPC: qm1 (???)
-- Involved in Quest: A Timely Visit
-- !pos -310.882 -0.139 407.377
-----------------------------------
local ID = require("scripts/zones/Jugner_Forest/IDs")
require("scripts/globals/settings")
require("scripts/globals/quests")
-----------------------------------

function onTrigger(player, npc)
    local aTimelyVisit = player:getQuestStatus(SANDORIA, A_TIMELY_VISIT)
    local aTimelyVisitStep = player:getVar("aTimelyVisitStep")
    local time = VanadielHour()

    if time >= 18 or time < 6 then
        if aTimelyVisit == QUEST_ACCEPTED and aTimelyVisitStep == 7 then
            player:showText(npc, ID.text.A_TIMELY_VISIT_3)
            SpawnMob(ID.mob.GIOLLEMITTE_B_FEROUN)
            SpawnMob(ID.mob.SKELETON_ESQUIRE)
        elseif aTimelyVisit == QUEST_ACCEPTED and aTimelyVisitStep == 8 then
            player:startEvent(18)
        else
            player:showText(npc, ID.text.A_TIMELY_VISIT_1)
        end
    else
        -- Can still activate cutsene outside of time window.
        if aTimelyVisit == QUEST_ACCEPTED and aTimelyVisitStep == 8 then
            player:startEvent(18)
        elseif aTimelyVisit ~= QUEST_ACCEPTED then
            player:showText(npc, ID.text.A_TIMELY_VISIT_1)
        else
            player:showText(npc, ID.text.A_TIMELY_VISIT_2)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);

    if csid == 18 then
        player:setVar("aTimelyVisitStep", 9)
    end

end
