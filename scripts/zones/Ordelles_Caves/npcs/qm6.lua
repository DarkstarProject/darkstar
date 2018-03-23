-----------------------------------
-- Area: Ordelles Caves
--  NPC: ??? (qm6)
-- Involved In Quest: Dark Puppet
-- !pos -132 -27 -245 193
-----------------------------------
package.loaded["scripts/zones/Ordelles_Caves/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Ordelles_Caves/TextIDs");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
    -- DARK PUPPET: Gerwitz's Sword
    if ( player:getVar("darkPuppetCS") >= 4 and npcUtil.tradeHas(trade, 16940) ) then
        player:confirmTrade();
        player:messageSpecial(GERWITZS_SOUL_DIALOG);
        SpawnMob(DARK_PUPPET_OFFSET + 2):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
