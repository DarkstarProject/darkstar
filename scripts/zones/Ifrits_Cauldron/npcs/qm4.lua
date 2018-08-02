-----------------------------------
-- Area: Ifrit's Cauldron
--  NPC: ???
-- Involved in Mission: Bastok 6-2
-- !pos 171 0 -25 205
-----------------------------------
local ID = require("scripts/zones/Ifrits_Cauldron/IDs");
require("scripts/globals/missions");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    -- Adaman Ore: spawn Salamander and Magma for The Pirate's Cove
    if (
        player:getCurrentMission(BASTOK) == THE_PIRATE_S_COVE and
        player:getVar("MissionStatus") == 2 and
        npcUtil.tradeHas(trade, 646) and
        not GetMobByID(ID.mob.PIRATES_COVE_NMS):isSpawned() and
        not GetMobByID(ID.mob.PIRATES_COVE_NMS + 1):isSpawned()
    ) then
        player:confirmTrade();
        SpawnMob(ID.mob.PIRATES_COVE_NMS):lookAt(player:getPos()); -- Salamander
        SpawnMob(ID.mob.PIRATES_COVE_NMS + 1):updateClaim(player); -- Magma
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
