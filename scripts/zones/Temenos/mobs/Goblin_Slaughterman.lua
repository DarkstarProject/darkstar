-----------------------------------
-- Area: Temenos N T
--  Mob: Goblin Slaughterman
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID()
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()

    if mobID == 16928773 then
        GetNPCByID(16928768+18):setPos(330, 70, 468)
        GetNPCByID(16928768+18):setStatus(dsp.status.NORMAL)
        GetNPCByID(16928768+152):setPos(328, 70, 464)
        GetNPCByID(16928768+152):setStatus(dsp.status.NORMAL)
        GetNPCByID(16928768+209):setPos(332, 70, 470)
        GetNPCByID(16928768+209):setStatus(dsp.status.NORMAL)
    elseif mobID ==16928772 then
        GetNPCByID(GATE_OFFSET):setStatus(dsp.status.NORMAL)
    end
end
