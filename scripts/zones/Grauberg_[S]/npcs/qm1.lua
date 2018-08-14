-----------------------------------
-- Area: Grauberg [S]
--  NPC: ???
--  Quest - DNC AF1
-----------------------------------
require("scripts/zones/Grauberg_[S]/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local tuw = player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ);
    local tuwStatus = player:getVar("QuestStatus_DNC_AF1");
    
    if (tuw == QUEST_ACCEPTED and tuwStatus == 2) then
        player:startEvent(12);
    elseif (tuw == QUEST_ACCEPTED and tuwStatus == 3 and not GetMobByID(MIGRATORY_HIPPOGRYPH):isSpawned()) then
        SpawnMob(MIGRATORY_HIPPOGRYPH):updateEnmity(player);
    elseif (tuw == QUEST_ACCEPTED and tuwStatus == 4) then
        player:startEvent(13);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid==12) then
        player:setVar("QuestStatus_DNC_AF1", 3);
    elseif (csid==13) then
        player:addKeyItem(dsp.ki.THE_ESSENCE_OF_DANCE);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.THE_ESSENCE_OF_DANCE);
        player:setVar("QuestStatus_DNC_AF1", 5);
    end
end;
