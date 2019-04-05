-----------------------------------
-- Area: Sauromugue Champaign [S]
--  NPC: Cavernous Maw
-- !pos 369 8 -227 98
-- Teleports Players to Sauromugue_Champaign
-----------------------------------
require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(WOTG) == BACK_TO_THE_BEGINNING and
        (player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.CLAWS_OF_THE_GRIFFON) == QUEST_COMPLETED or
         player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.THE_TIGRESS_STRIKES) == QUEST_COMPLETED or
         player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.FIRES_OF_DISCONTENT) == QUEST_COMPLETED)) then
        player:startEvent(701);
    elseif (hasMawActivated(player,2) == false) then
        player:startEvent(101);
    else
        player:startEvent(102);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 101 and option == 1) then
        player:addNationTeleport(dsp.teleport.nation.MAW,4);
        dsp.teleport.toMaw(player,6);
    elseif (csid == 102 and option == 1) then
        dsp.teleport.toMaw(player,6);
    elseif (csid == 701) then
        player:completeMission(WOTG, BACK_TO_THE_BEGINNING);
        player:addMission(WOTG, CAIT_SITH);
        player:addTitle(dsp.title.CAIT_SITHS_ASSISTANT);
        if (hasMawActivated(player,0) == false) then
            player:addNationTeleport(dsp.teleport.nation.MAW,4);
        end
        dsp.teleport.toMaw(player,6);
    end
end;