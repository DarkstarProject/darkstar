-----------------------------------
-- Area: Sealion's Den
-- Name: one_to_be_feared
-- bcnmID : 992
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/battlefield")
-----------------------------------
--battlefield 1   !pos -780 -103 -90
          -- >     -231              = lieux de combat
--battlefield 2   !pos -140 -23 -450
         --  >      -151             = lieux de combat
--battlefield 3   !pos 500  56  -810
         --  >    640  -71   -206           = lieux de combat


    --cs 0,battlefieldID= cs + teleportation     vers mamet
    --cs 1,battlefieldID= cs + teleportation     vers ultima
    --cs 2,battlefieldID= cs + teleportation     vers omega
    --cs 7 leave l'insctance
    -- cs 8 =>navire de guerre > retourner a tavnazia


-- After registering the BCNM via bcnmRegister(bcnmid)
function onBattlefieldRegister(player,battlefield)
end;
function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBattlefieldEnter(player,battlefield)
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBattlefieldLeave(player,battlefield,leavecode)


    if leavecode == dsp.battlefield.leaveCode.WON then -- play end CS. Need time and battle id for record keeping + storage
        local name, clearTime, partySize = battlefield:getRecord()
        if (player:getCurrentMission(COP) == ONE_TO_BE_FEARED and player:getVar("PromathiaStatus")==2) then
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
            player:setVar("PromathiaStatus",0)
            player:completeMission(COP,ONE_TO_BE_FEARED)
            player:addMission(COP,CHAINS_AND_BONDS)
        else
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 1)
        end
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
           player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 then
        player:addExp(1500)
        player:setPos(438, 0, -18, 11, 24) -- Lufaise
    end
end
