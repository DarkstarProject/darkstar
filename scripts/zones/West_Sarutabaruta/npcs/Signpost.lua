-----------------------------------
-- Area: West Sarutabaruta
-- NPC:  Signpost (18 total)
-----------------------------------
package.loaded["scripts/zones/West_Sarutabaruta/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/West_Sarutabaruta/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (npc:getID() == 17248844) or (npc:getID() == 17248845) then
        player:messageSpecial(SIGN_1);
    elseif (npc:getID() == 17248846) or (npc:getID() == 17248847) then
        player:messageSpecial(SIGN_3);
    elseif (npc:getID() == 17248848) or (npc:getID() == 17248849) then
        player:messageSpecial(SIGN_5);
    elseif (npc:getID() == 17248850) or (npc:getID() == 17248851) then
        player:messageSpecial(SIGN_7);
    elseif (npc:getID() == 17248852) or (npc:getID() == 17248853) then
        player:messageSpecial(SIGN_9);
    elseif (npc:getID() == 17248854) or (npc:getID() == 17248855) then
        player:messageSpecial(SIGN_11);
    elseif (npc:getID() == 17248856) or (npc:getID() == 17248857) then
        player:messageSpecial(SIGN_13);
    elseif (npc:getID() == 17248858) or (npc:getID() == 17248859) then
        player:messageSpecial(SIGN_15);
    elseif (npc:getID() == 17248860) or (npc:getID() == 17248861) then
        player:messageSpecial(SIGN_17);
    end
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
--print("CSID: %u",csid);
--print("RESULT: %u",option);
end;