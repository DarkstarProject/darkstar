-----------------------------------
-- Area: Misareaux Coast
--  NPC: Storage Compartment
--  COP spawn Boggelmann.
-----------------------------------
package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Misareaux_Coast/TextIDs");
require("scripts/zones/Misareaux_Coast/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local cop = player:getCurrentMission(COP);
    
    if (cop == CALM_BEFORE_THE_STORM and not GetMobByID(BOGGELMANN):isSpawned() and player:getVar("COP_Boggelmann_KILL") == 0) then
        SpawnMob(BOGGELMANN):updateClaim(player);
    elseif (cop == CALM_BEFORE_THE_STORM and player:getVar("COP_Boggelmann_KILL") == 1) then
        player:startEvent(13);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 13) then
        player:setVar("COP_Boggelmann_KILL",2);
        npcUtil.giveKeyItem(player, VESSEL_OF_LIGHT_KI);
    end
end;
