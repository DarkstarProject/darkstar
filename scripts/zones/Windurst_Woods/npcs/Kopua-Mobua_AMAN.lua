-----------------------------------
-- Area: Windurst Woods
--  NPC: Kopua-Mobua A.M.A.N.
-- Type: Mentor Recruiter
-- @pos -23.134 1.749 -67.284 241
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

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
    player:startEvent(0X272A, var);
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
    if (csid == 0X272A and option == 0) then
        player:setMentor(1);
    end
end;