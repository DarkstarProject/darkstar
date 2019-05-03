-----------------------------------
-- Area: Sealion's Den
-- Name: warriors_path
-- bcnmID : 993
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/battlefield")
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------
 --Tarutaru
--Tenzen                                                    group 860   3875
 --Makki-Chebukki (RNG) ,   16908311    16908315   16908319 group 853   2492
 --Kukki-Chebukki (BLM)     16908312    16908316   16908320 group 852   2293
 --Cherukiki (WHM).         16908313    16908317   16908321 group 851   710

--battlefield 1   !pos -780 -103 -90

--battlefield 2   !pos -140 -23 -450

--battlefield 3   !pos 500  56  -810


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
        player:addExp(1000);
        if (player:getCurrentMission(COP) == dsp.mission.id.cop.THE_WARRIOR_S_PATH) then
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
            player:setVar("PromathiaStatus",0);
            player:completeMission(COP,dsp.mission.id.cop.THE_WARRIOR_S_PATH);
            player:addMission(COP,dsp.mission.id.cop.GARDEN_OF_ANTIQUITY);
        else
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 1)
        end
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
           player:startEvent(32002);
    end

end;

function onEventUpdate(player,csid,option)
    -- print("bc update csid "..csid.." and option "..option);
end;

function onEventFinish(player,csid,option)
    -- print("bc finish csid "..csid.." and option "..option);
    if (csid == 32001) then
        player:setPos(-25,-1 ,-620 ,208 ,33);-- al'taieu
        player:addTitle(dsp.title.THE_CHEBUKKIS_WORST_NIGHTMARE);
    end
end;
