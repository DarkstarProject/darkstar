-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Runic Seal
-- @pos 125 -2 20 72
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
    -- See notes below
    player:setVar("NyzulLoopGuard",0); -- Reset Latch 1
    player:setVar("NyzulReady",0); -- Reset Latch 2

    if (player:getCurrentMission(TOAU) == PATH_OF_DARKNESS and player:hasKeyItem(NYZUL_ISLE_ROUTE) and player:getVar("AhtUrganStatus") == 1) then
        player:setVar("PathOfDarkness",1);
        player:startEvent(0x0195, 58, -6, 0, 99, 5, 0);
    elseif (player:getCurrentMission(TOAU) == NASHMEIRAS_PLEA and player:hasKeyItem(MYTHRIL_MIRROR) and player:getVar("AhtUrganStatus") == 1) then
        player:setVar("NashmeirasPlea",1);
        player:startEvent(0x0195, 59, -10, 0, 99, 5, 0);
    elseif (player:hasKeyItem(NYZUL_ISLE_ASSAULT_ORDERS)) then
        local assaultid = player:getCurrentAssault();
        local recommendedLevel = getRecommendedAssaultLevel(assaultid);
        local armband = 0;
        if (player:hasKeyItem(ASSAULT_ARMBAND)) then
            armband = 1;
        end
        player:startEvent(0x0195, assaultid, -4, 0, recommendedLevel, 5, armband);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option,target)
    -- printf("UPDATE CSID: %u",csid);
    -- printf("UPDATE RESULT: %u",option);

    if(not(csid == 0x0195)) then
        return;
    end

    -- Begin Ugly Hack
    --
    -- For some currently unknown reason, the Nyzul event can
    -- spam event updates uncontrollably. Until we can figure
    -- out why, I used a double lock to hack around it. The
    -- first latch is auto set here, which suppresses future
    -- updates which the instance is initialized. The 2nd latch
    -- is set after the instance is created. Then we use that
    -- to force terminate the event so that we can go into the
    -- instance successfully.
    local nyzulReady = player:getVar("NyzulReady");

    if(player:getVar("NyzulReady")==1) then -- Latch 2
        player:updateEvent(0x0195,3,3,3,3,3,3,3); -- Force terminate the event
        return;
    elseif(player:getVar("NyzulLoopGuard")==1) then
        return; -- Suppress Update Spam
    else
        player:setVar("NyzulLoopGuard",1); -- Latch 1
    end
    -- End Ugly Hack

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

    local pathOfDarkness = player:getVar("PathOfDarkness");
    local nashmeirasPlea = player:getVar("NashmeirasPlea");

    if(pathOfDarkness == 1) then
        local party = player:getParty();

        if (party ~= nil) then
            for i,v in ipairs(party) do
                if (v:getID() ~= player:getID()) then
                    if (v:hasKeyItem(NYZUL_ISLE_ROUTE) == false and v:hasCompletedMission(TOAU, PATH_OF_DARKNESS) == false) then
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
        end

        player:createInstance(58, 77);
    elseif(nashmeirasPlea == 1) then
        local party = player:getParty();

        if (party ~= nil) then
            for i,v in ipairs(party) do
                if (v:getID() ~= player:getID()) then
                    if (v:hasKeyItem(MYTHRIL_MIRROR) == false and v:hasCompletedMission(TOAU, NASHMEIRAS_PLEA) == false) then
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
        end

        player:createInstance(59, 77);
    else
        local party = player:getParty();

        if (party ~= nil) then
            for i,v in ipairs(party) do
                if (v:getID() ~= player:getID()) then
                    if (not (v:hasKeyItem(NYZUL_ISLE_ASSAULT_ORDERS) and v:getCurrentAssault() == assaultid)) then
                        print("NO REQS");
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
        end

        player:createInstance(player:getCurrentAssault(), 77);
    end

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option,target)
    -- printf("FINISH CSID: %u",csid);
    -- printf("FINISH RESULT: %u",option);

    if (csid == 0x195 and option == 1073741824 and player:getVar("NyzulReady") == 1) then
        player:startEvent(0x74, 2); -- This means the event was force terminated. Loop into the entrance animation.
    elseif (csid == 0x74 or (csid == 0x195 and option == 4) and not(option == 1073741824)) then
        player:setPos(0,0,0,0,77);
    end
end;

-----------------------------------
-- onInstanceLoaded
-----------------------------------

function onInstanceCreated(player,target,instance)
    local pathOfDarkness = player:getVar("PathOfDarkness");
    local nashmeirasPlea = player:getVar("NashmeirasPlea");

    if (instance) then
        if (pathOfDarkness == 1) then
            player:setVar("PathOfDarkness", 0);
            player:delKeyItem(NYZUL_ISLE_ROUTE);
        elseif (nashmeirasPlea == 1) then
            player:setVar("NashmeirasPlea", 0);
            player:delKeyItem(MYTHRIL_MIRROR);
        else
            instance:setLevelCap(player:getVar("AssaultCap"));
            player:setVar("AssaultCap", 0);
            player:delKeyItem(NYZUL_ISLE_ASSAULT_ORDERS);
            player:delKeyItem(ASSAULT_ARMBAND);
        end

        player:setInstance(instance);
        player:instanceEntry(target,4);

        if (party ~= nil) then
            for i,v in ipairs(party) do
                if v:getID() ~= player:getID() and v:getZone() == player:getZone() then
                    v:setInstance(instance);
                    v:startEvent(0x74, 2);

                    if (pathOfDarkness == 1) then
                        v:delKeyItem(NYZUL_ISLE_ROUTE);
                    elseif (nashmeirasPlea == 1) then
                        v:delKeyItem(MYTHRIL_MIRROR);
                    else
                        v:delKeyItem(NYZUL_ISLE_ASSAULT_ORDERS);
                    end
                end
            end
        end
    else
        player:messageText(target,CANNOT_ENTER, false);
        player:instanceEntry(target,3);
    end

    -- EventUpdate Hack: 2nd latch
    player:setVar("NyzulReady",1);
end;
