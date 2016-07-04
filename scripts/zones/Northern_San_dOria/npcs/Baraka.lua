-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Baraka
-- Involved in Missions 2-3
-- @pos 36 -2 -2 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getCurrentMission(BASTOK) ~= 255) then
        local missionStatus = player:getVar("MissionStatus");
        if (player:getCurrentMission(BASTOK) == THE_EMISSARY) then
            if (missionStatus == 1) then
                player:startEvent(581);
            elseif (missionStatus == 2) then
                player:showText(npc,11141);
            else
                player:startEvent(539);
            end
        end
    else
        local pNation = player:getNation();

        if (pNation == SANDORIA) then
            player:startEvent(580);
        elseif (pNation == WINDURST) then
            player:startEvent(579);
        else
            player:startEvent(539);
        end
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 581) then
        -- This cs should only play if you visit San d'Oria first
        -- If you visit Windurst first you will encounter Lion in Heaven's Tower instead
        if (player:getCurrentMission(BASTOK) == THE_EMISSARY 
        and player:getVar("MissionStatus") < 2) then
            player:setVar("MissionStatus",2);
            player:delKeyItem(LETTER_TO_THE_CONSULS_BASTOK);
        end
    end
end;
