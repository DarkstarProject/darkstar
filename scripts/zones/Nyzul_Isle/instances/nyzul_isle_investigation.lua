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

    if stage == (nyzul.objective.FREE_FLOOR or stage == nyzul.objective.ELIMINATE_ENEMY_LEADER or stage == nyzul.objective.ELIMINATE_SPECIFIED_ENEMY) and progress == 15 then
        instance:getEntity(bit.band(ID.npc.RUNE_TRANSFER, 0xFFF), dsp.objType.NPC):AnimationSub(1)
        for i,v in ipairs(chars) do
            v:messageSpecial(ID.text.OBJECTIVE_COMPLETE, instance:getEntity(bit.band(ID.npc.RUNE_TRANSFER_START, 0xFFF), dsp.objType.NPC):getLocalVar("[Nyzul_Current_Floor"))
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
    local FLOOR = START:getLocalVar("[Nyzul_Current_Floor")
    
    instance:setProgress(10)
    if math.random(1,30) == 10 then -- 3.33% of a free floor
        instance:setStage(nyzul.objective.FREE_FLOOR)
        TRANSFER:timer(3200, function(npc) instance:setProgress(15) end)
    elseif FLOOR == 20 or FLOOR == 40 or FLOOR == 60 or FLOOR == 80 then
        instance:setStage(nyzul.objective.ELIMINATE_ENEMY_LEADER)
        START:setLocalVar("[Nyzul_Isle]FloorLayout", 0)
    else
        instance:setStage(math.random(nyzul.objective.ELIMINATE_ENEMY_LEADER, nyzul.objective.ELIMINATE_ALL_ENEMIES))
    end
    for k, v in pairs(nyzul.FloorLayout) do
        if k == START:getLocalVar("[Nyzul_Isle]FloorLayout") then
            TRANSFER:setPos(v[1], v[2], v[3])
            TRANSFER:AnimationSub(0)
            pickMobs(player)
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
        end
    end
end

