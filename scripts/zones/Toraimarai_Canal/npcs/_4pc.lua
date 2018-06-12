-----------------------------------
-- Area: Toraimarai Canal
-- NPC:  Marble Door
-- Involved In Windurst Mission 7-1
-- !pos 132 12 -19 169
-----------------------------------
require("scripts/zones/Toraimarai_Canal/MobIDs");
require("scripts/globals/missions");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if player:getCurrentMission(WINDURST) == THE_SIXTH_MINISTRY or player:hasCompletedMission(WINDURST,THE_SIXTH_MINISTRY) then
        for i = HINGE_OILS_OFFSET, HINGE_OILS_OFFSET + 3 do
            if (not GetMobByID(i):isDead()) then
                player:startEvent(70,0,0,0,1); -- at least one hinge oil is alive
                return;
            end
        end
        player:startEvent(70,0,0,0,2); -- all four hinge oils are dead
    else
        player:startEvent(70);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
