-----------------------------------
-- Area: Grauberg [S]
--  NPC: ???
--  Quest - Fires of Discontent
-- pos 258 33 516
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getQuestStatus(CRYSTAL_WAR,FIRES_OF_DISCONTENT) == QUEST_ACCEPTED and player:getVar("FiresOfDiscProg") == 3) then
        player:startEvent(11);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid==11) then
        player:setVar("FiresOfDiscProg",4);
    end
end;
