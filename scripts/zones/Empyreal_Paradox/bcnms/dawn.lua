-----------------------------------
-- Area: Empyreal_Paradox
-- Name: dawn
-- instance 1 Promathia !pos -520 -119 524
-- instance 2 Promathia !pos 521 -0.500 517
-- instance 3 Promathia !pos -519 120 -520
-----------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/titles")
-----------------------------------

-- EXAMPLE SCRIPT
--
-- What should go here:
-- giving key items, playing ENDING cutscenes
--
-- What should NOT go here:
-- Handling of "battlefield" status, spawning of monsters,
-- putting loot into treasure pool,
-- enforcing ANY rules (SJ/number of people/etc), moving
-- chars around, playing entrance CSes (entrance CSes go in bcnm.lua)

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
    local promathia = ID.mob.PROMATHIA_OFFSET + (instance:getBattlefieldNumber() - 1) * 2
    local pos = GetMobByID(promathia):getSpawnPos()
    
    local prishe = instance:insertAlly(14166)
    prishe:setSpawn(pos.x - 6, pos.y, pos.z - 21.5, 192)
    prishe:spawn()
    
    local selhteus = instance:insertAlly(14167)
    selhteus:setSpawn(pos.x + 10, pos.y, pos.z - 17.5, 172)
    selhteus:spawn()
end

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
end

function onBcnmDestroy(instance)
end

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBcnmLeave(player,instance,leavecode)
    if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
        player:startEvent(6);
    elseif (leavecode == 4) then
        player:startEvent(32002)
    end
end

function onEventUpdate(player,csid,option)
end
    
function onEventFinish(player,csid,option)
    if (csid == 6) then
        player:setPos(539,0,-593,192);
        player:addTitle(dsp.title.AVERTER_OF_THE_APOCALYPSE)
        player:startEvent(3)
        if (player:getCurrentMission(COP) == dsp.mission.id.cop.DAWN and player:getVar("PromathiaStatus") == 2) then
            player:addKeyItem(dsp.ki.TEAR_OF_ALTANA)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.TEAR_OF_ALTANA)
            player:setVar("Promathia_kill_day", tonumber(os.date("%j")));
            player:setVar("PromathiaStatus", 3)
        end
    end
end
