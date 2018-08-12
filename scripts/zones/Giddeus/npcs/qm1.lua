-----------------------------------
-- Area: Giddeus
--  NPC: ???
-- Involved In Quest: Dark Legacy
-- !pos -58 0 -449 145
-----------------------------------
package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Giddeus/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
    local darkLegacyCS = player:getVar("darkLegacyCS");

    if (
        (darkLegacyCS == 3 or darkLegacyCS == 4) and
        npcUtil.tradeHas(trade, 4445) and
        not GetMobByID(VAA_HUJA_THE_ERUDITE):isSpawned()
    ) then -- Yagudo Cherries
        player:confirmTrade();
        player:messageSpecial(SENSE_OF_FOREBODING);
        SpawnMob(VAA_HUJA_THE_ERUDITE):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    if (player:getVar("darkLegacyCS") == 5 and not player:hasKeyItem(dsp.ki.DARKSTEEL_FORMULA)) then
        npcUtil.giveKeyItem(player, dsp.ki.DARKSTEEL_FORMULA);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
