-----------------------------------
-- Area: The_Garden_of_RuHmet
-- NPC:  ??? (Ix'aern (Dark Knight) Spawn)
-- Allows players to spawn the Ix'aern (Dark Knight) by checking ??? only after killing the required mobs in the same room as the ???.
-- !pos -240 5.00 440 35
-- !pos -280 5.00 240 35
-- !pos -560 5.00 239 35
-- !pos -600 5.00 440 35
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/The_Garden_of_RuHmet/TextIDs");
require("scripts/zones/The_Garden_of_RuHmet/MobIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local hatedPlayer = npc:getLocalVar("hatedPlayer");
    local isInTime = npc:getLocalVar("hateTimer") > os.time();

    if (hatedPlayer ~= 0 and not isInTime) then
        -- player took too long, so reset animosity
        npc:setLocalVar("hatedPlayer",0);
        npc:setLocalVar("hateTimer",0);
        player:messageSpecial(UNKNOWN_PRESENCE);

    elseif (hatedPlayer == 0) then
        -- nobody has animosity
        player:messageSpecial(UNKNOWN_PRESENCE);

    elseif (hatedPlayer ~= player:getID()) then
        -- someone else has animosity
        player:messageSpecial(NONE_HOSTILE);

    elseif (hatedPlayer == player:getID()) then
        -- this player has animosity
        -- hide the QM, set its position to a random location, and reset animosity
        npc:setStatus(STATUS_DISAPPEAR);
        local qm2position = math.random(1,4);
        npc:setLocalVar("position",qm2position);
        npc:setPos(Ix_Aern_DRK_QM_POS[qm2position][1], Ix_Aern_DRK_QM_POS[qm2position][2], Ix_Aern_DRK_QM_POS[qm2position][3]);
        npc:setLocalVar("hatedPlayer",0);
        npc:setLocalVar("hateTimer",0);

        -- spawn Ix'Aern DRK and its two minions
        player:messageSpecial(MENACING_CREATURES);
        GetMobByID(IxAernDRK):setSpawn(player:getXPos(),player:getYPos(),player:getZPos()); -- Change MobSpawn to Players pos.
        SpawnMob(IxAernDRK):updateClaim(player);
        GetMobByID(QnAernA):setSpawn(player:getXPos(),player:getYPos(),player:getZPos()); -- Change MobSpawn to Players pos.
        SpawnMob(QnAernA):updateClaim(player);
        GetMobByID(QnAernB):setSpawn(player:getXPos(),player:getYPos(),player:getZPos()); -- Change MobSpawn to Players pos.
        SpawnMob(QnAernB):updateClaim(player);

    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
end;