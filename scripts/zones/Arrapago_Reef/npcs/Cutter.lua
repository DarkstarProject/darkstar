-----------------------------------
-- Area: Arrapago Reef
--  NPC: Cutter
-- The ship for The Black Coffin Battle (TOAU-15)
-- !pos -462 -2 -394 54
-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if (player:getCurrentMission(TOAU) == THE_BLACK_COFFIN and player:hasKeyItem(dsp.ki.EPHRAMADIAN_GOLD_COIN)) then
        player:startEvent(221, 53, -6, 0, 99, 6, 0)
    else
        player:messageSpecial(ID.text.YOU_NO_REQS)
    end
end

function onEventUpdate(player,csid,option,target)

    if(csid == 221) then
        local party = player:getParty()
        if (party ~= nil) then
            for i,v in ipairs(party) do
                if (not (v:hasKeyItem(dsp.ki.EPHRAMADIAN_GOLD_COIN))) then
                    player:messageText(target,ID.text.MEMBER_NO_REQS, false);
                    player:instanceEntry(target,1);
                    return
                elseif (v:getZoneID() == player:getZoneID() and v:checkDistance(player) > 50) then
                    player:messageText(target,ID.text.MEMBER_TOO_FAR, false);
                    player:instanceEntry(target,1);
                    return
                end
            end
        end

        player:createInstance(53,60)
    end
end

function onEventFinish(player,csid,option)

    if (csid == 221 and option == 4) or csid == 90 then
        player:setPos(0,0,0,0,60)
    end
end

function onInstanceCreated(player,target,instance)
    if (instance) then
        player:setInstance(instance)
        player:instanceEntry(target,4)

        local party = player:getParty()
        if (party ~= nil) then
            for i,v in ipairs(party) do
                if v:getID() ~= player:getID() and v:getZoneID() == player:getZoneID() then
                    v:setInstance(instance)
                    v:startEvent(90) -- wrong csid, yet better than nothing
                end
            end
        end
    else
        player:messageText(target,ID.text.CANNOT_ENTER, false);
        player:instanceEntry(target,3);
    end
end