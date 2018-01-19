-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  Pincerstone
-- NPCs which activates the blue teleports in sky
-----------------------------------
package.loaded["scripts/zones/RuAun_Gardens/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/RuAun_Gardens/TextIDs");
require("scripts/zones/RuAun_Gardens/MobIDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
end; 

function onTrigger(player,npc)
    local npcId = npc:getID();
    local portalId = RUAUN_PINCERSTONES[npcId];
    if (portalId ~= nil) then
        local portal = GetNPCByID(portalId);
        if (portal:getAnimation() == ANIMATION_CLOSE_DOOR) then
            GetNPCByID(npcId - 1):openDoor(120);
            portal:openDoor(120);
        else
            player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
        end
    end
end; 

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
