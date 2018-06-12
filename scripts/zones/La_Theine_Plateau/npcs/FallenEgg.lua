-----------------------------------
-- Area: La Theine Plateau
--  NPC: FallenEgg
-- Spawns NM Nihniknoovi
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/La_Theine_Plateau/globals");
require("scripts/zones/La_Theine_Plateau/TextIDs");
require("scripts/zones/La_Theine_Plateau/MobIDs");
-----------------------------------

function onTrigger(player,npc)
    local random = math.random(1,100);
    local nm = GetMobByID(NIHNIKNOOVI);
    if (random <= 20 and not nm:isSpawned()) then
        local x = npc:getXPos();
        local y = npc:getYPos();
        local z = npc:getZPos();
        nm:setSpawn(x,y,z);
        SpawnMob(NIHNIKNOOVI):updateClaim(player);
        LA_THEINE_PLATEAU.moveFallenEgg(1800);
    elseif (random > 20 and random <= 61) then
        player:messageSpecial(BROKEN_EGG);
        LA_THEINE_PLATEAU.moveFallenEgg(300);
    elseif(random > 61) then
        npcUtil.giveItem(player, 4570);         -- bird egg
        LA_THEINE_PLATEAU.moveFallenEgg(300);   -- moved whether the item is obtained or not, to counter abuse with a full inv
    end
end;
