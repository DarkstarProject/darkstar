-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Kasaroro
-- Type: Consulate Representative
-- Involved in Mission: 2-3 Windurst
-- !pos -72 -3 34 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
            player:messageSpecial(ID.text.FLYER_REFUSED);
        end
    end

end;

function onTrigger(player,npc)

    pNation = player:getNation();
    if (pNation == dsp.nation.WINDURST) then
        currentMission = player:getCurrentMission(pNation);
        MissionStatus = player:getCharVar("MissionStatus");

        if (currentMission == dsp.mission.id.windurst.THE_THREE_KINGDOMS) then
            if (MissionStatus == 2) then
                player:startEvent(546);
            elseif (MissionStatus == 6) then
                player:showText(npc,ID.text.KASARORO_DIALOG + 7);
            elseif (MissionStatus == 7) then
                player:startEvent(547);
            elseif (MissionStatus == 11) then
                player:showText(npc,ID.text.KASARORO_DIALOG + 20);
            end
        elseif (currentMission == dsp.mission.id.windurst.THE_THREE_KINGDOMS_SANDORIA) then
            if (MissionStatus == 3) then
                player:showText(npc,ID.text.KASARORO_DIALOG);
            elseif (MissionStatus == 4) then
                player:startEvent(549);
            elseif (MissionStatus == 5) then
                player:startEvent(550); -- done with Sandy first path, now go to bastok
            end
        elseif (currentMission == dsp.mission.id.windurst.THE_THREE_KINGDOMS_SANDORIA2) then
            if (MissionStatus == 8) then
                player:showText(npc,ID.text.KASARORO_DIALOG);
            elseif (MissionStatus == 10) then
                player:startEvent(551);
            end
        elseif (player:hasCompletedMission(WINDURST,dsp.mission.id.windurst.THE_THREE_KINGDOMS)) then
            player:startEvent(604);
        else
            player:startEvent(548);
        end
    else
        player:startEvent(548);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 546) then
        player:addMission(WINDURST,dsp.mission.id.windurst.THE_THREE_KINGDOMS_SANDORIA);
        player:delKeyItem(dsp.ki.LETTER_TO_THE_CONSULS_WINDURST);
        player:setCharVar("MissionStatus",3);
    elseif (csid == 550) then
        player:addMission(WINDURST,dsp.mission.id.windurst.THE_THREE_KINGDOMS);
        player:setCharVar("MissionStatus",6);
    elseif (csid == 547) then
        player:addMission(WINDURST,dsp.mission.id.windurst.THE_THREE_KINGDOMS_SANDORIA2);
        player:setCharVar("MissionStatus",8);
    elseif (csid == 551) then
        player:addMission(WINDURST,dsp.mission.id.windurst.THE_THREE_KINGDOMS);
        player:delKeyItem(dsp.ki.KINDRED_CREST);
        player:addKeyItem(dsp.ki.KINDRED_REPORT);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.KINDRED_REPORT);
        player:setCharVar("MissionStatus",11);
    end

end;