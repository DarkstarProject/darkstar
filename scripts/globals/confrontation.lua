require("scripts/globals/common")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/zone")
-----------------------------------

dsp = dsp or {}
dsp.confrontation = dsp.confrontation or {}

dsp.confrontation.start = function(player, npc, mobId, onWinFunc)
    local mobs = {}
    if type(mobId) == "number" then
        table.insert(mobs, mobId)
    elseif type(mobId) == "table" then
        for _, v in pairs(mobId) do
            if type(v) == "number" then
                table.insert(mobs, v)
            end
        end
    end

    for k, v in pairs(mobs) do
        local mob = GetMobByID(v)
        if mob == nil or mob:isSpawned() then
            return false
        else
            mobs[k] = mob
        end
    end

    local party = player:getParty()
    for _, member in ipairs(party) do
        member:addStatusEffect(dsp.effect.CONFRONTATION, player:getID(), 0, 0)
    end

    for _, mob in pairs(mobs) do
        mob:addStatusEffect(dsp.effect.CONFRONTATION, player:getID(), 0, 0)

        local myId = mob:getID()
        mob:addListener("DESPAWN", "CON_"..myId, function(m)
            m:removeListener("CON_"..myId)

            for _, v in pairs(mobs) do
                if v:isAlive() then
                    return false
                end
            end
            -- TODO: Fire mob death logic func here
        end)
    end
    
    npcUtil.popFromQM(player, npc, mobId, { look=true, hide=0 })

    -- TODO: Tie these correctly to mob death
    if type(onWinFunc) == "function" then
        onWinFunc(player)
    end
    for _, member in ipairs(party) do
        member:delStatusEffect(dsp.effect.CONFRONTATION, player:getID(), 0, 0)
    end
end