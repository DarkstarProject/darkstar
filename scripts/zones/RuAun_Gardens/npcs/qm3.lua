-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  ??? (Byakko's Spawn)
-- Allows players to spawn the HNM Byakko with a Gem of the West and an Autumnstone.
-- !pos -410 -70 394 130
-----------------------------------
package.loaded["scripts/zones/RuAun_Gardens/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/RuAun_Gardens/TextIDs");
require("scripts/zones/RuAun_Gardens/MobIDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
    -- Trade Gem of the West and Autumnstone
    if (not GetMobByID(BYAKKO):isSpawned() and trade:hasItemQty(1422,1) and trade:hasItemQty(1423,1) and trade:getItemCount() == 2) then
        player:tradeComplete();
        SpawnMob(BYAKKO):updateClaim(player);
        player:showText(npc,SKY_GOD_OFFSET + 11);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(SKY_GOD_OFFSET + 2);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
