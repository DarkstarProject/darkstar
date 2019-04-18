-----------------------------------
--
-- Assault 51 Nyzul Isle Investigation
--
-----------------------------------
local ID = require("scripts/zones/Nyzul_Isle/IDs")
require("scripts/globals/instance")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/zones/Nyzul_Isle/globals")
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance()
    player:messageSpecial(ID.text.TIME_TO_COMPLETE, instance:getTimeLimit())
end

function onInstanceCreated(instance)
end

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, ID.text)
end

function onInstanceFailure(instance)
    local chars = instance:getChars()

    for i,v in ipairs(chars) do
        v:messageSpecial(ID.text.MISSION_FAILED,10,10)
        v:startEvent(1)
    end
end

function onInstanceProgressUpdate(instance, progress)
    local chars = instance:getChars()
    local stage = instance:getStage()
    local ELMINATE = instance:getEntity(bit.band(ID.npc.RUNE_TRANSFER_START, 0xFFF), dsp.objType.NPC):getLocalVar("Eliminate")

    if stage == (nyzul.objective.FREE_FLOOR or stage == nyzul.objective.ELIMINATE_ENEMY_LEADER or stage == nyzul.objective.ELIMINATE_SPECIFIED_ENEMY) and progress == 15 then
        instance:getEntity(bit.band(ID.npc.RUNE_TRANSFER, 0xFFF), dsp.objType.NPC):AnimationSub(1)
        for i,v in ipairs(chars) do
            v:messageSpecial(ID.text.OBJECTIVE_COMPLETE, instance:getEntity(bit.band(ID.npc.RUNE_TRANSFER_START, 0xFFF), dsp.objType.NPC):getLocalVar("Nyzul_Current_Floor"))
        end
    elseif stage == (nyzul.objective.ELIMINATE_ALL_ENEMIES or stage == nyzul.objective.ELIMINATE_SPECIFIED_ENEMIES) and progress == ELMINATE then
        instance:getEntity(bit.band(ID.npc.RUNE_TRANSFER, 0xFFF), dsp.objType.NPC):AnimationSub(1)
        instance:getEntity(bit.band(ID.npc.RUNE_TRANSFER_START, 0xFFF), dsp.objType.NPC):setLocalVar("Eliminate", 0)
        for i,v in ipairs(chars) do
            v:messageSpecial(ID.text.OBJECTIVE_COMPLETE, instance:getEntity(bit.band(ID.npc.RUNE_TRANSFER_START, 0xFFF), dsp.objType.NPC):getLocalVar("Nyzul_Current_Floor"))
        end
    end
end

function onInstanceComplete(instance)

end

function pickSetPoint(player)
    local instance = player:getInstance()
    local chars = instance:getChars()
    local START = instance:getEntity(bit.band(ID.npc.RUNE_TRANSFER_START, 0xFFF), dsp.objType.NPC)
    local TRANSFER = instance:getEntity(bit.band(ID.npc.RUNE_TRANSFER, 0xFFF), dsp.objType.NPC)
    local FLOOR = START:getLocalVar("Nyzul_Current_Floor")
    
    START:setLocalVar("Nyzul_Isle_FloorLayout", math.random(1,16)) -- pick which floor layout
    if math.random(1,30) == 10 then -- 3.33% of a free floor
        instance:setStage(nyzul.objective.FREE_FLOOR)
        TRANSFER:timer(3200, function(npc) instance:setProgress(15) end)
    elseif FLOOR % 20 == 0 then -- hard set objective and floor to boss stage
        instance:setStage(nyzul.objective.ELIMINATE_ENEMY_LEADER)
        START:setLocalVar("Nyzul_Isle_FloorLayout", 0)
    else
        instance:setStage(math.random(nyzul.objective.ELIMINATE_ENEMY_LEADER, nyzul.objective.ELIMINATE_ALL_ENEMIES)) -- pick which objective
    end
    for k, v in pairs(nyzul.FloorLayout) do
        if k == START:getLocalVar("Nyzul_Isle_FloorLayout") then
            TRANSFER:setPos(v[1], v[2], v[3])
            TRANSFER:setStatus(dsp.status.NORMAL)
            local posX = v[1] local posY = v[2] local posZ = v[3]
            for i,v in pairs(chars) do
                v:timer(3200, function(player)
                v:setPos(posX + math.random(-2, 2), posY, posZ + math.random(-2, 2))
                v:messageSpecial(ID.text.WELCOME_TO_FLOOR, FLOOR) end)
                if instance:getStage() ~= nyzul.objective.FREE_FLOOR then
                    v:timer(3200, function(player)
                    v:messageSpecial(ID.text.ELIMINATE_ENEMY_LEADER + instance:getStage()) end)
                end
            end
            player:timer(4000, function(player) pickMobs(player) end)
        end
    end
