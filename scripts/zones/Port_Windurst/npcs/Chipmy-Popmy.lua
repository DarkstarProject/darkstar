-----------------------------------
-- Area: Port Windurst
--  NPC: Chipmy-Popmy
-- Working 100%
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local currentday = tonumber(os.date("%j"));
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.DAWN and player:getVar("PromathiaStatus")==3 and player:getVar("Promathia_kill_day") ~= currentday and player:getVar("COP_3-taru_story")== 0 ) then
        player:startEvent(619);
    else
        player:startEvent(202);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 619) then
        player:setVar("COP_3-taru_story",1);
    end
end;
