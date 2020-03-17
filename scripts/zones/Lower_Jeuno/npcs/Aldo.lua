-----------------------------------
-- Area: Lower Jeuno
--  NPC: Aldo
-- Involved in Mission: Magicite, Return to Delkfutt's Tower (Zilart)
-- !pos 20 3 -58 245
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
local ID = require("scripts/zones/Lower_Jeuno/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local ZilartMission = player:getCurrentMission(ZILART);
    local ZilartStatus = player:getCharVar("ZilartStatus");

    if (player:hasKeyItem(tpz.ki.LETTERS_TO_ALDO)) then
        player:startEvent(152);
    elseif (player:getCurrentMission(player:getNation()) == 13 and player:getCharVar("MissionStatus") == 3) then
        player:startEvent(183);
    elseif (ZilartMission == tpz.mission.id.zilart.RETURN_TO_DELKFUTTS_TOWER and ZilartStatus == 0) then
        player:startEvent(104);
    elseif (ZilartMission == tpz.mission.id.zilart.THE_SEALED_SHRINE and ZilartStatus == 1) then
        player:startEvent(111);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 152) then
        player:delKeyItem(tpz.ki.LETTERS_TO_ALDO);
        player:addKeyItem(tpz.ki.SILVER_BELL);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,tpz.ki.SILVER_BELL);
        player:setCharVar("MissionStatus",3);
    elseif (csid == 104) then
        player:setCharVar("ZilartStatus",1);
    end

end;