-----------------------------------
-- Area: La Theine Plateau
--  NPC: FallenEgg
-- Spawns Nihniknoovi randomly at multiple pos, default listed below
-- !pos 211.066 24.147 257.961
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/La_Theine_Plateau/TextIDs");
require("scripts/globals/npc_util");
-----------------------------------

function onTrigger(player,npc)
    local random = math.random(1,100);
    local Nihniknoovi = 17195475;
    local X = npc:getXPos();
    local Y = npc:getYPos();
    local Z = npc:getZPos();

    -- Pick a new pos that isn't the current
    local newPosition = npcUtil.pickNewPosition(npc:getID(), fallenEggPositions);

    if (random <= 20 and GetMobAction(Nihniknoovi) == ACTION_NONE) then
        GetMobByID(Nihniknoovi):setSpawn(X,Y,Z);
        SpawnMob(Nihniknoovi):updateClaim(player);
        npc:hideNPC(1800); -- Hide for 30mins
        npc:setPos(newPosition.x, newPosition.y, newPosition.z);
    elseif (random > 20 and random <= 61) then
        player:messageSpecial(BROKEN_EGG);
        npc:hideNPC(300); -- Hide for 5mins
        npc:setPos(newPosition.x, newPosition.y, newPosition.z);
    elseif(random > 61) then
        if (player:getFreeSlotsCount() > 0) then
            if (player:addItem(4570)) then
                player:messageSpecial(ITEM_OBTAINED,4570);
            end
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4570);
        end
        -- this is executed on purpose whether the item is obtained or not, to counter abuse with a full inv
        npc:hideNPC(300); -- Hide for 5mins
        npc:setPos(newPosition.x, newPosition.y,newPosition.z);
    end
end;