function pickMobs(player)
    local instance = player:getInstance()
    local START = instance:getEntity(bit.band(ID.npc.RUNE_TRANSFER_START, 0xFFF), dsp.objType.NPC)
    local FLOOR = START:getLocalVar("[Nyzul_Current_Floor")
    local MOB_FAMILY = math.random(1,16)
    local LAYOUT = START:getLocalVar("[Nyzul_Isle]FloorLayout")

    if instance:getStage() == nyzul.objective.ELIMINATE_ENEMY_LEADER then -- mobs for Enemy Leader Floors
        if FLOOR == 20 or FLOOR == 40 then
            local FLOOR_BOSS = math.random(nyzul.pickMobs[0][40].ADAMANTOISE, nyzul.pickMobs[0][40].FAFNIR)
            SpawnMob(FLOOR_BOSS, instance)
            SpawnMob(ID.mob[51].ARCHAIC_RAMPART1, instance)
            printf("spawned %s", FLOOR_BOSS)
        elseif FLOOR == 60 or FLOOR == 80 or FLOOR == 100 then
            local FLOOR_BOSS = math.random(nyzul.pickMobs[0][100].KHIMAIRA, nyzul.pickMobs[0][100].CERBERUS)
            SpawnMob(FLOOR_BOSS, instance)
            SpawnMob(ID.mob[51].RAMPART1, instance)
        else
            local FLOOR_BOSS = math.random(nyzul.pickMobs[1].MOKKE, nyzul.pickMobs[1].LONG_HORNED_CHARIOT)
            instance:getEntity(bit.band(FLOOR_BOSS, 0xFFF), dsp.objType.MOB):setSpawn(nyzul.SpawnPoint[LAYOUT][math.random(0,30)])
            SpawnMob(FLOOR_BOSS, instance)
            printf("boss %s",FLOOR_BOSS)
            for i = nyzul.FloorEntities[MOB_FAMILY].start, nyzul.FloorEntities[MOB_FAMILY].stop do
                instance:getEntity(bit.band(i, 0xFFF), dsp.objType.MOB):setSpawn(nyzul.SpawnPoint[LAYOUT][math.random(0,30)])
                SpawnMob(i, instance)
            end
        end
    end
     if instance:getStage() ~= nyzul.objective.FREE_FLOOR then -- mobs set for all floors but Free and enemy leader
        for i = nyzul.FloorEntities[MOB_FAMILY].start, nyzul.FloorEntities[MOB_FAMILY].stop do
            instance:getEntity(bit.band(i, 0xFFF), dsp.objType.MOB):setSpawn(nyzul.SpawnPoint[LAYOUT][math.random(0,30)])
            SpawnMob(i, instance)
        end
        if FLOOR >= 81 then
            local NM1 = math.random(nyzul.pickMobs[2][100].PANZER_PERCIVAL, nyzul.pickMobs[2][100].TAISAIJIN)
            local NM2 = math.random(nyzul.pickMobs[2][100].PANZER_PERCIVAL, nyzul.pickMobs[2][100].TAISAIJIN)
            if NM2 == NM1 then
                if NM2 == nyzul.pickMobs[2][100].TAISAIJIN then
                    NM2 = nyzul.pickMobs[2][100].TAISAIJIN - 1
                else
                    NM2 = NM1 + 1
                end
            end
        elseif FLOOR >= 61 then
            local NM1 = math.random(nyzul.pickMobs[2][80].GOLDEN_BAT, nyzul.pickMobs[2][80].TAISAIJIN)
            local NM2 = math.random(nyzul.pickMobs[2][80].GOLDEN_BAT, nyzul.pickMobs[2][80].TAISAIJIN)
            if NM2 == NM1 then
                if NM2 == nyzul.pickMobs[2][80].TAISAIJIN then
                    NM2 = nyzul.pickMobs[2][80].TAISAIJIN - 1
                else
                    NM2 = NM1 + 1
                end
            end
        elseif FLOOR >= 41 then
            local NM1 = math.random(nyzul.pickMobs[2][60].FUNGUS_BEETLE, nyzul.pickMobs[2][60].TAISAIJIN)
            local NM2 = math.random(nyzul.pickMobs[2][60].FUNGUS_BEETLE, nyzul.pickMobs[2][60].TAISAIJIN)
            if NM2 == NM1 then
                if NM2 == nyzul.pickMobs[2][60].TAISAIJIN then
                    NM2 = nyzul.pickMobs[2][60].TAISAIJIN - 1
                else
                    NM2 = NM1 + 1
                end
            end
        elseif FLOOR >= 21 then
            local NM1 = math.random(nyzul.pickMobs[2][40].OLD_TWO_WINGS, nyzul.pickMobs[2][40].TAISAIJIN)
            local NM2 = math.random(nyzul.pickMobs[2][40].OLD_TWO_WINGS, nyzul.pickMobs[2][40].TAISAIJIN)
            if NM2 == NM1 then
                if NM2 == nyzul.pickMobs[2][40].TAISAIJIN then
                    NM2 = nyzul.pickMobs[2][40].TAISAIJIN - 1
                else
                    NM2 = NM1 + 1
                end
            end
        else
            local NM1 = math.random(nyzul.pickMobs[2][20].BAT_EYE, nyzul.pickMobs[2][20].EMERGENT_ELM)
            local NM2 = math.random(nyzul.pickMobs[2][20].BAT_EYE, nyzul.pickMobs[2][20].EMERGENT_ELM)
            if NM2 == NM1 then
                if NM2 == nyzul.pickMobs[2][20].EMERGENT_ELM then
                    NM2 = nyzul.pickMobs[2][20].EMERGENT_ELM - 1
                else
                    NM2 = NM1 + 1
                end
            end
        end
        instance:getEntity(bit.band(NM1, 0xFFF), dsp.objType.MOB):setSpawn(nyzul.SpawnPoint[LAYOUT][math.random(0,30)])
        instance:getEntity(bit.band(NM2, 0xFFF), dsp.objType.MOB):setSpawn(nyzul.SpawnPoint[LAYOUT][math.random(0,30)])
        SpawnMob(NM1, instance)
        SpawnMob(NM2, instance)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
