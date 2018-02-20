-----------------------------------
-- Area: Castle Oztroja
--  NPC: Brass Statue
-- Type: Passageway Machine
-- !pos -60.061 -4.348 -61.538 151    (1)
-- !pos -18.599 -19.307 20.024 151    (2)
-- !pos -60 22 -100    151             (3)
-- !pos -100 -72 -19 151            (4)
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Castle_Oztroja/TextIDs");
require("scripts/zones/Castle_Oztroja/MobIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local Statue = npc:getID();

    if (Statue == FIRST_PASSWORD_STATUE) then
        player:messageSpecial(FIRST_WORD);
        player:messageSpecial(OZ_PASSWORD_TABLE[Oz_passwordSet][1][1]);
    elseif (Statue == SECOND_PASSWORD_STATUE) then
        player:messageSpecial(SECOND_WORD);
        player:messageSpecial(OZ_PASSWORD_TABLE[Oz_passwordSet][2][1]);
    elseif (Statue == THIRD_PASSWORD_STATUE) then
        player:messageSpecial(THIRD_WORD);
        player:messageSpecial(OZ_PASSWORD_TABLE[Oz_passwordSet][3][1]);
    elseif (Statue == FINAL_PASSWORD_STATUE) then
        player:startEvent(13);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    local passwordGuess = player:getLocalVar("passwordGuess");

    if (csid == 13 and option == OZ_PASSWORD_TABLE[Oz_passwordSet][1][2] and passwordGuess == 0) then
        player:updateEvent(1);
        player:setLocalVar("passwordGuess", 1);
    elseif (csid == 13 and option == OZ_PASSWORD_TABLE[Oz_passwordSet][2][2] and passwordGuess == 1) then
        player:updateEvent(2);
        player:setLocalVar("passwordGuess", 2);
    elseif (csid == 13 and option == OZ_PASSWORD_TABLE[Oz_passwordSet][3][2] and passwordGuess == 2) then
        player:updateEvent(3);
        player:setLocalVar("passwordGuess", 3);
    else
        player:messageSpecial(INCORRECT);
        player:setLocalVar("passwordGuess", 0);
    end
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    local passwordGuess = player:getLocalVar("passwordGuess");

    if (csid == 13 and passwordGuess == 3) then
        GetNPCByID(FINAL_PASSWORD_STATUE-1):openDoor(6);
        player:setLocalVar("passwordGuess", 0);
    end
end;