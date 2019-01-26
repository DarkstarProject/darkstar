-----------------------------------
-- Area: Ordelles Caves
--  NPC: ??? (qm4)
-- Involved In Quest: Dark Puppet
-- !pos -52 27 -85 193
-----------------------------------
local ID = require("scripts/zones/Ordelles_Caves/IDs");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
    -- DARK PUPPET: Darksteel Ingot
    if ( player:getVar("darkPuppetCS") >= 2 and not player:hasItem(16681) and npcUtil.tradeHas(trade, 654) ) then
        player:confirmTrade();
        player:messageSpecial(ID.text.GERWITZS_AXE_DIALOG);
        SpawnMob(ID.mob.DARK_PUPPET_OFFSET):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
