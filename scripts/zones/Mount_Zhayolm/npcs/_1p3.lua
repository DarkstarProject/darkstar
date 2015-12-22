-----------------------------------
-- Area: Mount Zhayolm
-- Door: Runic Seal
-- @pos 703 -18 382 61
-----------------------------------

package.loaded["scripts/zones/Mount_Zhayolm/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/besieged");
require("scripts/zones/Mount_Zhayolm/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(LEBROS_ASSAULT_ORDERS)) then
        local assaultid = player:getCurrentAssault();
        local recommendedLevel = getRecommendedAssaultLevel(assaultid);
        local armband = 0;
        if (player:hasKeyItem(ASSAULT_ARMBAND)) then
            armband = 1;
        end
        player:startEvent(0x00CB, assaultid, -4, 0, recommendedLevel, 2, armband);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option,target)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    local assaultid = player:getCurrentAssault();
    
    local cap = bit.band(option, 0x03);
    if (cap == 0) then
        cap = 99;
    elseif (cap == 1) then
        cap = 70;
    elseif (cap == 2) then
        cap = 60;
    else
        cap = 50;
    end
    
    player:setVar("AssaultCap", cap);
                
    local party = player:getParty();
    
    if (party ~= nil) then
        for i,v in ipairs(party) do
            if (not (v:hasKeyItem(LEBROS_ASSAULT_ORDERS) and v:getCurrentAssault() == assaultid)) then
                player:messageText(target,MEMBER_NO_REQS, false);
                player:instanceEntry(target,1);
                return;
            elseif (v:getZoneID() == player:getZoneID() and v:checkDistance(player) > 50) then
                player:messageText(target,MEMBER_TOO_FAR, false);
                player:instanceEntry(target,1);
                return;
            end
        end
    end
    
    player:createInstance(player:getCurrentAssault(), 63);
    
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option,target)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
 
    if (csid == 0xD0 or (csid == 0xCB and option == 4)) then
        player:setPos(0,0,0,0,63);
    end
end;

-----------------------------------
-- onInstanceLoaded
-----------------------------------

function onInstanceCreated(player,target,instance)
    if (instance) then
        instance:setLevelCap(player:getVar("AssaultCap"));
        player:setVar("AssaultCap", 0);
        player:setInstance(instance);
        player:instanceEntry(target,4);
        player:delKeyItem(LEBROS_ASSAULT_ORDERS);
        player:delKeyItem(ASSAULT_ARMBAND);
        if (party ~= nil) then
            for i,v in ipairs(party) do
                if v:getID() ~= player:getID() and v:getZoneID() == player:getZoneID() then
                    v:setInstance(instance);
                    v:startEvent(0xD0, 2);
                    v:delKeyItem(LEBROS_ASSAULT_ORDERS);
                end
            end
        end
    else
        player:messageText(target,CANNOT_ENTER, false);
        player:instanceEntry(target,3);
    end
end;