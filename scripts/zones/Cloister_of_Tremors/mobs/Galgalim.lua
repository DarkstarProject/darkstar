-----------------------------------
-- Area: Cloister of Tremors
--  MOB: Galgalim
-- Involved in Quest: The Puppet Master
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    player:setVar("BCNM_Killed",1);
    record = 300;
    partyMembers = 6;
    pZone = player:getZoneID();

    player:startEvent(32001,0,record,0,(os.time() - player:getVar("BCNM_Timer")),partyMembers,0,0);

end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);
end;
