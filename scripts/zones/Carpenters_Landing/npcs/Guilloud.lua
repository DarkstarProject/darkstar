-----------------------------------
--  Area: Carpenters' Landing
--  NPC:  Guilloud
--  Type: Standard NPC
--  @pos -123.770 -6.654 -469.062 2
-----------------------------------
package.loaded["scripts/zones/Carpenters_Landing/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   if (player:getCurrentMission(COP) == THE_ROAD_FORKS and player:getVar("EMERALD_WATERS_Status") == 4) then 
      SpawnMob(16785709,180):updateClaim(player);
   elseif (player:getCurrentMission(COP) == THE_ROAD_FORKS and player:getVar("EMERALD_WATERS_Status") == 5) then
      player:startEvent(0x0000);
   else
      player:startEvent(0x0001);
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
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0000) then
        player:setVar("EMERALD_WATERS_Status",6); 
    end
end;

