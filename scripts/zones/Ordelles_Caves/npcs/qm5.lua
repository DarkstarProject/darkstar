-----------------------------------
-- Area: Ordelles Caves
--  NPC: ??? (qm5)
-- Involved In Quest: Dark Puppet
-- !pos -92 -28 -70 193
-----------------------------------
local ID = require("scripts/zones/Ordelles_Caves/IDs");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
    -- DARK PUPPET: Gerwitz's Axe
    if ( player:getVar("darkPuppetCS") >= 3 and not player:hasItem(16940) and npcUtil.tradeHas(trade, 16681) ) then
        player:confirmTrade();
        player:messageSpecial(ID.text.GERWITZS_SWORD_DIALOG);
        SpawnMob(ID.mob.DARK_PUPPET_OFFSET + 1):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
