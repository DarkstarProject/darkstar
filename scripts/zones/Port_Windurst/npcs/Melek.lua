-----------------------------------
-- Area: Port Windurst
--  NPC: Melek
-- Involved in Mission 2-3
-- !pos -80 -5 158 240
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Port_Windurst/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    pNation = player:getNation();

    if (player:getCurrentMission(BASTOK) ~= dsp.mission.id.bastok.NONE) then
        currentMission = player:getCurrentMission(pNation);

        if (pNation == dsp.nation.BASTOK) then
            missionStatus = player:getCharVar("MissionStatus");
            if (currentMission == dsp.mission.id.bastok.THE_EMISSARY) then
                -- Bastok Mission 2-3 Part I - Windurst > San d'Oria
                if (missionStatus == 1) then
                    player:startEvent(48);
                elseif (missionStatus == 7) then
                    player:showText(npc,ID.text.MELEK_DIALOG_C)
                -- Bastok Mission 2-3 Part II - San d'Oria > Windurst
                elseif (missionStatus == 6) then
                    player:startEvent(61);
                elseif (player:hasKeyItem(dsp.ki.KINDRED_REPORT)) then
                    player:startEvent(67);
                end
            -- Bastok Mission 2-3 Part I - Windurst > San d'Oria
            elseif (currentMission == dsp.mission.id.bastok.THE_EMISSARY_WINDURST) then
                if (missionStatus == 2) then
                    player:startEvent(49);
                elseif (player:hasKeyItem(dsp.ki.SWORD_OFFERING)) then
                player:startEvent(53);
                elseif (missionStatus <= 5) then
                    player:showText(npc,ID.text.MELEK_DIALOG_B)
                elseif (missionStatus == 6) then
                    player:startEvent(55);
                end
            -- Bastok Mission 2-3 Part II - San d'Oria > Windurst
            elseif (currentMission == dsp.mission.id.bastok.THE_EMISSARY_WINDURST2) then
                if (missionStatus == 7) then
                    player:startEvent(64);
                elseif (missionStatus == 8) then
                    player:showText(npc,ID.text.MELEK_DIALOG_A)
                elseif (player:hasKeyItem(dsp.ki.KINDRED_CREST)) then
                    player:startEvent(66);
                end
            else
                player:startEvent(42);
            end
        end
    else
        player:startEvent(42);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 48) then
        player:addMission(BASTOK,dsp.mission.id.bastok.THE_EMISSARY_WINDURST);
        player:setCharVar("MissionStatus",2);
        player:delKeyItem(dsp.ki.LETTER_TO_THE_CONSULS_BASTOK);
    elseif (csid == 53) then
        player:addKeyItem(dsp.ki.DULL_SWORD)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.DULL_SWORD);
        player:setCharVar("MissionStatus",4);  --> Gideus next
        player:delKeyItem(dsp.ki.SWORD_OFFERING) -- remove sword offering
    elseif (csid == 55) then
        player:addMission(BASTOK,dsp.mission.id.bastok.THE_EMISSARY);
        player:setCharVar("MissionStatus",7); -- to Sandy now
    elseif (csid == 61) then
        player:addMission(BASTOK,dsp.mission.id.bastok.THE_EMISSARY_WINDURST2);
        player:setCharVar("MissionStatus",7);
    elseif (csid == 66) then
        player:addMission(BASTOK,dsp.mission.id.bastok.THE_EMISSARY);
        player:addKeyItem(dsp.ki.KINDRED_REPORT)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.KINDRED_REPORT);
        player:setCharVar("MissionStatus",10);  -- return to Bastok
        player:delKeyItem(dsp.ki.KINDRED_CREST)
    end

end;