end

function pickMobs(player)
    local instance = player:getInstance()
    local START = instance:getEntity(bit.band(ID.npc.RUNE_TRANSFER_START, 0xFFF), dsp.objType.NPC)
    local FLOOR = START:getLocalVar("Nyzul_Current_Floor")
    local MOB_FAMILY = math.random(1,16)
    local LAYOUT = START:getLocalVar("Nyzul_Isle_FloorLayout")

    if FLOOR % 20 == 0 then -- set bosses for 20th floors
        instance:getEntity(bit.band(ID.mob[51].ARCHAIC_RAMPART1, 0xFFF), dsp.objType.MOB):setSpawn(-36, 0, -362, 0)
        if FLOOR == 20 or FLOOR == 40 then
            local FLOOR_BOSS = math.random(nyzul.pickMobs[0][40].ADAMANTOISE, nyzul.pickMobs[0][40].FAFNIR)
            SpawnMob(FLOOR_BOSS, instance)
            SpawnMob(ID.mob[51].ARCHAIC_RAMPART1, instance)
        elseif FLOOR == 60 or FLOOR == 80 or FLOOR == 100 then
            local FLOOR_BOSS = math.random(nyzul.pickMobs[0][100].KHIMAIRA, nyzul.pickMobs[0][100].CERBERUS)
            SpawnMob(FLOOR_BOSS, instance)
            SpawnMob(ID.mob[51].ARCHAIC_RAMPART1, instance)
        end
    elseif instance:getStage() ~= nyzul.objective.FREE_FLOOR then -- mobs set for all floors but Free Floor and Boss Floors
        if instance:getStage() == nyzul.objective.ELIMINATE_ENEMY_LEADER then -- set mob for objective Enemy Leader
            local FLOOR_BOSS = math.random(nyzul.pickMobs[1].MOKKE, nyzul.pickMobs[1].LONG_HORNED_CHARIOT)
            instance:getEntity(bit.band(FLOOR_BOSS, 0xFFF), dsp.objType.MOB):setSpawn(nyzul.SpawnPoint[LAYOUT][math.random(0,#nyzul.SpawnPoint[LAYOUT])])
            SpawnMob(FLOOR_BOSS, instance)
        elseif instance:getStage() == nyzul.objective.ELIMINATE_SPECIFIED_ENEMIES then -- set mobs for Specified Groups
            local GROUP = math.random(0,6)
            for i = nyzul.pickMobs[3][GROUP].start, nyzul.pickMobs[3][GROUP].stop do
                instance:getEntity(bit.band(i, 0xFFF), dsp.objType.MOB):setSpawn(nyzul.SpawnPoint[LAYOUT][math.random(0,#nyzul.SpawnPoint[LAYOUT])])
                SpawnMob(i, instance)
                START:setLocalVar("Eliminate", START:getLocalVar("Eliminate") +1)
            end
        elseif instance:getStage() == nyzul.objective.ELIMINATE_SPECIFIED_ENEMY then -- set 1 random trash mob as NM
            START:setLocalVar("Nyzul_Specified_Enemy", math.random(nyzul.FloorEntities[MOB_FAMILY].start, nyzul.FloorEntities[MOB_FAMILY].stop))
        elseif instance:getStage() == nyzul.objective.ELIMINATE_ALL_ENEMIES then
            if math.random(0,100) >= 80 then -- 20% chance that Dahank will spawn
                SpawnMob(ID.mob[51].DAHAK, instance):setSpawn(nyzul.SpawnPoint[LAYOUT][math.random(0,#nyzul.SpawnPoint[LAYOUT])])
                START:setLocalVar("Eliminate", START:getLocalVar("Eliminate") +1)
            end
        end
        for i = nyzul.FloorEntities[MOB_FAMILY].start, nyzul.FloorEntities[MOB_FAMILY].stop do -- set rest of random trash mobs
            instance:getEntity(bit.band(i, 0xFFF), dsp.objType.MOB):setSpawn(nyzul.SpawnPoint[LAYOUT][math.random(0,#nyzul.SpawnPoint[LAYOUT])])
            SpawnMob(i, instance)
            if instance:getStage() == nyzul.objective.ELIMINATE_ALL_ENEMIES then
                START:setLocalVar("Eliminate", START:getLocalVar("Eliminate") +1)
            end
        end
        local NM_Floor = math.floor(FLOOR/20)
        local NM1 = math.random(nyzul.pickMobs[2][NM_Floor].start, nyzul.pickMobs[2][NM_Floor].stop)
        local NM2 = math.random(nyzul.pickMobs[2][NM_Floor].start, nyzul.pickMobs[2][NM_Floor].stop)
        if NM2 == NM1 then
            if NM2 == nyzul.pickMobs[2][NM_Floor].stop then
                NM2 = nyzul.pickMobs[2][NM_Floor].stop - 1
            else
                NM2 = NM1 + 1
            end
        end
        instance:getEntity(bit.band(NM1, 0xFFF), dsp.objType.MOB):setSpawn(nyzul.SpawnPoint[LAYOUT][math.random(0,#nyzul.SpawnPoint[LAYOUT])])
        instance:getEntity(bit.band(NM2, 0xFFF), dsp.objType.MOB):setSpawn(nyzul.SpawnPoint[LAYOUT][math.random(0,#nyzul.SpawnPoint[LAYOUT])])
        instance:getEntity(bit.band(ID.mob[51].ARCHAIC_RAMPART1, 0xFFF), dsp.objType.MOB):setSpawn(nyzul.SpawnPoint[LAYOUT][math.random(0,#nyzul.SpawnPoint[LAYOUT])])
        instance:getEntity(bit.band(ID.mob[51].ARCHAIC_RAMPART2, 0xFFF), dsp.objType.MOB):setSpawn(nyzul.SpawnPoint[LAYOUT][math.random(0,#nyzul.SpawnPoint[LAYOUT])])
        if math.random(0,100) >= 10 then -- 90% chance for 1st NM to spawn
            SpawnMob(NM1, instance)
            if instance:getStage() == nyzul.objective.ELIMINATE_ALL_ENEMIES then
                START:setLocalVar("Eliminate", START:getLocalVar("Eliminate") +1)
            end
        end
        if math.random(0,100) >= 50 then -- 50% chance for 2nd NM to spawn
            SpawnMob(NM2, instance)
            if instance:getStage() == nyzul.objective.ELIMINATE_ALL_ENEMIES then
                START:setLocalVar("Eliminate", START:getLocalVar("Eliminate") +1)
            end
        end
        if math.random(0,100) >= 90 then -- 90% chance for 1st rampart to spawn
            SpawnMob(ID.mob[51].ARCHAIC_RAMPART1, instance)
            if instance:getStage() == nyzul.objective.ELIMINATE_ALL_ENEMIES then
                START:setLocalVar("Eliminate", START:getLocalVar("Eliminate") +1)
            end
        end
        if math.random(0,100) >= 20 then -- 20% chance for 2nd rampart to spawn
            SpawnMob(ID.mob[51].ARCHAIC_RAMPART2, instance)
            if instance:getStage() == nyzul.objective.ELIMINATE_ALL_ENEMIES then
                START:setLocalVar("Eliminate", START:getLocalVar("Eliminate") +1)
            end
        end
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
