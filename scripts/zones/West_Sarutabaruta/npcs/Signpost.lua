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

    if (npc:getID() == 17248792) or (npc:getID() == 17248793) then
        player:messageSpecial(SIGN_1);
    elseif (npc:getID() == 17248794) or (npc:getID() == 17248795) then
        player:messageSpecial(SIGN_3);
    elseif (npc:getID() == 17248796) or (npc:getID() == 17248797) then
        player:messageSpecial(SIGN_5);
    elseif (npc:getID() == 17248798) or (npc:getID() == 17248799) then
        player:messageSpecial(SIGN_7);
    elseif (npc:getID() == 17248800) or (npc:getID() == 17248801) then
        player:messageSpecial(SIGN_9);
    elseif (npc:getID() == 17248802) or (npc:getID() == 17248803) then
        player:messageSpecial(SIGN_11);
    elseif (npc:getID() == 17248804) or (npc:getID() == 17248805) then
        player:messageSpecial(SIGN_13);
    elseif (npc:getID() == 17248806) or (npc:getID() == 17248807) then
        player:messageSpecial(SIGN_15);
    elseif (npc:getID() == 17248808) or (npc:getID() == 17248809) then
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