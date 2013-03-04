-----------------------------------
-- Area: Residential Area
-- NPC:  Moogle
-- 
-----------------------------------
require("scripts/globals/moglocker")

-- get the offset of:
-- Your Mog Locker lease is valid until XXXXX, kupo.?Prompt?
-- for a given zone.
function getMogLockerTextOffset(zone)
    if (zone == 50) then -- Whitegate
        return 1160;
    elseif (zone == 48) then -- Al Zahbi
        return 7318;
    elseif (zone == 245) then -- Lower Jeuno
        return 6706;
    elseif (zone == 244) then -- Upper Jeuno
        return 6689;
    elseif (zone == 246) then -- Port Jeuno
        return 6674;
    elseif (zone == 243) then -- Ru'Lude Gardens
        return 6635;
    elseif (zone == 230) then -- Southern San d'Oria
        return 6572;
    elseif (zone == 231) then -- Northern San d'Oria
        return 6730;
    end
    return 6600;
end

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
    local numBronze = trade:getItemQty(2184);
    if (numBronze > 0) then
        if (addMogLockerExpiryTime(player, numBronze)) then
            -- remove bronze
            player:tradeComplete();
            -- send event
            player:messageSpecial(getMogLockerTextOffset(player:getPreviousZone()) + 2,getMogLockerExpiryTimestamp(player));
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
  local lockerTs = getMogLockerExpiryTimestamp(player);
  if (lockerTs ~= nil) then
    if (lockerTs == -1) then -- expired
        player:messageSpecial(getMogLockerTextOffset(player:getPreviousZone()) + 1,2184); -- 2184 is imperial bronze piece item id
    else
        player:messageSpecial(getMogLockerTextOffset(player:getPreviousZone()),lockerTs);
    end
  end

  local loadintro = player:getVar("MoghouseExplication");
    if (loadintro == 1) then
      player:startEvent(0x7530);
    else
      player:sendMenu(1);
    end
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	if (csid == 0x7530) then
		player:setVar("MoghouseExplication",0);
	end
end;



