-----------------------------------
-- Area: Misareaux Coast
--  NPC: Dilapidated Gate
-- @pos 260 9 -435 25
-----------------------------------
package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Misareaux_Coast/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == AN_ETERNAL_MELODY and player:getVar("PromathiaStatus") == 1) then
        player:startEvent(0x0005);
    elseif (player:getCurrentMission(COP) == SHELTERING_DOUBT and player:getVar("PromathiaStatus") == 3) then
        player:startEvent(0x0007);
    elseif (player:getCurrentMission(COP) == A_PLACE_TO_RETURN  and player:getVar("PromathiaStatus") == 1) then
        if (player:getVar("Warder_Aglaia_KILL") == 1 and player:getVar("Warder_Euphrosyne_KILL") == 1 and player:getVar("Warder_Thalia_KILL") == 1) then
            player:startEvent(0x000A);
        elseif (GetMobAction(16879893) == 0 and GetMobAction(16879894) == 0 and GetMobAction(16879895) == 0) then
            SpawnMob(16879893,180):updateClaim(player);
            SpawnMob(16879894,180):updateClaim(player);
            SpawnMob(16879895,180):updateClaim(player);
        else
            player:messageSpecial(DOOR_CLOSED);
        end
    else
        player:messageSpecial(DOOR_CLOSED);
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
    if (csid == 0x0005) then
        player:setVar("PromathiaStatus",2);
    elseif (csid == 0x0007) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,SHELTERING_DOUBT);
        player:addMission(COP,THE_SAVAGE);
    elseif (csid == 0x000A) then
        player:setVar("PromathiaStatus",0);
        player:setVar("Warder_Aglaia_KILL",0);
        player:setVar("Warder_Euphrosyne_KILL",0);
        player:setVar("Warder_Thalia_KILL",0);
        player:completeMission(COP,A_PLACE_TO_RETURN);
        player:addMission(COP,MORE_QUESTIONS_THAN_ANSWERS);
    end
end;