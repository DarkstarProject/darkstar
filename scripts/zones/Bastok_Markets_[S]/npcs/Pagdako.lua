-----------------------------------
-- Area: Bastok Markets (S)
--  NPC: Pagdako
-- Quest NPC
-- pos -200 -6 -93
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR,dsp.quest.id.crystalWar.FIRES_OF_DISCONTENT) == QUEST_ACCEPTED) then
        if (player:getVar("FiresOfDiscProg") == 0) then
            player:startEvent(122);
        else
            player:startEvent(123);
        end
    else
        player:startEvent(106);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 122) then
        player:setVar("FiresOfDiscProg",1);
    end
end;
