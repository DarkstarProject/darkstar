-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Fubruhn
-- Mog Locker NPC
--
-- Event IDs:
-- 0x0258 = Not a mercenary + mog locker options
-- 1st arg = Amount of time left on lease, as seconds past 2001/12/31 15:00:00.
--          If this is 0, it shows the not a mecenary message instead.
--          If this is -1, it shows the lease as expired.
-- 2nd arg = Valid areas, 0=alzahbi only, 1=all areas
-- 3rd arg = The number of earth days a lease extension is valid for (7)
-- 4th arg = How big your locker is
-- 5th arg =
-- 6th arg =
-- 7th arg =
-- 8th arg = The number of days your lease is currently valid for
--
-- 0x0259 = Lease increased
-- 1st arg = number of seconds from 2001/12/31 15:00:00 it is valid till.
--
-- 0x025A = Expansion increased
-- 4th arg = new size of locker
--
-----------------------------------
--package.loaded["scripts/globals/moglocker"] = nil;
require("scripts/globals/status")
require("scripts/globals/moglocker")

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local numBronze = trade:getItemQty(2184);
    local numMythril = trade:getItemQty(2186);
    local numGold = trade:getItemQty(2187);
    
    if (numBronze > 0) then
    print("Expand lease with "..numBronze.." bronze.");
        if (addMogLockerExpiryTime(player, numBronze)) then
            -- remove bronze
            -- send event
            print("Expanded lease with "..numBronze.." bronze.");
        end
    elseif (numGold > 0 or numMythril > 0) then
        -- see if we can expand the size
    end
    
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    -- TODO: Check if they are >= Mission 2 
    -- if < mission 2 then 
    --      player:startEvent(0x0258); 
    -- else
    
    local accessType = getMogLockerAccessType(player);
    local mogLockerExpiryTimestamp = getMogLockerExpiryTimestamp(player); 
    
    if (mogLockerExpiryTimestamp == nil) then
        -- a nil timestamp means they haven't unlocked it yet. We're going to unlock it by merely talking to this NPC.
        print("Unlocking mog locker for "..player:getName());
        mogLockerExpiryTimestamp = unlockMogLocker(player);
        accessType = setMogLockerAccessType(player, MOGLOCKER_ACCESS_TYPE_ALLAREAS);     
    end
    
    player:startEvent(0x0258,mogLockerExpiryTimestamp,accessType,
    MOGLOCKER_ALZAHBI_VALID_DAYS,player:getContainerSize(LOC_MOGLOCKER),
    0,0,0,
    MOGLOCKER_ALLAREAS_VALID_DAYS,0);
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("fCSID: %u",csid);
--printf("fRESULT: %u",option);
    if (csid == 600 and option == 3) then
        local accessType = player:getVar(MOGLOCKER_PLAYERVAR_ACCESS_TYPE);
        if (accessType == MOGLOCKER_ACCESS_TYPE_ALLAREAS) then
            -- they want to restrict their access to alzahbi only
            setMogLockerAccessType(player, MOGLOCKER_ACCESS_TYPE_ALZAHBI);
        elseif (accessType == MOGLOCKER_ACCESS_TYPE_ALZAHBI) then
            -- they want to expand their access to all areas.
            setMogLockerAccessType(player, MOGLOCKER_ACCESS_TYPE_ALLAREAS);
        else
            print("Unknown mog locker access type: "..accessType);
        end
    end
end;



