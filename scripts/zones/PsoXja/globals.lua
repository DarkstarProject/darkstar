-- Zone: PsoXja (9)
-- Desc: this file contains functions that are shared by multiple luas in this zone's directory

--[[..............................................................................................
    thief attempting to pick a lock on stone gate NPC during 5-3T1: Spiral
    correctSideOfDoor (boolean) true if player is trading from the near(gargoyle)-side of the gate
    ..............................................................................................]]
function attemptPickLock(player, npc, correctSideOfDoor)
    if (npc:getAnimation() == ANIMATION_CLOSE_DOOR and correctSideOfDoor) then
        local offset = npc:getID() - STONE_DOOR_OFFSET;
        local gargoyle = GARGOYLE_OFFSET + offset;

        if (GetMobByID(gargoyle):isSpawned()) then
            player:messageSpecial(DOOR_LOCKED);
        else
            if (math.random(1,2) == 1) then
                player:messageSpecial(DISCOVER_DISARM_FAIL + 0x8000, 0, 0, 0, 0, true); -- + 0x8000 and 6th param true makes it display player name in message.
                SpawnMob(gargoyle):updateClaim(player);
            else
                player:messageSpecial(DISCOVER_DISARM_SUCCESS + 0x8000, 0, 0, 0, 0, true);
                npc:openDoor(30);
            end
            player:tradeComplete();
        end
    end
end

--[[..............................................................................................
    player clicking on stone gate NPC during 5-3T1: Spiral
    correctSideOfDoor (boolean) true if player is clicking from the near(gargoyle)-side of gate
    ..............................................................................................]]
function attemptOpenDoor(player, npc, correctSideOfDoor)
    if (npc:getAnimation() == ANIMATION_CLOSE_DOOR) then
        if (correctSideOfDoor) then
            local offset = npc:getID() - STONE_DOOR_OFFSET;
            local gargoyle = GARGOYLE_OFFSET + offset;
            
            if (GetMobByID(gargoyle):isSpawned()) then
                player:messageSpecial(DOOR_LOCKED);
            else
                if (math.random(1,10) <= 9) then -- Spawn Gargoyle
                    player:messageSpecial(TRAP_ACTIVATED + 0x8000, 0, 0, 0, 0, true); -- + 0x8000 and 6th param true makes it display player name in message.
                    SpawnMob(gargoyle):updateClaim(player);
                else
                    player:messageSpecial(TRAP_FAILS + 0x8000, 0, 0, 0, 0, true);
                    npc:openDoor(30);
                end
            end
        else
            player:startEvent(26); -- return to beginning of spiral
        end
    end
end
