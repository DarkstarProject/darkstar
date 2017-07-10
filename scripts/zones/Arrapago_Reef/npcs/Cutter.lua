-----------------------------------
-- Area: Arrapago Reef
-- NPC: Cutter
-- The ship for The Black Coffin Battle (TOAU-15)
-- @pos -462 -2 -394 54
-----------------------------------

package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Arrapago_Reef/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(TOAU) == THE_BLACK_COFFIN and player:hasKeyItem(EPHRAMADIAN_GOLD_COIN)) then
        player:startEvent(221, 53, -6, 0, 99, 6, 0);
    else
        player:messageSpecial(YOU_NO_REQS);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option,target)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if(csid == 221) then
        local party = player:getParty();
        if (party ~= nil) then
            for i,v in ipairs(party) do
                if (not (v:hasKeyItem(EPHRAMADIAN_GOLD_COIN))) then
                    player:messageText(target,MEMBER_NO_REQS, false);
                    player:instanceEntry(target,1);
                    return;
                elseif (v:getZone() == player:getZone() and v:checkDistance(player) > 50) then
                    player:messageText(target,MEMBER_TOO_FAR, false);
                    player:instanceEntry(target,1);
                    return;
                end
            end
        end

        player:createInstance(53,60);
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if(csid == 221 and option == 4) then
        player:setPos(0,0,0,0,60);
    end
end;

-----------------------------------
-- onInstanceCreated
-----------------------------------

function onInstanceCreated(player,target,instance)
    if (instance) then        
        player:setInstance(instance);
        player:instanceEntry(target,4);

        if (party ~= nil) then
            for i,v in ipairs(party) do
                if v:getID() ~= player:getID() and v:getZone() == player:getZone() then
                    v:setInstance(instance);
                end
            end
        end
    else
        player:messageText(target,CANNOT_ENTER, false);
        player:instanceEntry(target,3);
    end
end;
