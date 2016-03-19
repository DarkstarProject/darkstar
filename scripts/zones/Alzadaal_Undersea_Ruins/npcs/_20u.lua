-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Gilded Gateway (Arrapago)
-- @pos -580 0 -159 72
-----------------------------------

package.loaded["scripts/zones/Alzadaal_Undersea_Ruins/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/besieged");
require("scripts/zones/Alzadaal_Undersea_Ruins/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(REMNANTS_PERMIT)) then
        local mask = -2
        -- salvage2 NYI
        --[[if player:getMainLvl() >= 96 then
            mask = -14
        else]]if player:getMainLvl() >= 65 then
            mask = -6
        end

        player:startEvent(408, 0, mask, 0, 0, 8)
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
    -- 9 = arrapago, 54 = base salvage number
    local instanceid = bit.rshift(option, 19) + 64
    
    local party = player:getParty();
    
    if (party ~= nil) then
        for i,v in ipairs(party) do
            if (not v:hasKeyItem(REMNANTS_PERMIT)) then
                player:messageText(target,MEMBER_NO_REQS, false);
                player:instanceEntry(target,1);
                return;
            elseif (v:getZone() == player:getZone() and v:checkDistance(player) > 50) then
                player:messageText(target,MEMBER_TOO_FAR, false);
                player:instanceEntry(target,1);
                return;
            elseif (v:checkImbuedItems()) then
                player:messageText(target,MEMBER_IMBUED_ITEM, false);
                player:instanceEntry(target,1);
                return;
            end
        end
    end
    
    player:createInstance(instanceid, 74);
    
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option,target)
     -- printf("CSID: %u",csid);
     -- printf("RESULT: %u",option);
 
    if ((csid == 408 and option == 4) or csid == 0x74) then
        player:setPos(0,0,0,0,74);
    end
end;

-----------------------------------
-- onInstanceLoaded
-----------------------------------

function onInstanceCreated(player,target,instance)
    if (instance) then
        player:setInstance(instance);
        player:instanceEntry(target,4);
        player:delKeyItem(REMNANTS_PERMIT);
        if (party ~= nil) then
            for i,v in ipairs(party) do
                if v:getID() ~= player:getID() and v:getZone() == player:getZone() then
                    v:setInstance(instance);
                    v:startEvent(0x74, 8);
                    v:delKeyItem(REMNANTS_PERMIT);
                end
            end
        end
    else
        player:messageText(target,CANNOT_ENTER, false);
        player:instanceEntry(target,3);
    end
end;
