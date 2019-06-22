-----------------------------------
-- Area: Ghelsba Outpost
-- Name: Holy Crest - DRG flag quest
-- !pos -162 -11 78 140
-----------------------------------
local ID = require("scripts/zones/Ghelsba_Outpost/IDs");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/pets");
require("scripts/globals/battlefield")

-----------------------------------

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBattlefieldRegister(player,battlefield)
end;

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
-- print(leave code ..leavecode);

    if leavecode == dsp.battlefield.leaveCode.WON then --play end CS. Need time and battle id for record keeping + storage
        local name, clearTime, partySize = battlefield:getRecord()
        if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.THE_HOLY_CREST) == QUEST_ACCEPTED) then
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
        else
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 1)
        end
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002);
    end

end;

function onEventUpdate(player,csid,option)
-- print(bc update csid ..csid.. and option ..option);
end;

function onEventFinish(player,csid,option)
-- print("bc finish csid: "..csid.."and option: "..option);

    if (csid == 32001 and option ~= 0 and player:hasKeyItem(dsp.ki.DRAGON_CURSE_REMEDY) == true) then
        player:addTitle(dsp.title.HEIR_TO_THE_HOLY_CREST);
        player:delKeyItem(dsp.ki.DRAGON_CURSE_REMEDY);
        player:unlockJob(dsp.job.DRG);
        player:messageSpecial(ID.text.YOU_CAN_NOW_BECOME_A_DRAGOON);
        player:setVar("TheHolyCrest_Event",0);
        player:addFame(SANDORIA,30);
        player:completeQuest(SANDORIA,dsp.quest.id.sandoria.THE_HOLY_CREST);
        player:setPetName(dsp.pet.type.WYVERN,option+1);
    end

end;
