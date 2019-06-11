-----------------------------------
-- Area: Spire_of_Mea
-- Name: ancient_flames_backon
-- KSNM30
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/battlefield")
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
local ID = require("scripts/zones/Spire_of_Mea/IDs");

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
function onBattlefieldRegister(player,battlefield)
end;
function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBattlefieldEnter(player,battlefield)
    print("battlefield code ");
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBattlefieldLeave(player,battlefield,leavecode)
    -- printf("leavecode: %u",leavecode);

    if leavecode == dsp.battlefield.leaveCode.WON then -- play end CS. Need time and battle id for record keeping + storage
        local name, clearTime, partySize = battlefield:getRecord()
        if (player:getCurrentMission(COP) == dsp.mission.id.cop.THE_MOTHERCRYSTALS) then
            if (player:hasKeyItem(dsp.ki.LIGHT_OF_HOLLA) and player:hasKeyItem(dsp.ki.LIGHT_OF_DEM)) then 
                player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 0, battlefield:getLocalVar("[cs]bit"), 3)
            elseif (player:hasKeyItem(dsp.ki.LIGHT_OF_HOLLA) or player:hasKeyItem(dsp.ki.LIGHT_OF_DEM)) then 
                player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 0, battlefield:getLocalVar("[cs]bit"), 2) 
            end
        elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.BELOW_THE_ARKS) then
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 0, battlefield:getLocalVar("[cs]bit"), 1) 
        else
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 0, battlefield:getLocalVar("[cs]bit"), 1) -- can't tell which cs is playing when you're doing it again to help 
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
    
        if (player:getCurrentMission(COP) == dsp.mission.id.cop.THE_MOTHERCRYSTALS) then
    
            if (player:hasKeyItem(dsp.ki.LIGHT_OF_HOLLA) and player:hasKeyItem(dsp.ki.LIGHT_OF_DEM)) then
                player:addExp(1500);
                player:addKeyItem(dsp.ki.LIGHT_OF_MEA);
                player:messageSpecial(ID.text.CANT_REMEMBER,dsp.ki.LIGHT_OF_MEA);
                player:completeMission(COP,dsp.mission.id.cop.THE_MOTHERCRYSTALS);
                player:setVar("PromathiaStatus",0)
                player:addMission(COP,dsp.mission.id.cop.AN_INVITATION_WEST);
                player:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.LUFAISE,0,1);
            elseif (not(player:hasKeyItem(dsp.ki.LIGHT_OF_MEA))) then
                player:setVar("cspromy3",1)
                player:addKeyItem(dsp.ki.LIGHT_OF_MEA);
                player:addExp(1500);
                player:messageSpecial(ID.text.CANT_REMEMBER,dsp.ki.LIGHT_OF_MEA);
                player:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.EXITPROMMEA,0,1);
            end
        
        elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.BELOW_THE_ARKS) then
            player:addExp(1500);
            player:completeMission(COP,dsp.mission.id.cop.BELOW_THE_ARKS);
            player:addMission(COP,dsp.mission.id.cop.THE_MOTHERCRYSTALS)
            player:setVar("cspromy2",1)
            player:setVar("PromathiaStatus",0)
            player:addKeyItem(dsp.ki.LIGHT_OF_MEA);
            player:messageSpecial(ID.text.CANT_REMEMBER,dsp.ki.LIGHT_OF_MEA);
            player:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.EXITPROMMEA,0,1);
        else    
            player:addExp(1500);
            player:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.EXITPROMMEA,0,1);
        end
    end
end;