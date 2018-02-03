-----------------------------------
-- Area: Misareaux Coast
--  NPC: Storage Compartment
--  COP spawn Boggelmann.
-----------------------------------
package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Misareaux_Coast/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == CALM_BEFORE_THE_STORM and GetMobAction(16879897) == 0 and player:getVar("COP_Boggelmann_KILL") == 0) then
      SpawnMob(16879897):updateClaim(player);
    elseif (player:getCurrentMission(COP) == CALM_BEFORE_THE_STORM and player:getVar("COP_Boggelmann_KILL") == 1) then
      player:startEvent(13);
    else
       player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 13) then
      player:setVar("COP_Boggelmann_KILL",2);
      player:addKeyItem(VESSEL_OF_LIGHT_KI);
      player:messageSpecial(KEYITEM_OBTAINED,VESSEL_OF_LIGHT_KI);
    end
end;