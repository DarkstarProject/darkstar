-----------------------------------
-- Area: Batallia Downs [S]
--  NPC: Cavernous Maw
-- !pos -48 0 435 84
-- Teleports Players to Batallia Downs
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
    elseif (hasMawActivated(player,0) == false) then
        player:startEvent(100);
    else
        player:startEvent(101);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 100 and option == 1) then
        player:addNationTeleport(dsp.teleport.nation.MAW,1);
        dsp.teleport.toMaw(player,2);
    elseif (csid == 101 and option == 1) then
        dsp.teleport.toMaw(player,2);
    elseif (csid == 701) then
        player:completeMission(WOTG, BACK_TO_THE_BEGINNING);
        player:addMission(WOTG, CAIT_SITH);
        player:addTitle(dsp.title.CAIT_SITHS_ASSISTANT);
        if (hasMawActivated(player,0) == false) then
            player:addNationTeleport(dsp.teleport.nation.MAW,1);
        end
        dsp.teleport.toMaw(player,2);
    end

end;