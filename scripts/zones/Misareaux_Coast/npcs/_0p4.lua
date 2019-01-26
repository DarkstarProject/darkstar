-----------------------------------
-- Area: Misareaux Coast
--  NPC: Storage Compartment
--  COP spawn Boggelmann.
-----------------------------------
local ID = require("scripts/zones/Misareaux_Coast/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local cop = player:getCurrentMission(COP);
    
    if (cop == CALM_BEFORE_THE_STORM and not GetMobByID(ID.mob.BOGGELMANN):isSpawned() and player:getVar("COP_Boggelmann_KILL") == 0) then
        SpawnMob(ID.mob.BOGGELMANN):updateClaim(player);
    elseif (cop == CALM_BEFORE_THE_STORM and player:getVar("COP_Boggelmann_KILL") == 1) then
        player:startEvent(13);
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 13) then
        player:setVar("COP_Boggelmann_KILL",2);
        npcUtil.giveKeyItem(player, dsp.ki.VESSEL_OF_LIGHT_KI);
    end
end;
