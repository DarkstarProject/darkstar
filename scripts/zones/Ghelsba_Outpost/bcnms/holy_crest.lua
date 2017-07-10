-----------------------------------
-- Area: Ghelsba Outpost
-- Name: Holy Crest - DRG flag quest
-- @pos -162 -11 78 140
-----------------------------------
package.loaded["scripts/zones/Ghelsba_Outpost/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/pets");
require("scripts/zones/Ghelsba_Outpost/TextIDs");

-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBcnmLeave(player,instance,leavecode)
-- print(leave code ..leavecode);
    
    if (leavecode == 2) then --play end CS. Need time and battle id for record keeping + storage
        if (player:getQuestStatus(SANDORIA,THE_HOLY_CREST) == QUEST_ACCEPTED) then
            player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,1,0);
        else
            player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,1,1);
        end
    elseif (leavecode == 4) then
        player:startEvent(0x7d02);
    end
    
end;

function onEventUpdate(player,csid,option)
-- print(bc update csid ..csid.. and option ..option);
end;
    
function onEventFinish(player,csid,option)
-- print("bc finish csid: "..csid.."and option: "..option);
    
    if (csid == 0x7d01 and option ~= 0 and player:hasKeyItem(DRAGON_CURSE_REMEDY) == true) then
        player:addTitle(HEIR_TO_THE_HOLY_CREST);
        player:delKeyItem(DRAGON_CURSE_REMEDY);
        player:unlockJob(14);
        player:messageSpecial(YOU_CAN_NOW_BECOME_A_DRAGOON);
        player:setVar("TheHolyCrest_Event",0);
        player:addFame(SANDORIA,30);
        player:completeQuest(SANDORIA,THE_HOLY_CREST);
        player:setPetName(PETTYPE_WYVERN,option+1);
    end
    
end;