-----------------------------------
-- Area: Hall of the Gods
--  NPC: Cermet Gate
-- Gives qualified players access to Ru'Aun Gardens.
-- !pos 0 -12 48 251
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.CERULEAN_CRYSTAL) == false) then
        player:startEvent(1);
    else
        if (player:getCurrentMission(ZILART) == dsp.mission.id.zilart.THE_MITHRA_AND_THE_CRYSTAL) then
            player:startEvent(4); -- Zilart CS.
        else
            player:startEvent(2);
        end
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 1 and player:getCurrentMission(ZILART) == dsp.mission.id.zilart.THE_TEMPLE_OF_DESOLATION) then
        player:addTitle(dsp.title.SEALER_OF_THE_PORTAL_OF_THE_GODS);
        player:completeMission(ZILART,dsp.mission.id.zilart.THE_TEMPLE_OF_DESOLATION);
        player:addMission(ZILART,dsp.mission.id.zilart.THE_HALL_OF_THE_GODS);
    elseif (csid == 4) then
        player:setCharVar("ZilartStatus",0);
        player:completeMission(ZILART,dsp.mission.id.zilart.THE_MITHRA_AND_THE_CRYSTAL);
        player:addMission(ZILART,dsp.mission.id.zilart.THE_GATE_OF_THE_GODS);
    end

end;