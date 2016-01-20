-----------------------------------
-- Area: Metalworks
-- NPC:  Udine A.M.A.N
-- Type: Mentor Recruiter
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local var = 0;
    if (player:getMentor() == 0) then
        if (player:getMainLvl() >= 30 and player:getPlaytime() >= 648000) then
            var = 1;
        end
    elseif (player:getMentor() >= 1) then
        var = 2;
    end
    player:startEvent(0x033A, var);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0X033A and option == 0) then
        player:setMentor(1);
    end
end;
