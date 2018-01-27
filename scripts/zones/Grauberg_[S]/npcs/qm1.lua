-----------------------------------
-- Area: Grauberg [S]
--  NPC: ???
--  Quest - DNC AF1
-----------------------------------
package.loaded["scripts/zones/Grauberg_[S]/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/harvesting");
require("scripts/zones/Grauberg_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    if (player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_ACCEPTED and player:getVar("QuestStatus_DNC_AF1")==2) then
        player:startEvent(12);

    elseif (player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_ACCEPTED and player:getVar("QuestStatus_DNC_AF1")==3) then
        if (GetMobAction(17142108) == 0) then
            SpawnMob(17142108):updateEnmity(player);
        end

    elseif (player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_ACCEPTED and player:getVar("QuestStatus_DNC_AF1")==4) then
        player:startEvent(13);
    end
end;

function onEventUpdate(player,csid,option)

end;

function onEventFinish(player,csid,option)
    if (csid==12) then
        player:setVar("QuestStatus_DNC_AF1", 3);

    elseif (csid==13) then
        player:addKeyItem(THE_ESSENCE_OF_DANCE);
        player:messageSpecial(KEYITEM_OBTAINED,THE_ESSENCE_OF_DANCE);
        player:setVar("QuestStatus_DNC_AF1", 5);
    end

end;